//
//  ViewController.m
//  SDTest
//
//  Created by slowdony on 2019/5/14.
//  Copyright © 2019 slowdony. All rights reserved.
//

#import "ViewController.h"
#import <SDMyView.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SDMyView *view = [[SDMyView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
