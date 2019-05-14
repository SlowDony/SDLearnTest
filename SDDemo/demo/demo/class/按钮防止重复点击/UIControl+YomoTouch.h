//
//  UIControl+YomoTouch.h
//  YomoProject
//
//  Created by slowdony on 2018/3/21.
//  Copyright © 2018年 zhangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define defaultInterval 0.65  //默认时间间隔
@interface UIControl (YomoTouch)

@property (nonatomic, assign) NSTimeInterval cjr_acceptEventInterval;// 可以用这个给重复点击加间隔
@end
