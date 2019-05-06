//
//  ViewController.m
//  SDMultithreading(多线程)
//
//  Created by slowdony on 2019/3/30.
//  Copyright © 2019 slowdony. All rights reserved.
//


#import "ViewController.h"
#import "SDBaseDemo.h"
#import "SDOSSpinLock.h"
#import "SDOSUnfairLock.h"
@interface ViewController ()

@end

@implementation ViewController
/*
 dispatch_async 和 dispatch_sync 用来控制是否需要开启新的线程
 queut 决定任务的执行方式(串行和并行)
 四个关键字 同步/异步  串行/并行
 一.同步和异步 影响是否可以开启新的线程
 同步(sync):在当前线程执行任务,不具备开启新的线程
 异步(async):在新的线程执行任务,具有开启新的线程的能力 (注意,如果异步在主队列执行任务时,是不会开启新的线程,在主线程执行)
 二.串行和并行 决定执行任务的方式
 串行(DISPATCH_QUEUE_SERIAL) (一个任务执行完成后,再执行另一个任务)
 并行(DISPATCH_QUEUE_CONCURRENT) 多个任务并发(同时)执行
 
 
 产生死锁:使用(同步)sync函数在当前串行队列中添加新的任务,就会产生死锁

 */



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self text5];
    SDBaseDemo *demo = [[SDOSUnfairLock alloc]init];
    [demo moneyTest];
    [demo ticketTest];
   
}

- (void)demo1{
    
    
    dispatch_queue_t queut = dispatch_get_global_queue(0, 0);
    dispatch_async(queut, ^{
        for (int i=0;i<10;i++){
            NSLog(@"任务1 :%d----%@",i,[NSThread currentThread]);
        }
    });
    dispatch_queue_t mainqueut = dispatch_get_main_queue();
    dispatch_async(mainqueut, ^{
        for (int i=0;i<10;i++){
            NSLog(@"任务2 :%d----%@",i,[NSThread currentThread]);
        }
    });
}

/**
 会产生死锁
 原因是,text1方法在viewDidLoad 中执行,默认为在为主线程主队列
 任务2为同步执行
 主队列中,执行test1 ,和 任务2. 由于主队列先进先出原则,所以要想执行顺序为 test1->任务2
 在test1中.执行顺序为先执行  任务1->任务2->任务3
 任务2在等待test1里的任务3执行完,在test1里任务3又在等待任务2执行完
 然后就一直在互相等待,产生死锁
 
 解决方案,任务2改成异步执行就好了
 */
- (void)test1{
    NSLog(@"任务1");
    
    dispatch_sync(dispatch_get_main_queue(), ^{
         NSLog(@"任务2");
    });
    
    NSLog(@"任务3");
}

/**
 产生死锁
 原因分析:
 
 在text2中,有三个任务. 任务1 ,任务5 ,和子线程任务
 在子线程任务 串行队列中里有三个任务 任务2,任务3,任务4
 任务3中是同步执行,相当于需要子线程任务执行完,才可以执行任务3,
 子线程任务中 (由于是队列是串行)要想执行任务4,需要先执行完任务3才能执行
 多以任务3和任务4互相等待,产生死锁
 */
- (void)text2{
    NSLog(@"任务1");
    dispatch_queue_t queue = dispatch_queue_create("mydispacth",DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"任务2");
        dispatch_sync(queue, ^{
            NSLog(@"任务3");
        });
        NSLog(@"任务4");
    });
    NSLog(@"任务5");
}

-(void)text3{
    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue2 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue3 = dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue4 = dispatch_queue_create("queue2", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"%p,%p,%p,%p,",queue1,queue2,queue3,queue4);
/*
 全局并发队列,系统只创建一个,使用dispatch_queue_create创建的并发队列,每调用一次,都会产生新的队列,即使队列名字是一样的也会产生新的
 */
//  打印结果:   0x105727e80,0x105727e80,0x60000317a300,0x60000317a200,
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self text4];
}


/**
 调用performSelector:withObject:afterDelay方法时,如果在主线程的话,因为主线程默认有runloop,所以该方法会执行,而在子线程没有runloop,所以该方法不会执行,如果需要执行,需要在子线程中手动添加runloop
 performSelector:withObject:afterDelay :本质是在runloop中添加定时器
 
 */
- (void)text4{
    NSLog(@"打印1");
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0 );
    dispatch_async(queue, ^{
        [self performSelector:@selector(willDo) withObject:nil afterDelay:0.2];
//        [[NSRunLoop currentRunLoop]addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
    });
    NSLog(@"打印2");
}
- (void)willDo{
    NSLog(@"打印3");
}


/**
 任务1.任务2并发执行,执行完成后执行任务3
 */
- (void)text5{
    ///创建一个并行队列
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    ///创建一个组
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        for (int i=0; i<5;i++) {
            NSLog(@"任务1:%@",[NSThread currentThread]);
        }
    });
    dispatch_group_async(group, queue, ^{
        for (int i=0; i<5;i++) {
            NSLog(@"任务2:%@",[NSThread currentThread]);
        }
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        for (int i=0; i<5;i++) {
            NSLog(@"任务3:%@",[NSThread currentThread]);
        }
    });
    
}

@end
