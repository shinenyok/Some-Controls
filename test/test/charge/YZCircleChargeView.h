//
//  YZCircleView.h
//  WhosvApp
//
//  Created by 休杰克曼 on 2017/8/30.
//  Copyright © 2017年 DanielYK. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^YZCircleChargeViewCurrentNumBlock)(int  currentNum);

@interface YZCircleChargeView : UIView

@property int minNum;

@property (nonatomic ,assign) int maxNum;

@property (nonatomic ,copy) YZCircleChargeViewCurrentNumBlock  chargeViewCurrentNumBlock;

@property NSString *units;

// dial appearance
@property CGFloat dialRadius;
@property UIColor *dialColor;

// background circle appeareance
@property CGFloat outerRadius;  // don't set this unless you want some squarish appearance
@property UIColor *backColor;

// arc appearance
@property UIColor *arcColor;
@property CGFloat arcRadius; // must be less than the outerRadius since view clips to bounds
@property CGFloat arcThickness;

// label appearance
@property UIFont *labelFont; // font is not automatically resized, so adjust to your needs
@property UIColor *labelColor;


@end
