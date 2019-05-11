//
//  BaseViewController.h
//  navDemo
//
//  Created by slowdony on 2017/12/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


/**
 返回上一层
 */
@property (nonatomic,strong)  UIButton *leftBtn;

/**
 跳转下一层
 */
@property (nonatomic,strong)  UIButton *rightBtn;

-(void)pushViewController;
@end
