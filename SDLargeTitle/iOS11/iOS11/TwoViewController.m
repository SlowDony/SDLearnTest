//
//  TwoViewController.m
//  iOS11
//
//  Created by slowdony on 2018/3/2.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 100, 30);
    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor blackColor];
    label.text = @"哈哈";
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:17];
    label.numberOfLines = 1;
    
    [self.view addSubview:label];
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
