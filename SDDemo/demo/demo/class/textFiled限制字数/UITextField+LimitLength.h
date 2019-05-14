//
//  UITextField+LimitLength.h
//  demo
//
//  Created by slowdony on 2018/1/16.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LimitLength)
/**
 *  使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制,配合tools中的方法  可以支持汉字。汉字占2个长度
 *
 *  
 */
- (void)limitTextLength:(int)length;

@end
