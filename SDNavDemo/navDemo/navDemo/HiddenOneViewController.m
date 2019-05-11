//
//  HiddenOneViewController.m
//  navDemo
//
//  Created by slowdony on 2017/12/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "HiddenOneViewController.h"
#import "HiddenTwoViewController.h"
@interface HiddenOneViewController ()

@end

@implementation HiddenOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    // Do any additional setup after loading the view.
}
-(void)pushViewController{
    NSLog(@"HiddenOneViewController");
    
//    [[self navigationController] popViewControllerAnimated:NO];
    HiddenTwoViewController * v = [[HiddenTwoViewController alloc]init];
    
    [self.navigationController pushViewController:v animated:NO];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromRight; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
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
