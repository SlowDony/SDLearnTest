//
//  SDOSSpinLock.m
//  SDMultithreading(多线程)
//
//  Created by slowdony on 2019/3/31.
//  Copyright © 2019 slowdony. All rights reserved.
//

#import "SDOSSpinLock.h"
#import <libkern/OSAtomic.h>

/**
 锁:
 OSSpinLock :自旋锁 ,等待锁的线程会处于忙等状态(busy_wait),一直占用cpu状态
 目前已经不再安全,可能会出现优先级反转问题
 如果等待锁的线程优先级比较高,它会一直占用CPU的状态,优先级低的线程无法释放锁
 ///初始化
 OSSpinLock lock = OS_SPINLOCK_INIT
 
 ///加锁
 OSSpinLockLock (&lock);
 ///解锁
 OSSpinLockUnlock(&lock);
 */

@interface SDOSSpinLock()
@property (nonatomic,assign)OSSpinLock moneylock;
@end
@implementation SDOSSpinLock



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moneylock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)saveMoney{
    OSSpinLockLock (&_moneylock);
    [super saveMoney];
    OSSpinLockUnlock(&_moneylock);
}
- (void)drawMoney{
    OSSpinLockLock (&_moneylock);
    [super drawMoney];
    OSSpinLockUnlock(&_moneylock);
}

- (void)saleTicket{
    static OSSpinLock ticklock = OS_SPINLOCK_INIT;
    OSSpinLockLock (&ticklock);
    [super saleTicket];
    OSSpinLockUnlock(&ticklock);
}
@end
