//
//  SDLoginView.m
//  SDRACTest
//
//  Created by slowdony on 2019/2/22.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import "SDLoginView.h"
@interface SDLoginView()



@end
@implementation SDLoginView

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
        [self setupSubvies];
    }
    return self;
}
- (void)setupSubvies{
     [self addSubview:self.accountText];
     [self addSubview:self.passwordText];
     [self addSubview:self.loginBtn];
}

- (void)loginBtnClick:(UIButton *)sender{
    NSLog(@"loginBtnClick");
}

///lazy
- (UITextField *)accountText{
    if(!_accountText){
        _accountText = [[UITextField alloc]initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 30)];
        _accountText.tag = 0;
        _accountText.placeholder = @"请输入账号";
        _accountText.font = [UIFont systemFontOfSize:17];
        _accountText.textColor =[UIColor blackColor];
        _accountText.clearButtonMode =  UITextFieldViewModeNever;
        _accountText.keyboardType = UIKeyboardTypeDefault;
        _accountText.autocorrectionType = UITextAutocorrectionTypeNo;
       
    }
    return _accountText;
}

- (UITextField *)passwordText{
    if(!_passwordText){
        _passwordText = [[UITextField alloc]initWithFrame:CGRectMake(0, 90, [UIScreen mainScreen].bounds.size.width, 30)];
        _passwordText.tag = 0;
        _passwordText.placeholder = @"请输入密码";
        _passwordText.font = [UIFont systemFontOfSize:17];
        _passwordText.textColor =[UIColor blackColor];
        _passwordText.clearButtonMode =  UITextFieldViewModeNever;
        _passwordText.keyboardType = UIKeyboardTypeDefault;
        _passwordText.autocorrectionType = UITextAutocorrectionTypeNo;
       
    }
    return _passwordText;
}

///login
- (UIButton *)loginBtn{
    if(!_loginBtn){
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _loginBtn.frame = CGRectMake(0, 120, 40, 40);
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [_loginBtn setImage:[UIImage imageNamed:@"<#string#>"] forState:UIControlStateNormal];
        [_loginBtn  addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
       
    }
    return _loginBtn;
}

@end
