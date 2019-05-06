//
//  SDBaseDemo.m
//  SDMultithreading(多线程)
//
//  Created by slowdony on 2019/3/31.
//  Copyright © 2019 slowdony. All rights reserved.
//

#import "SDBaseDemo.h"

@interface SDBaseDemo()

@property (nonatomic ,assign) int money;
@property (nonatomic ,assign) int ticketCount;


@end
@implementation SDBaseDemo


///存取钱测试
- (void)moneyTest{
    self.money = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for(int i=0;i<5;i++){
            [self saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for(int i=0;i<5;i++){
           [self drawMoney];
        }
    });
}

- (void)ticketTest{
    self.ticketCount = 50;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0 );
    dispatch_async(queue, ^{
        
        for(int i=0;i<5;i++){
            [self saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for(int i=0;i<5;i++){
            [self saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for(int i=0;i<5;i++){
            [self saleTicket];
        }
    });
}



/**
 存钱
 */
- (void)saveMoney{
    int oldMoney = self.money;
    sleep(0.2);
    oldMoney +=50;
    self.money = oldMoney;
    NSLog(@"存了50剩下%d=====%@",self.money,[NSThread currentThread]);
}

/**
 取钱
 */
- (void)drawMoney{
    int oldMoney = self.money;
    sleep(0.2);
    oldMoney -=20;
    self.money = oldMoney;
    NSLog(@"取了20剩下%d=====%@",self.money,[NSThread currentThread]);
}

/**
 卖票
 */
- (void)saleTicket{
    int oldTicketCount = self.ticketCount;
    sleep(0.2);
    oldTicketCount -=2;
    self.ticketCount = oldTicketCount;
    NSLog(@"取了两张,剩余票数:%d=====%@",self.ticketCount,[NSThread currentThread]);
}

@end
