//
//  SDButton.m
//  SDButtonClick
//
//  Created by slowdony on 2019/3/24.
//  Copyright © 2019 slowdony. All rights reserved.
//

#import "SDButton.h"

@implementation SDButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



///重写点击
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{

    if(!self.userInteractionEnabled||
       [self isHidden]||
       self.alpha<=0.01){
        return nil;
    }
    if ([self pointInside:point withEvent:event]) {
        ///遍历当前试图的子试图
        __block UIView *hitview = nil;
        
        ///倒叙遍历
        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ///坐标转换
            CGPoint covPoint = [self convertPoint:point toView:obj];
            hitview = [obj hitTest:covPoint withEvent:event];
            if(hitview){
                *stop=YES;
            }
        }];
        
        if(hitview){
            return hitview;
        }else{
            return self;
        }
    }
    return nil;
}

///
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGFloat x = point.x;
    CGFloat y = point.y;
    
    CGFloat x1 = self.frame.size.width/2;
    CGFloat y1 = self.frame.size.height/2;
    
    double dis = sqrt((x-x1)*(x-x1)+(y-y1)*(y-y1));
    ///判断以当前控件为圆心,以当前控件宽度宽度为直径的圆内
    if (dis<=x1) {
        return YES;
    }else{
        return NO;
    }
}
@end
