//
//  PageViewController.m
//  test
//
//  Created by Administrator on 2019/4/10.
//  Copyright © 2019 Zhuhaifei. All rights reserved.
//

#import "PageViewController.h"
#import "FirstViewController.h"


@interface PageViewController ()

@property (nonatomic,strong) NSMutableArray *controllers;

@property (nonatomic,strong) NSMutableArray *titlesArray;

@property (nonatomic,strong) UICollectionView *titleCollection;

@end

@implementation PageViewController

- (NSMutableArray *)controllers{
   if (!_controllers) {
       for (int i = 0; i < 5; i++) {
           FirstViewController *con = [[FirstViewController alloc]init];
           [_controllers addObject:con];
       }
  }
  return _controllers;
}

- (NSMutableArray *)titlesArray{
    if (!_titlesArray) {
        _titlesArray = [NSMutableArray arrayWithObjects:@"全部",@"代付款",@"服务中",@"已完成",@"已取消", nil];
    }
    return _titlesArray;
}
- (UICollectionView *)titleCollection{
    if (!_titleCollection) {
        
    }
    return _titleCollection;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *titleArray = @[@"全部",@"代付款",@"服务中",@"已完成",@"已取消"];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
