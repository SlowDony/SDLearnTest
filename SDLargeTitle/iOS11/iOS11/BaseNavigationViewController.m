//
//  BaseNavigationViewController.m
//  iOS11
//
//  Created by slowdony on 2018/2/8.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    if (@available(iOS 11.0, *)) {
//
//    } else {
//
//    }
   
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"yomoNewStyleNaviBGClearColor"] forBarMetrics:UIBarMetricsDefault];  //设置背景
    self.navigationBar.shadowImage = [UIImage new];
    
    // Do any additional setup after loading the view.
}

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

@end
