//
//  SDOSUnfairLock.m
//  SDMultithreading(多线程)
//
//  Created by slowdony on 2019/3/31.
//  Copyright © 2019 slowdony. All rights reserved.
//

#import "SDOSUnfairLock.h"
#import <os/lock.h>

/**
 os_unfair_lock 取代不安全的OSSOSSpinlock .从iOS10开始支持
 从底层看.等待os_unfair_lock锁的线程处于休眠状态,并非忙等
 //初始化
 os_unfair_lock lock = OS_UNFAIR_Lock_INIT;
 尝试加锁
 os_unfair_lock_trylock(&lock);
 加锁
 os_unfair_lock_lock(&lock);
 解锁
 os_unfair_lock_unlock(&lock);
 */
@interface SDOSUnfairLock()

@property(nonatomic,assign)os_unfair_lock moneyLock;
@property(nonatomic,assign)os_unfair_lock ticketLock;

@end
@implementation SDOSUnfairLock
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
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
