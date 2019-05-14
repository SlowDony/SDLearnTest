//
//  YomoTextView.m
//  YomoProject
//
//  Created by xy on 2017/9/26.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "YomoTextView.h"

@implementation YomoTextView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 当UITextView的文字发生改变时，UITextView自己会发出一个UITextViewTextDidChangeNotification通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        //        self.tintColor =UIColorFromRGB0X(0x3A3A3A) ; //光标颜色
        
    }
    return self;
}

-(void)setIsCenter:(BOOL)isCenter{
    _isCenter = isCenter;
    if (isCenter){
        self.textAlignment = NSTextAlignmentCenter;
        [self addObserver:self forKeyPath:@"contentSize" options:  (NSKeyValueObservingOptionNew) context:NULL];
    }
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentSize"])
    {
        UITextView *tv = object;
        CGFloat deadSpace = ([tv bounds].size.height - [tv contentSize].height);
        CGFloat inset = MAX(0, deadSpace/2.0);
        tv.contentInset = UIEdgeInsetsMake(inset, tv.contentInset.left, inset, tv.contentInset.right);
    }
}

/**
 *  监听文字改变
 */
-(void)textDidChange {
    
    //重绘
    [self setNeedsDisplay];
    
}

-(void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    // setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self setNeedsDisplay];
}

-(void)setText:(NSString *)text {
    [super setText:text];
    // setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self setNeedsDisplay];
}

-(void)setFont:(UIFont *)font {
    [super setFont:font];
    // setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    
    // 如果有输入文字，就直接返回，不画占位文字
    if (self.hasText) return;
    //设置文字属性
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = self.font;
    attributes[NSForegroundColorAttributeName] = self.placeholderColor ? self.placeholderColor : [UIColor grayColor];
    //画文字
    CGFloat x =0;
    CGFloat width = 0;
    
    
    if (self.textAlignment ==NSTextAlignmentRight){
        x = rect.size.width-40;
        width = 40;
        
    }else{
        x = 5;
        width= rect.size.width -2 * x;
        
    }
    CGFloat y = 8;
    
    CGFloat height = rect.size.height - 2 * y;
    CGRect placeholderRect = CGRectMake(x, y, width, height);
    [self.placeholder drawInRect:placeholderRect withAttributes:attributes];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if(self.isCenter){
        [self removeObserver:self forKeyPath:@"contentSize"];
    }
}
@end
