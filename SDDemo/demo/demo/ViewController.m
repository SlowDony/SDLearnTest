//
//  ViewController.m
//  demo
//
//  Created by slowdony on 2017/9/25.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "ViewController.h"
#import "person.h"
#import "YomoTextView.h"
@interface ViewController ()

@property (nonatomic,strong)  YomoTextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(10, 50, 100, 30);
    textField.delegate = self;
    textField.tag = 0;
    textField.placeholder = @"1111";
    textField.font = [UIFont systemFontOfSize:17];
    textField.textColor =[UIColor blackColor];
    textField.adjustsFontSizeToFitWidth = YES;
    textField.minimumFontSize = 2;
    textField.clearButtonMode =  UITextFieldViewModeNever;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:textField];
    
//    YomoTextView *textView =[[YomoTextView alloc]init];
//    textView.frame =CGRectMake(0, 100, 300, 300);
//    textView.text = @"哈哈哈";
//
//    textView.backgroundColor = [UIColor blueColor];
//    textView.textColor = [UIColor blackColor];
//    textView.isCenter = YES;
//    textView.textAlignment = NSTextAlignmentLeft;
//    textView.font = [UIFont systemFontOfSize:17];
//    self.textView = textView;
//
//    [self.view addSubview:textView];
    
    
    
    //    for (id i in arr1 ) {
    //
    //        for (phone in arr2) {
    //
    //        }
    //    }
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    UITextView *tv = object;
    // Center vertical alignment
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])/2.0;
    topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
    tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
    
    //    // Bottom vertical alignment
    //    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height);
    //    topCorrect = (topCorrect <0.0 ? 0.0 : topCorrect);
    //    tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
    
}







-(void)demo{
    person *p1 =[[person alloc]init];
    p1.name =@"小明";
    p1.age =12;
    person *p2 =[[person alloc]init];
    p2.name =@"小张";
    p2.age =14;
    
    person *p3 =[[person alloc]init];
    p3.name =@"小红";
    p3.age =9;
    
    person *p4 =[[person alloc]init];
    p4.name =@"小红";
    p4.age =10;
    
    person *p5 =[[person alloc]init];
    p5.name =@"小李";
    p5.age =18;
    
    NSMutableArray *oldArr = [NSMutableArray array];
    [oldArr addObject:p1];
    [oldArr addObject:p2];
    [oldArr addObject:p4];
    
    NSMutableArray *newArr = [NSMutableArray array];
    [newArr addObject:p1];
    [newArr addObject:p2];
    
    //    [newArr addObject:p3];
    //    [newArr addObject:p5];
    
    
    
    
    NSMutableArray *emptyArr = [NSMutableArray array];
    //    [oldArr enumerateObjectsUsingBlock:^(person * _Nonnull p, NSUInteger idx, BOOL * _Nonnull stop) {
    //        person *p1 = p;
    //        __block BOOL ishave = NO;
    //        [newArr enumerateObjectsUsingBlock:^(person  *_Nonnull p, NSUInteger idx, BOOL * _Nonnull stop) {
    //            if ([p1.name isEqualToString:p.name] && p1.age == p.age) {
    //                ishave =YES;
    //                *stop = YES;
    //            }
    //
    //        }];
    //
    //        if (!ishave) {
    //            [emptyArr addObject:p];
    //            NSLog(@"p::%@---age:%d",p.name,p.age);
    //        }
    //
    //    }];
    
    
    [newArr enumerateObjectsUsingBlock:^(person * _Nonnull p, NSUInteger idx, BOOL * _Nonnull stop) {
        person *p1 = p;
        __block BOOL ishave = NO;
        [oldArr enumerateObjectsUsingBlock:^(person  *_Nonnull p, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([p1.name isEqualToString:p.name] && p1.age == p.age) {
                ishave =YES;
                [emptyArr addObject:p];
                *stop = YES;
            }
        }];
        //        if (!ishave) {
        ////            [emptyArr addObject:p];
        //            NSLog(@"p::%@---age:%d",p.name,p.age);
        //        }
        
    }];
    NSLog(@"emptyArr:%@",emptyArr);
    
    
    NSArray * arr2 = @[@4,@3,@2,@1];
    NSArray * arr1 = @[@2,@3,@4,@5];
    
    __block NSMutableArray *difObject = [NSMutableArray arrayWithCapacity:5];
    //找到arr2中有,arr1中没有的数据
    [arr2 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *number1 = obj;//[obj objectAtIndex:idx];
        __block BOOL isHave = NO;
        [arr1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([number1 isEqual:obj]) {
                isHave = YES;
                *stop = YES;
            }
        }];
        if (!isHave) {
            [difObject addObject:obj];
        }
    }];
    //找到arr1中有,arr2中没有的数据
    [arr1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *number1 = obj;//[obj objectAtIndex:idx];
        __block BOOL isHave = NO;
        [arr2 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([number1 isEqual:obj]) {
                isHave = YES;
                *stop = YES;
            }
        }];
        if (!isHave) {
            [difObject addObject:obj];
        }
    }];
    NSLog(@"%@",difObject);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
