//
//  SDHelper.m
//  demo
//
//  Created by slowdony on 2018/1/19.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDHelper.h"

@implementation SDHelper
/**
 textFiled限制字数
 */
+ (void)restrictionInputTextField:(UITextField *)textField maxNumber:(NSInteger)maxNumber{
    
    NSString *toBeString = textField.text;
    NSString *lang = textField.textInputMode.primaryLanguage; // 键盘输入模式
    if([lang isEqualToString:@"zh-Hans"]) { //简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if(!position) {
            
            if(toBeString.length > maxNumber) {
                textField.text = [toBeString substringToIndex:maxNumber];
            }
        } else{ //有高亮选择的字符串，则暂不对文字进行统计和限制
            
        }
    }
    else{ //中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        NSLog(@"haha ");
        
        if(toBeString.length > maxNumber) {
            textField.text= [toBeString substringToIndex:maxNumber];
        }
    }
}

/**
 textView限制字数
 */
+ (void)restrictionInputTextView:(UITextView *)textView maxNumber:(NSInteger)maxNumber{
    
    NSString *toBeString = textView.text;
    NSString *lang = textView.textInputMode.primaryLanguage; // 键盘输入模式
    if([lang isEqualToString:@"zh-Hans"]) { //简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if(!position) {
            if(toBeString.length > maxNumber) {
                textView.text = [toBeString substringToIndex:maxNumber];
            }
        } else{ //有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    } else{ //中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if(toBeString.length > maxNumber) {
            textView.text= [toBeString substringToIndex:maxNumber];
            
        }
    }
}
@end
