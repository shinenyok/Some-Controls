//
//  IMLoadingProgressView.h
//  test
//
//  Created by Administrator on 2019/2/20.
//  Copyright © 2019 Zhuhaifei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IMLoadingProgressView : UIView
//进度值
@property (nonatomic,assign) CGFloat progress;

//清除指示器
- (void)dismiss;

//示例化对象
+ (id)progressView;

@end

NS_ASSUME_NONNULL_END
