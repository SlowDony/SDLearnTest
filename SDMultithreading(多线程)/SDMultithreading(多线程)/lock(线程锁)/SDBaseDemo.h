//
//  SDBaseDemo.h
//  SDMultithreading(多线程)
//
//  Created by slowdony on 2019/3/31.
//  Copyright © 2019 slowdony. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDBaseDemo : NSObject
- (void)saveMoney;
- (void)drawMoney;
- (void)saleTicket;

///存取钱测试
- (void)moneyTest;
- (void)ticketTest;
@end

NS_ASSUME_NONNULL_END
