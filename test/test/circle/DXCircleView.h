//
//  DXCircleView.h
//  
//
//  Created by gm on 2017/3/29.
//  Copyright © 2017年 Zanxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DXCircleRunFinished)(BOOL finished);

@interface DXCircleRun : UIView
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, assign) CGFloat dxDuration;
@property (nonatomic, copy) DXCircleRunFinished finished;

- (void)clearViewAndStopTimer;

@end



@interface DXCircleLab : UILabel

@property (nonatomic, assign) CGFloat circleRadis;
@property (nonatomic, strong) UIColor *circleColor;

@end
