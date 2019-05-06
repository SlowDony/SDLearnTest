//
//  SDMutex.m
//  SDMultithreading(多线程)
//
//  Created by slowdony on 2019/3/31.
//  Copyright © 2019 slowdony. All rights reserved.
//

#import "SDMutex.h"

#import <pthread.h>
/*
 Mutex,为互斥锁,等待锁的线程会处于休眠状态
 初始化锁的属性
 
 
 */
@interface SDMutex()

@property(nonatomic,assign)pthread_mutex_t moneyLock;
@property(nonatomic,assign)pthread_mutex_t ticketLock;

@end
@implementation SDMutex
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moneyLock = PTHREAD_MUTEX_INITIALIZER;
        self.ticketLock = PTHREAD_MUTEX_INITIALIZER;
    }
    return self;
}

- (void)saveMoney{
    os_unfair_lock_lock(&_moneyLock);
    [super saveMoney];
    os_unfair_lock_unlock(&_moneyLock);
}
- (void)drawMoney{
    os_unfair_lock_lock(&_moneyLock);
    [super drawMoney];
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)saleTicket{
    os_unfair_lock_lock(&_ticketLock);
    [super saleTicket];
    os_unfair_lock_unlock(&_ticketLock);
}
@end
