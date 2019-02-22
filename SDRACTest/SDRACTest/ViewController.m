//
//  ViewController.m
//  SDRACTest
//
//  Created by slowdony on 2019/1/30.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveObjC.h"
#import "SDView.h"
#import "RACEXTScope.h"
@interface ViewController ()
@property (nonatomic,strong)  SDView *redView;// SDView *sdview
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.redView];
    
    ///组合方法
//    1.concat: 按照一定顺序拼接信号,当多个信号发出来时按顺序的接受信号
    RACSignal *singnal1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@1];
//        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *singnal2 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@2];
//        [subscriber sendCompleted];
        return nil;
    }];
    ///把singnal1 拼接到singnal2后,只有当singnal1发送完成后,singnal2才被激活
    RACSignal *concatsSingnal = [singnal2 concat:singnal1];
    
    ///以后只要面对拼接信号开发
    ///订阅拼接信号,不需要单独订阅singnal1和singanl2
    ///内部会自动订阅
    ///注意,第一个信号必须完成后才会执行第二个信号
    [concatsSingnal subscribeNext:^(id  _Nullable x) {
        NSLog(@"x:%@",x);
    }];
    
//  2.then :用于连接两个信号,当第一个信号完成,才会连接then返回的信号
    [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        
        return nil;
        
    }] then:^RACSignal * _Nonnull{
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:@2];
            return nil;
        }];
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"then:x:%@",x);
    }];
//    3.merge 把多个信号合并成一个信号,任何一个信号有新值的时候就会调用
    RACSignal *singnal3 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@3];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *singnal4 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@4];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *mergeSingnal = [singnal2 merge:singnal1];
    [mergeSingnal subscribeNext:^(id  _Nullable x) {
        NSLog(@"merge:x:%@",x);
        
    }];
    // 1.合并信号被订阅的时候，就会遍历所有信号，并且发出这些信号。
    // 2.每发出一个信号，这个信号就会被订阅
    // 3.也就是合并信号一被订阅，就会订阅里面所有的信号。
    // 4.只要有一个信号被发出就会被监听。
    
//    4.zipwith 把两个信号压缩成一个信号,只有当两个信号同时发出信号内容时,并且把两个信号的内容合并成一个元组,才会触发压缩流的next事件.
    RACSignal *zipWithSingnal = [singnal1 zipWith:singnal2];
    [zipWithSingnal subscribeNext:^(id  _Nullable x) {
        NSLog(@"zipWithx:%@",x);
    }];
    
//    5.combineLatest :将多个信号合并起来,并且拿到各个信号的最新值.必须每个合并的singnal至少都有过一次sendNext,才会触发合并信号.
    RACSignal *combineSingnal = [singnal1 combineLatestWith:singnal2];
    [combineSingnal subscribeNext:^(id  _Nullable x) {
        NSLog(@"combineLatest:%@",x);
    }];
//    6.reduce 聚合:用于信号发出的内容为元组,把信号发出元组的值聚合成一个值
    RACSignal *reduceSingnal = [RACSignal combineLatest:@[singnal1,singnal2] reduce:^id (NSNumber *num1 ,NSNumber *num2){
        return  [NSString stringWithFormat:@"num1=:%@,num2=:%@",num1,num2];
    }];
    [reduceSingnal subscribeNext:^(id  _Nullable x) {
        
    }];
    
    
    
    
    
    /*
     信号类,:表示有数据产生
     RACSignal
     RACDynamicSignal ->didSubscribe(block)
     RACSubject ->subscribers(数组)
     RACReplaySubject  -> valuesReceived(数组)
     
     不同信号订阅方式不同
     RACDynamicSignal 1.创建订阅者RACscriber 2.执行didSubscribe
     RACSubject 1.创建订阅者RACSubscriber 2.保存订阅者
     RACReplaySubject: 1.创建订阅者RACSubscirber 2.拿到当前创建订阅者,发送之前保存的所有值
     
     订阅者
     RACSubscriber
     RACSubject ->subscribers(数组)
     RACReplaySubject ->valuesReceived(数组)
     
     
     不同订阅者,发送数据方式不同
     [RACSubscriber sendNext] 执行nextBlock
     [RACSubject sendNext] 遍历自己所有订阅者,发送数据
     [RACReplaySubject sendNext] 1.保存发送的值,遍历自己所有订阅者,发送数据
     */

    
    
    
    
}


- (void)update:(id)data r2:(id)data2{
    NSLog(@"更新ui:%@  %@",data,data2);
}



#pragma mark - RACMulticastConnection
- (void)RACMulticastConnectionText
{
    //   1. RACMulticastConnection 用于当一个信号,被多次调用时,保证创建信号时,避免多次调用创建信号中的block,造成副作用,可以用这个类处理
    //    1创建信号
    RACSignal *singnal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"发送请求");
        return nil;
    }];
    //   2.订阅信号
    [singnal subscribeNext:^(id  _Nullable x) {
        NSLog(@"接受信号");
    }];
    [singnal subscribeNext:^(id  _Nullable x) {
        NSLog(@"接受信号2");
    }];
    //    3.运行结果,会执行两遍发送请求,也就是每次发送都会发送一次请求
    //    RACMulticastConnection 解决重复请求
    //    1.创建信号
    RACSignal *singanl1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        NSLog(@"发送请求数据");
        return nil;
    }];
    //    2.创建连接
    RACMulticastConnection *connection = [singanl1 publish];
    //    3.订阅信号
    [connection.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"接受信号1");
    }];
    [connection.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"接受信号2");
    }];
    //    4.连接,激活信号
    [connection connect];

}


#pragma mark - 常见宏
- (void)racMacro
{
    //1.用来给某个对象的某个属性绑定信号,只要产生信号内容,就会把内容赋值给属性
    //RAC(TARGET, [KEYPATH, [NIL_VALUE]])
    RAC(self.redView.btn,titleLabel.text) = self.redView.textView.rac_textSignal;
    //    2.监听某个对象的某个属性,返回的是信号
    //    RACObserve(self, name)
    [[self.redView rac_signalForSelector:@selector(btnClick)] subscribeNext:^(RACTuple * _Nullable x) {
        self.redView.frame = CGRectMake(10, 10, 50, 50);
    }];
    [RACObserve(self.redView, frame) subscribeNext:^(id  _Nullable x) {
        NSLog(@"self.view.frame:改变之%@",x);
    }];
    //    3.@weakify(Obj)和@strongify(Obj)
    //    @weakify(self)
    //    @strongify(self)
    //4.RACTuplePack: 把数据包装成RACTuple(元组类)
    RACTuple *tuple = RACTuplePack(@10,@11);
    NSLog(@"tuple:%@",tuple[0]);
    //5.RACTupleUnpack :把RACTuple(元组类)解包成对应的数据
    
    RACTupleUnpack(NSNumber* num,NSNumber *age) = tuple;
    NSLog(@"num:%@",num);
    NSLog(@"age:%@",age);
}
#pragma mark - RACSignal 常用方法
//
- (void)racSingnal{
    
   
    ///1.代替代理
    [[self.redView rac_signalForSelector:@selector(btnClick)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"x:点击 了:%@",x);
        self.redView.frame = CGRectMake(10, 10, 500, 500);
    }];
    
    ///2.代替kvo
    ///把监听redV的center属性改变转换成信号，只要值改变就会发送信号
    [[self.redView rac_valuesAndChangesForKeyPath:@"frame" options:NSKeyValueObservingOptionNew observer:nil] subscribeNext:^(RACTwoTuple<id,NSDictionary *> * _Nullable x) {
        NSLog(@"x:变话了,%@",x);
    }];
    ///3.代替监听事件
    [[self.redView.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"点击了:%@",x);
    }];
    
    ///4.代替通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"通知变化了:%@",x);
    }];
    ///5.监听文本变化
    [self.redView.textView.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"x:%@",x);
    }];
    
    ///6.处理多个请求,都返回结果时,统一处理
    RACSignal *request = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"发送请求1"];
        return nil;
    }];
    
    RACSignal *request2 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"发送请求2"];
        return nil;
    }];
    
    ///参数个数和数组个数要一致
    [self rac_liftSelector:@selector(update:r2:) withSignalsFromArray:@[request,request2]];
}
#pragma mark - 创建一个RACSubject
- (void)createRACSubject{
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

#pragma mark - 创建一个DisposeSingnal
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
    ///取 消订阅者
    [disposable dispose];
    ///默认一个信号发送完数据就会取消订阅
    ///只要订阅者在,就不会自动取消订阅
}

#pragma mark - 创建一个普通的信号
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


- (SDView *)redView{
    if(!_redView){
        _redView = [[SDView alloc]initWithFrame:CGRectMake(0, 0, 400, 400)];
    }
    return _redView;
}
@end
