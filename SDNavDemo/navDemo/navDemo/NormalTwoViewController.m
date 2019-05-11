//
//  NormalTwoViewController.m
//  navDemo
//
//  Created by slowdony on 2017/12/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "NormalTwoViewController.h"
#import "HiddenThreeViewController.h"
@interface NormalTwoViewController ()

@end

@implementation NormalTwoViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    
    
    // Do any additional setup after loading the view.
}
-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pushViewController{
    HiddenThreeViewController * v = [[HiddenThreeViewController alloc]init];
    [self.navigationController pushViewController:v animated:YES];
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
