//
//  SDView.m
//  SDRACTest
//
//  Created by slowdony on 2019/2/20.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import "SDView.h"

@implementation SDView

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
        [self addbtn];
        [self addTextView];
    }
    return self;
}

- (void)addbtn{
    //
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 200, 200);
    [btn setTitle:@"点击按钮" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    self.btn = btn;
    [btn  addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: btn];
}

- (void)addTextView{
    UITextView *textView =[[UITextView alloc]init];
    textView.frame =CGRectMake(0, 200, 200, 30);
    textView.text =@"哈哈";
    self.textView = textView;
    textView.backgroundColor = [UIColor clearColor];
    textView.textColor = [UIColor blackColor];
    textView.textAlignment = NSTextAlignmentLeft;
    textView.font = [UIFont systemFontOfSize:17];
    [self addSubview:textView];
}

- (void)btnClick{
//    NSLog(@"点击");
}
@end
