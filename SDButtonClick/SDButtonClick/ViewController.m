//
//  ViewController.m
//  SDButtonClick
//
//  Created by slowdony on 2019/3/24.
//  Copyright © 2019 slowdony. All rights reserved.
//

#import "ViewController.h"
#import "SDButton.h"
@interface ViewController ()
{
    SDButton *btn;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    btn = [SDButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}



- (void)btnClick{
    NSLog(@"btnClick");
}


@end
