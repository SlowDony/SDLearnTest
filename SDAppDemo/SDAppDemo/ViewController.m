//
//  ViewController.m
//  SDAppDemo
//
//  Created by slowdony on 2019/2/11.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@-----viewDidLoad",NSStringFromClass(self.class));
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%@-----viewDidAppear",NSStringFromClass(self.class));
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%@----- viewWillAppear",NSStringFromClass(self.class));
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
     NSLog(@"%@----- viewWillDisappear",NSStringFromClass(self.class));
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
     NSLog(@"%@----- viewDidDisappear",NSStringFromClass(self.class));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    OneViewController *one = [[OneViewController alloc]init];
//    [self presentViewController:one animated:YES completion:nil];
    TwoViewController *two = [[TwoViewController alloc]init];
    [self.navigationController pushViewController:two animated:YES];
}


@end
