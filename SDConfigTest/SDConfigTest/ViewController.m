//
//  ViewController.m
//  SDConfigTest
//
//  Created by slowdony on 2019/1/28.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import "ViewController.h"

@interface SDView()


@end
@implementation SDView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
}
@end
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a ni
//    SDView *view = [[SDView alloc]init];

///会造成死锁
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        self.view.backgroundColor = [UIColor redColor];
//        NSLog(@"baseUrl:%@",BaseURL);
//    });
    
    self.view.backgroundColor = [UIColor blueColor];
}



@end
