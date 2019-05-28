//
//  XYNoDataView.m
//  XYTableViewNoDataViewDemo
//
//  Created by 韩元旭 on 2017/11/3.
//  Copyright © 2017年 韩元旭. All rights reserved.
//

#import "XYNoDataView.h"

NSString * const kXYNoDataViewObserveKeyPath = @"frame";


@interface XYNoDataView()

@property (nonatomic ,strong) UILabel *desLabel;

@property (nonatomic ,strong) UIImageView *avatarImageView;

@property (nonatomic ,strong) UIImageView *nimingIdentifierView;

@end


@implementation XYNoDataView

- (instancetype)initWithWithframe:(CGRect)frame Title:(NSString *)title emUserName:(NSString *)emuserName avatar:(NSString *)avatar{
    if (self == [super initWithFrame:frame]) {
        [self loadSubViewWithTitle:title emUserName:emuserName avatar:avatar];
    }
    
    return self;
}
- (void)loadSubViewWithTitle:(NSString *)title emUserName:(NSString *)emuserName avatar:(NSString *)avatar{
    //  计算位置, 垂直居中, 图片默认中心偏上.
    CGFloat sW = self.bounds.size.width;
    CGFloat cX = sW / 2;
    CGFloat cY = self.bounds.size.height * (1 - 0.688) + 0;
    //    CGFloat iW = image.size.width;
    //    CGFloat iH = image.size.height;
    CGFloat iW = FCLengthTO750(115);
    CGFloat iH = FCLengthTO750(115);
    //  图片
    UIImageView *imgView = [[UIImageView alloc] init];
    //    imgView.frame        = CGRectMake(cX - iW / 2, cY - iH / 2, iW, iH);
//    imgView.image        = image;
    
    //  文字
    UILabel *label       = [[UILabel alloc] init];
    label.font           = [UIFont systemFontOfSize:17];
    label.textColor      = COLOR_S_WHITE;
    label.text           = title;
    label.textAlignment  = NSTextAlignmentCenter;
    //    label.frame          = CGRectMake(0, CGRectGetMaxY(imgView.frame) + 24, sW, label.font.lineHeight);
    weakObj(self)
    UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromCacheForKey:[avatar componentsSeparatedByString:@"?"][0]];
    if (!cacheImage) {
        [[[SDWebImageManager sharedManager] imageDownloader] downloadImageWithURL:[NSURL URLWithString:[avatar componentsSeparatedByString:@"?"][0]] options:SDWebImageDownloaderLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            
        } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
            strongObj(self)
           [imgView setImage:image];
            [[SDImageCache sharedImageCache] storeImage:image forKey:[avatar componentsSeparatedByString:@"?"][0] toDisk:YES completion:nil];
        }];
    }else{
        [imgView setImage:cacheImage];
    }
    
    label.frame          = CGRectMake(0, cY - iH / 2, sW, label.font.lineHeight);
//    label.backgroundColor = COLOR_S_RED;
    imgView.frame        = CGRectMake(cX - iW / 2, CGRectGetMaxY(label.frame) + 24, iW, iH);
    imgView.layer.cornerRadius = FCLengthTO750(115)/2;
    imgView.clipsToBounds = YES;
    //  视图

    UIImageView *smallView = [[UIImageView alloc] init];
    smallView.clipsToBounds = YES;
    smallView.layer.cornerRadius = FCLengthTO750(115)/8;
    smallView.frame = CGRectMake(CGRectGetMaxX(imgView.frame)-FCLengthTO750(115)/4, CGRectGetMinY(imgView.frame), FCLengthTO750(115)/4, FCLengthTO750(115)/4);
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.headerImageView.mas_right);
//        make.top.equalTo(self.headerImageView.mas_top);
//        make.size.mas_equalTo(CGSizeMake(height, height));
//    }];
    NSString *avatarName = [NSString stringWithFormat:@"avatar_nm_0%@",[MethodObject getAvatarStringWithString:emuserName]?[MethodObject getAvatarStringWithString:emuserName]:@"0"];
    [smallView setImage:FCGetImageWithName(avatarName)];
    imgView.layer.borderColor = [UIColor colorWithHexString:[MethodObject getColorStringWithOriginalString:emuserName]].CGColor;
    imgView.layer.borderWidth = 4.0f;
    
    self.avatarImageView = imgView;
    self.nimingIdentifierView = smallView;
    self.desLabel = label;
    [self addSubview:imgView];
    [self addSubview:label];
    [self addSubview:smallView];
    //  实现跟随 TableView 滚动
//    [self addObserver:self forKeyPath:kXYNoDataViewObserveKeyPath options:NSKeyValueObservingOptionNew context:nil];

    [super addObserver:self forKeyPath:kXYNoDataViewObserveKeyPath options:NSKeyValueObservingOptionNew context:nil];
}
- (void)removeobservers{
    [super removeObserver:self forKeyPath:kXYNoDataViewObserveKeyPath context:nil];
}
/**
 监听
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:kXYNoDataViewObserveKeyPath]) {
        
        /**
         在 TableView 滚动 ContentOffset 改变时, 会同步改变 backgroundView 的 frame.origin.y
         可以实现, backgroundView 位置相对于 TableView 不动, 但是我们希望
         backgroundView 跟随 TableView 的滚动而滚动, 只能强制设置 frame.origin.y 永远为 0
         兼容 MJRefresh
         */
        CGRect frame = [[change objectForKey:NSKeyValueChangeNewKey] CGRectValue];
        //        self.backgroundView.frame.size = frame.size;
        //        self.backgroundView.frame = CGRectMake(self.backgroundView.frame.origin.x, self.backgroundView.frame.origin.y, frame.size.width, frame.size.height);
        if (frame.origin.y != 0) {
            frame.origin.y  = 0;
            self.frame = frame;
        }
        //  计算位置, 垂直居中, 图片默认中心偏上.
        CGFloat sW = self.bounds.size.width;
        CGFloat cX = sW / 2;
        CGFloat cY = self.bounds.size.height * (1 - 0.688) + 0;
        //    CGFloat iW = image.size.width;
        //    CGFloat iH = image.size.height;
        CGFloat iW = FCLengthTO750(115);
        CGFloat iH = FCLengthTO750(115);
        self.desLabel.frame          = CGRectMake(0, cY - iH / 2, sW, self.desLabel.font.lineHeight);
        self.avatarImageView.frame        = CGRectMake(cX - iW / 2, CGRectGetMaxY(self.desLabel.frame) + 24, iW, iH);
        self.nimingIdentifierView.frame = CGRectMake(CGRectGetMaxX(self.avatarImageView.frame)-FCLengthTO750(115)/4, CGRectGetMinY(self.avatarImageView.frame), FCLengthTO750(115)/4, FCLengthTO750(115)/4);

    }
}
- (void)dealloc {
    DELog(@"占位视图正常销毁");
}

@end
