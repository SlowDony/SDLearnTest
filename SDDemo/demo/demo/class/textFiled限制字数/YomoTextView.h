//
//  YomoTextView.h
//  YomoProject
//
//  Created by xy on 2017/9/26.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YomoTextView : UITextView
/**
 *  占位文字
 */
@property (nonatomic, copy) NSString *placeholder;
/**
 *  占位文字颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic,assign) BOOL isCenter;//是否要垂直居中
@end
