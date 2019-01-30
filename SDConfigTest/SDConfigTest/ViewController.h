//
//  ViewController.h
//  SDConfigTest
//
//  Created by slowdony on 2019/1/28.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDView :UIView

//NS_DESIGNATED_INITIALIZER：用来将修饰的方法标记为指定构造器
//NS_UNAVAILABLE：禁止使用某个初始化方法
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;


@end

@interface ViewController : UIViewController


@end

