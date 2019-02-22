//
//  SDLoginModel.h
//  SDRACTest
//
//  Created by slowdony on 2019/2/22.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDLoginModel : NSObject

/// 账号
@property (nonatomic,copy) NSString *account;
/// 密码
@property (nonatomic,copy) NSString *password;

@end

NS_ASSUME_NONNULL_END
