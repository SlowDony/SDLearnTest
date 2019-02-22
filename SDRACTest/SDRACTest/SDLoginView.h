//
//  SDLoginView.h
//  SDRACTest
//
//  Created by slowdony on 2019/2/22.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDLoginView : UIView
@property (nonatomic,strong)  UITextField *accountText;
@property (nonatomic,strong)  UITextField *passwordText;
@property (nonatomic,strong)  UIButton *loginBtn;
@end

NS_ASSUME_NONNULL_END
