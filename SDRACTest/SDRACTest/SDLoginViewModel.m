//
//  SDLoginViewModel.m
//  SDRACTest
//
//  Created by slowdony on 2019/2/22.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import "SDLoginViewModel.h"

@implementation SDLoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    //监听账号的属性值是否改变,把他们聚合成一个信号
    _loginEnableSignal = [RACSignal combineLatest:@[RACObserve(self.loginModel, account),RACObserve(self.loginModel, password)] reduce:^id (NSString *account,NSString *password) {
        return @(account.length && password.length);
    }];
    
    //处理登录业务逻辑
    _loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:@"登录成功"];
            [subscriber sendCompleted];
            return nil;
        }];
        
    }];
    
    ///监听登录产生的数据
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        if([x isEqualToString:@"登录成功"]){
            NSLog(@"登录成功啦");
        }
    }];
    ///监听登录状态 (转菊花)
    [[_loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if([x isEqualToNumber:@(YES)]){
            NSLog(@"正在登录");
        }
        else{
            NSLog(@"登录完成了");
        }
    }];
 
}


///lazy
- (SDLoginModel *)loginModel{
    if(!_loginModel){
        _loginModel = [[SDLoginModel alloc]init];
    }
    return _loginModel;
}
@end
