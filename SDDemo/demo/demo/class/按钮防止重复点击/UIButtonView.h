//
//  UIButtonView.h
//  demo
//
//  Created by slowdony on 2018/3/19.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButtonView : UIView

@property (nonatomic,copy)void (^btnClickBlock ) (UIButton *sender);
@end
