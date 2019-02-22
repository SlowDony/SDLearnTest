//
//  SDLoginViewModel.h
//  SDRACTest
//
//  Created by slowdony on 2019/2/22.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDLoginModel.h"
#import "ReactiveObjC.h"
NS_ASSUME_NONNULL_BEGIN

@interface SDLoginViewModel : NSObject

@property (nonatomic,strong)  SDLoginModel *loginModel;
@property (nonatomic,strong,readonly)  RACSignal *loginEnableSignal;
@property (nonatomic,strong,readonly)  RACCommand *loginCommand;
@end

NS_ASSUME_NONNULL_END
