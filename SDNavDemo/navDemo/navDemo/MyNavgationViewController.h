//
//  MyNavgationViewController.h
//  navDemo
//
//  Created by slowdony on 2017/12/6.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavgationViewController : UINavigationController
@property (nonatomic,retain) UILabel * titleLabel;
- (void )setupTitle:(NSString *)title;

@property(nonatomic,assign)BOOL isHiddenBar;
@property(nonatomic,assign)BOOL pushHiddenBar;
@end
