//
//  ViewController.m
//  test
//
//  Created by Administrator on 2019/2/19.
//  Copyright © 2019 Zhuhaifei. All rights reserved.
//

#import "ViewController.h"
#import "DXCircleView.h"
#import "IMLoadingProgressView.h"
#import "YZCircleChargeView.h"
#import "PageViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()
@property (nonatomic, strong) DXCircleRun *animationVw; //圆动画,减少到0 弹出发送语音验证码

@property (nonatomic, strong) UIImageView *networkAnimationVw;

@property (nonatomic, strong) UIButton *resendVerifyCodeBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
//
//    _resendVerifyCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
////    _resendVerifyCodeBtn.frame.origin = self.view.center;
//    _resendVerifyCodeBtn.frame = CGRectMake(self.view.center.x - 27, self.view.center.y - 27, 54, 54);
//    [_resendVerifyCodeBtn addTarget:self action:@selector(resendVerifyCodeAction:) forControlEvents:UIControlEventTouchUpInside];
//    [_resendVerifyCodeBtn setImage:[UIImage imageNamed:@"loading"] forState:UIControlStateNormal];
//    [self.view addSubview:_resendVerifyCodeBtn];
//
//    CGFloat radis = 54;
//    _animationVw = [[DXCircleRun alloc] initWithFrame:CGRectMake(CGRectGetMidX(_resendVerifyCodeBtn.frame)-0.5*radis, CGRectGetMidY(_resendVerifyCodeBtn.frame)-0.5*radis, radis, radis)];
//    _animationVw.backgroundColor = [UIColor clearColor];
//    _animationVw.fillColor = [UIColor colorWithRed:255/255 green:233/255 blue:1/255 alpha:1];
////    RGBAColor(255,233, 1, 1);
//    _animationVw.hidden = YES;
//    [self.view addSubview:_animationVw];
//
//
//    _networkAnimationVw = [[UIImageView alloc]initWithFrame:_resendVerifyCodeBtn.frame];
//    _networkAnimationVw.contentMode = UIViewContentModeCenter;
//    _networkAnimationVw.image = [UIImage imageNamed:@"loading"];
//    [self.view addSubview:_networkAnimationVw];
//    _networkAnimationVw.hidden = YES;
//

    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"test1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor cyanColor]];
    btn1.frame = CGRectMake(self.view.center.x-50, self.view.center.y - 80, 100,40);
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"test2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor cyanColor]];
    btn2.frame = CGRectMake(self.view.center.x-50, self.view.center.y + 80, 100,40);
    [self.view addSubview:btn2];
    
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setTitle:@"点击区域扩展" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor cyanColor]];
    btn3.frame = CGRectMake(self.view.center.x-50, self.view.center.y + 240, 100,40);
    [self.view addSubview:btn3];
    
//    loadProgress.progress = 0.0;
//    [UIView animateWithDuration:.01 animations:^{
//        loadProgress.progress = f;
//        f = f + 0.01;
//    } completion:^(BOOL finished) {
//
//    }];
 
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)btn3{
    if ([UIDevice currentDevice].systemVersion.floatValue > 8.0) {
            LAContext *context = [LAContext new];
        NSString *localizedReason = @"指纹登录";
            if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil]) {
                if (@available(iOS 11.0,*)) {
                    if (context.biometryType == LABiometryTypeTouchID) {
                        
                    }else if (context.biometryType == LABiometryTypeTouchID) {
                        localizedReason = @"人脸识别";
                    }
                }

        }
        
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:localizedReason reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                PageViewController *pvc = [[PageViewController alloc] init];
                [self presentViewController:pvc animated:YES completion:nil];
            }else{
                                  switch (error.code)
              
                                  {
              
                                      case LAErrorAuthenticationFailed: // Authentication was not successful, because user failed to provide valid credentials
              
                                      {
              
                                          NSLog(@"授权失败"); // -1 连续三次指纹识别错误
              
                                      }
              
                                          break;
              
                                      case LAErrorUserCancel: // Authentication was canceled by user (e.g. tapped Cancel button)
              
                                      {
              
                                          NSLog(@"用户取消验证Touch ID"); // -2 在TouchID对话框中点击了取消按钮
              
              
              
                                      }
              
                                          break;
              
                                      case LAErrorUserFallback: // Authentication was canceled, because the user tapped the fallback button (Enter Password)
              
                                      {
              
                                          [[NSOperationQueue mainQueue] addOperationWithBlock:^{
              
                                              NSLog(@"用户选择输入密码，切换主线程处理"); // -3 在TouchID对话框中点击了输入密码按钮
              
                                          }];
              
              
              
                                      }
              
                                          break;
              
                                      case LAErrorSystemCancel: // Authentication was canceled by system (e.g. another application went to foreground)
                
                                        {
                
                                            NSLog(@"取消授权，如其他应用切入，用户自主"); // -4 TouchID对话框被系统取消，例如按下Home或者电源键
                
                                        }
                
                                            break;
                
                                        case LAErrorPasscodeNotSet: // Authentication could not start, because passcode is not set on the device.
                
                
                
                                        {
                
                                            NSLog(@"设备系统未设置密码"); // -5
                
                                        }
                
                                            break;
                
                                        case LAErrorTouchIDNotAvailable: // Authentication could not start, because Touch ID is not available on the device
                
                                        {
                
                                            NSLog(@"设备未设置Touch ID"); // -6
                
                                        }
                
                                            break;
                
                                        case LAErrorTouchIDNotEnrolled: // Authentication could not start, because Touch ID has no enrolled fingers
                
                                        {
                
                                            NSLog(@"用户未录入指纹"); // -7
                
                                        }
                
                                            break;
                
                
                
                #if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
                
                                        case LAErrorTouchIDLockout: //Authentication was not successful, because there were too many failed Touch ID attempts and Touch ID is now locked. Passcode is required to unlock Touch ID, e.g. evaluating LAPolicyDeviceOwnerAuthenticationWithBiometrics will ask for passcode as a prerequisite 用户连续多次进行Touch ID验证失败，Touch ID被锁，需要用户输入密码解锁，先Touch ID验证密码
                
                                        {
                
                                            NSLog(@"Touch ID被锁，需要用户输入密码解锁"); // -8 连续五次指纹识别错误，TouchID功能被锁定，下一次需要输入系统密码
                
                                        }
                
                                            break;
                
                                        case LAErrorAppCancel: // Authentication was canceled by application (e.g. invalidate was called while authentication was in progress) 如突然来了电话，电话应用进入前台，APP被挂起啦");
                
                                        {
                
                                            NSLog(@"用户不能控制情况下APP被挂起"); // -9
                
                                        }
                
                                            break;
                
                                        case LAErrorInvalidContext: // LAContext passed to this call has been previously invalidated.
                
                                        {
                
                                            NSLog(@"LAContext传递给这个调用之前已经失效"); // -10
                
                                        }
                
                                            break;
                
                #else
                
                #endif
                
                                        default:
                
                                        {
                
                                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                                                NSLog(@"其他情况，切换主线程处理");
                
                                            }];
                
                                            break;
                
                                        }
                
                                    }
            }
        }];
    }
    
  
}
- (void)btn2{
    YZCircleChargeView *circleView = [[YZCircleChargeView alloc] initWithFrame:CGRectZero];
    circleView.backgroundColor = [UIColor orangeColor];
    circleView.arcColor = [UIColor yellowColor];
    circleView.backColor = [UIColor clearColor];
    circleView.dialColor = [UIColor orangeColor];
    circleView.arcRadius = 198/2;//5  188
    circleView.units = @"元";
    circleView.minNum = 0;
    //    circleView.labelColor = [UIColor colorWithHexString:@"#f9422b"];
    circleView.labelColor = [UIColor whiteColor];
    circleView.labelFont = [UIFont systemFontOfSize:48];
    circleView.frame =CGRectMake(self.view.center.x - 198/2, self.view.center.y - 198/2, 198,198);
    [self.view addSubview:circleView];
    
}
- (void)btn1{
    IMLoadingProgressView *loadProgress = [IMLoadingProgressView progressView];
    loadProgress.frame = CGRectMake(self.view.center.x, self.view.center.y - 40, 250,250);
    loadProgress.progress = 0.0;
    loadProgress.center = self.view.center;
    //    loadProgress.center.y = self.view.center.y - 40;
    __block CGFloat f = 0;
    [self.view addSubview:loadProgress];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x - 100, self.view.center.y - 100, 200, 200)];
    //    imageView.image = theImage;
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    
    imageView.layer.cornerRadius = 100.f;
    imageView.clipsToBounds = YES;
    
    [NSTimer scheduledTimerWithTimeInterval:0.125 repeats:YES block:^(NSTimer * _Nonnull timer) {
        f = f + 0.0625;
        loadProgress.progress = f;
    }];
}
- (void)resendVerifyCodeAction:(UIButton *)btn{
    [self showView:_networkAnimationVw];
}
- (void)showView:(UIView *)view{
    _animationVw.hidden = YES;
    _resendVerifyCodeBtn.hidden = YES;
    _networkAnimationVw.hidden = YES;
    view.hidden = NO;
    
    
    if (!_networkAnimationVw.hidden) {
        [_networkAnimationVw.layer removeAnimationForKey:@"rotationAnimation"];
        CABasicAnimation* rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
        rotationAnimation.duration = 0.5;
        rotationAnimation.repeatCount = INT_MAX;
        [_networkAnimationVw.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    }
}

@end
