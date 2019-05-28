//
//  IMLoadingProgressView.m
//  test
//
//  Created by Administrator on 2019/2/20.
//  Copyright © 2019 Zhuhaifei. All rights reserved.
//

#import "IMLoadingProgressView.h"

static const CGFloat WLoadingProgressViewItemMargin = 21;

@implementation IMLoadingProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
//        self.layer.cornerRadius = 5;
//        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    if (progress > 1.0) {
        [self removeFromSuperview];
    }else {
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //获取中心点
    CGFloat centerX = rect.size.width * 0.5;
    CGFloat centerY = rect.size.height * 0.5;
    
    //设置线宽
    CGContextSetLineWidth(context, 8);
    
    //设置目标角度
    CGFloat to =  M_PI * 2 * _progress - M_PI_2;
    CGFloat radius = MIN(centerX, centerY) - WLoadingProgressViewItemMargin;
    
    //添加路径
    CGContextAddArc(context, centerX, centerY, radius, - M_PI_2, to, 0);
    //设置填充颜色
//    [KGlobalBlueColor set];
    [[UIColor cyanColor] set];
    CGContextStrokePath(context);
    
    
//    CGRect rect1 = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
//    UIGraphicsBeginImageContext(rect1.size);
////    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
//    CGContextFillRect(context, rect1);
//    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    CGFloat strX = centerX - theImage.size.width * 0.5;
//    CGFloat strY = centerY - theImage.size.height * 0.5;
////        [attrStr drawAtPoint:CGPointMake(strX, strY)];
//    [theImage drawAtPoint:CGPointMake(strX, strY)];
//    return image;
    //添加路径2
//    CGContextAddArc(context, centerX, centerY, radius, to, M_PI * 2, 0);
//    [[UIColor whiteColor] set];
//    CGContextStrokePath(context);
    
    //加载时显示的文字
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:14.0];
//
//    attributes[NSForegroundColorAttributeName] = [UIColor colorWithRed:234/255.0 green:186/255.0 blue:133/255.0 alpha:1.0];
//    NSInteger p = _progress * 100;
//    NSString *showText = [NSString stringWithFormat:@"%ld",(long)p];
//    showText = [showText stringByAppendingString:@"%"];
//    [self setCenterProgressText:showText withAttributes:attributes];
}

//#pragma mark 设置加载时显示的文字
//- (void)setCenterProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes
//{
//    CGFloat centerX = self.frame.size.width * 0.5;
//    CGFloat centerY = self.frame.size.height * 0.5;
//
//    CGSize strSize;
//    NSAttributedString *attrStr = nil;
//    if (attributes[NSFontAttributeName]) {
//        strSize = [text sizeWithAttributes:@{NSFontAttributeName:attributes[NSFontAttributeName]}];
//        attrStr = [[NSAttributedString alloc] initWithString:text attributes:attributes];
//    } else {
//        strSize = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:[UIFont systemFontSize]]}];
//        attrStr = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:[UIFont systemFontSize]]}];
//    }
//
//    CGFloat strX = centerX - strSize.width * 0.5;
//    CGFloat strY = centerY - strSize.height * 0.5;
//
//    [attrStr drawAtPoint:CGPointMake(strX, strY)];
//}

#pragma mark 清除指示器
- (void)dismiss
{
    self.progress = 1.0f;
}

+ (id)progressView
{
    return [[self alloc] init];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
