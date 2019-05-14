//
//  UIButtonView.m
//  demo
//
//  Created by slowdony on 2018/3/19.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "UIButtonView.h"

@implementation UIButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100, 100, 100, 100);
        btn.backgroundColor = [UIColor redColor];
        [btn  addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: btn];
    }
    return self;
}
- (void)btnClick:(UIButton*)sender
{
    sender.enabled = NO;
    [self btnClickedOperations:sender];
}

- (void)btnClickedOperations:(UIButton *)sender {
    NSLog(@"点击了按钮");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //        if (self.phoneButtonBlock) {
        //            self.phoneButtonBlock(sender.titleLabel.text);
        //        }
        if (self.btnClickBlock) {
            self.btnClickBlock(sender);
        }
        
        sender.enabled = YES;
    });
}
@end
