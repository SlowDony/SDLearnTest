//
//  ImageViewController.m
//  demo
//
//  Created by slowdony on 2018/3/16.
//  Copyright © 2018年 slowdony. All rights reserved.
//



#import "ImageViewController.h"
#import "UIButtonView.h"

@interface ImageViewController ()
<UIGestureRecognizerDelegate>
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    [self setupImage];
    
    NSString *str = @"0.278";
    NSLog(@"i:%.2f",floor([str doubleValue]*100)/100);
    // Do any additional setup after loading the view.
}


- (void)setupImage{
    
//    UIButtonView *btn = [[UIButtonView alloc]initWithFrame:CGRectMake(0, 0, 300, 500)];
//    btn.btnClickBlock = ^(UIButton *sender) {
//         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:1231230123"]];
//    };
//
//
//    [self.view addSubview:btn];
    
    //
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(100, 300, 100, 100);
    btn1.backgroundColor = [UIColor blueColor];
    [btn1  addTarget:self action:@selector(selectorbtn1) forControlEvents:UIControlEventTouchUpInside];
//    btn1 = (UIButton*)[self setRoundedCorners:btn1 radius:10 rectCorner:UIRectCornerTopLeft];
//    btn1.cjr_acceptEventInterval = 1;
    [self.view addSubview: btn1];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(100, 500, 100, 100);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    //点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    tap.delegate = self;
    [view addGestureRecognizer:tap];
    
    
}

- (void)tapClick{
    [self selectorbtn1];
}

- (UIView *)setRoundedCorners:(UIView *)view radius:(CGFloat )radius rectCorner:(UIRectCorner )rectCorner{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radius, 0)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = view.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
    
    return view;
}

- (void)selectorbtn1{
// dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:1231230123"]];
//     });
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:1231230123"]];
   
    
    
}



//dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//    [self handleActionForElement:thisType];
//});

- (UIImage *)drawImage{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.画图
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 50, 50));
    [[UIColor greenColor] set];
    
    // 3.渲染
    CGContextFillPath(ctx);
    
    UIImage *image ;
    
    
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
