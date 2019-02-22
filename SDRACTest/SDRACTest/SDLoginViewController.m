//
//  SDLoginViewController.m
//  SDRACTest
//
//  Created by slowdony on 2019/2/22.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import "SDLoginViewController.h"
#import "SDLoginView.h"
#import "SDLoginViewModel.h"
#import "ReactiveObjC.h"
@interface SDLoginViewController ()
@property (nonatomic,strong) SDLoginView *loginView;
@property (nonatomic,strong) SDLoginViewModel *loginViewModel;
@end

@implementation SDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loginView];
    
    
    RAC(self.loginViewModel.loginModel,account) = self.loginView.accountText.rac_textSignal;
    RAC(self.loginViewModel.loginModel,password) = self.loginView.passwordText.rac_textSignal;
    
    RAC(self.loginView.loginBtn,enabled) = self.loginViewModel.loginEnableSignal;
    
    [[self.loginView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.loginViewModel.loginCommand execute:nil];
    }];
    
    // Do any additional setup after loading the view.
}

///sdloginview
- (SDLoginView *)loginView{
    if(!_loginView){
        _loginView = [[SDLoginView alloc]initWithFrame:self.view.bounds];
    }
    return _loginView;
}

-(SDLoginViewModel *)loginViewModel{
    if(!_loginViewModel){
        _loginViewModel = [[SDLoginViewModel alloc]init];
    }
    return _loginViewModel;
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
