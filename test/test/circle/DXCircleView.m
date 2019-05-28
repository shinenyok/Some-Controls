//
//  DXCircleView.m
//  
//
//  Created by gm on 2017/3/29.
//  Copyright © 2017年 Zanxiang. All rights reserved.
//

#import "DXCircleView.h"
#define dxCircleRefreshRate 0.01

@interface DXCircleRun ()

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, strong) UIColor *drawColor;
@end

@implementation DXCircleRun

- (void)clearViewAndStopTimer{
    
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
        
        if (self.finished) {
            self.finished(0);
        }
    }
    self.progress = 1;
    self.drawColor = self.backgroundColor;
    [self setNeedsDisplay];
}

- (void)setProgress{
    CGFloat increase = 2*M_PI*dxCircleRefreshRate/_duration;
    _progress += increase;
    if (_progress >= 1+increase) {
        if ([_timer isValid]) {
            [_timer invalidate];
            _timer = nil;
        }
        if (self.finished) {
            self.finished(1);
        }
    }
    else{
        self.drawColor = self.fillColor ? self.fillColor : self.backgroundColor;
        [self setNeedsDisplay];
    }
}
- (void)setDxDuration:(CGFloat)dxDuration{

    _duration = dxDuration;
    _progress = 0;
    
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
        
        if (self.finished) {
            self.finished(0);
        }
    }
    
    if (dxDuration > dxCircleRefreshRate) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:dxCircleRefreshRate target:self selector:@selector(setProgress) userInfo:nil repeats:YES];
    }
    
}

- (void)drawRect:(CGRect)rect{

    CGFloat radis = 0.5*MIN(CGRectGetWidth(rect), CGRectGetHeight(rect));
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)-radis)];
    [path addArcWithCenter:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)) radius:radis startAngle:-M_PI_2 endAngle:(-M_PI_2+_progress*2*M_PI) clockwise:YES];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))];
    [self.drawColor ? self.drawColor : self.backgroundColor setFill];
    [path fill];
}
@end



@interface DXCircleLab ()
@property (nonatomic, strong) UIColor *drawColor;
@end

@implementation DXCircleLab


- (void)setText:(NSString *)text{
    [super setText:text];
    self.drawColor = text.length ? self.backgroundColor : self.circleColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(CGRectGetWidth(rect)/2 -20, CGRectGetMidX(rect)/2+5, 20, 6)];
    [self.drawColor ? self.drawColor : self.backgroundColor setFill];
    [path2 fill];
}

- (void)setBgRadis:(CGFloat)bgRadis{
    _circleRadis = MIN(MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)), bgRadis);
    [self setNeedsDisplay];
}
@end

