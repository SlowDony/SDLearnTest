//
//  MyNavgationViewController.m
//  navDemo
//
//  Created by slowdony on 2017/12/6.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "MyNavgationViewController.h"

#import "SDHiddenViewController.h"
@interface MyNavgationViewController ()
<UINavigationControllerDelegate,UIGestureRecognizerDelegate,UINavigationBarDelegate>

@end

@implementation MyNavgationViewController

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
   self = [super initWithRootViewController:rootViewController];
    if (self) {
//        if ([self.visibleViewController isKindOfClass:[SDHiddenViewController class]]){
//            [self setNavigationBarHidden:YES animated:YES];
//        }else {
//            [self setNavigationBarHidden:NO animated:YES];
//        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = YES;
    // 屏幕边缘滑动(只能在屏幕的边缘才能触发该手势，不能在屏幕的任意一点触发该手势)
    self.interactivePopGestureRecognizer.delegate = self;
    
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    /**
     *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
     */
    return self.childViewControllers.count > 1;
}
//-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    
//    self.isHiddenBar=[self isSetHiddenBarInViewController:viewController];
//}
//
//-(BOOL)isSetHiddenBarInViewController:(UIViewController *)viewController{
//    BOOL isHiddenNavBar = NO;
//    
//    if ([viewController isKindOfClass:[SDHiddenViewController class]])
//    {
//        isHiddenNavBar = YES;
//    }
//    
//    return isHiddenNavBar;
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - title

/**
 设置标题
 */
- (void )setupTitle:(NSString *)title
{
    [self setupTitle:title badge:NO];
}

- (void )setupTitle:(NSString *)title badge:(BOOL) hasBadge
{
    float titleWhidth = 0;
    if (title && title.length > 0)
    {
        titleWhidth =  100;
    }
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - titleWhidth)/2, 0,titleWhidth, 44);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:17];
    label.numberOfLines = 1;
    self.titleLabel = label;
    if([self.viewControllers lastObject])
    {
        UIViewController * vc = [self.viewControllers lastObject];
        vc.navigationItem.titleView = self.titleLabel;
//        [vc.navigationItem setTitle:title];
    }
    
}



@end
