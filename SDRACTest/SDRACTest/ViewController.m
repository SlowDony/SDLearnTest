//
//  ViewController.m
//  SDRACTest
//
//  Created by slowdony on 2019/1/30.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveObjC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     1.创建信号() ->2.订阅信号(RACSubscriber)  ->3.保存订阅者(RACSubscriber)  ->4.发送数据   ->5.便利所有订阅者,执行他们的nextBlock
     
     */
    
    
    //1.创建信号
    RACSubject *subject = [RACSubject subject];
    
    ///2.订阅信号
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"接收1到的数据:%@",x);
    }];
    ///2.订阅信号
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"接收2到的数据:%@",x);
    }];
    
    ///3.发送数据
    [subject sendNext:@1];
    ///
    
}

- (void)createDisposeSingnal{
    ///  1.创建一个信号(冷信号)
    RACSignal *singnal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        ///didSubscribe调用:只要一个信号被订阅了就会调用
        ///didSubscribe作用:发送数据
        
        ///3.发送数据
        [subscriber sendNext:@1];
        return [RACDisposable disposableWithBlock:^{
            ///清空资源
            NSLog(@"信号被取消订阅");
        }];
    }];
    ///2.订阅信号(变为热信号)
    RACDisposable *disposable =  [singnal subscribeNext:^(id  _Nullable x) {
        ///x:信号发送的内容
        ///nextBlock的调用:只要订阅者发送数据就会调用
        ///nextBlock的作用,处理数据展示UI.
        NSLog(@"后打印: x:%@",x);
    }];
    ///取消订阅者
    [disposable dispose];
    ///默认一个信号发送完数据就会取消订阅
    ///只要订阅者在,就不会自动取消订阅
}


///创建一个普通的信号
- (void)createNormalsingnal{
       
    ///  1.创建一个信号(冷信号)
    RACSignal *singnal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        ///didSubscribe调用:只要一个信号被订阅了就会调用
        ///didSubscribe作用:发送数据
        NSLog(@"先打印信号被订阅了");
        ///3.发送数据
        [subscriber sendNext:@1];
        return nil;
    }];
    ///2.订阅信号(变为热信号)
    [singnal subscribeNext:^(id  _Nullable x) {
        ///x:信号发送的内容
        ///nextBlock的调用:只要订阅者发送数据就会调用
        ///nextBlock的作用,处理数据展示UI.
        NSLog(@"后打印: x:%@",x);
    }];
    
    ///只要订阅者调用sendNext.就会执行nextBlock
    ///只要订阅了RACDynamicSignal信号被订阅了,就会执行didSubscribe
    ///d条件是RACDynamicSignal,不同类型的订阅,处理订阅事情不一样
}

@end
