//
//  BaseViewController.m
//  navDemo
//
//  Created by slowdony on 2017/12/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "BaseViewController.h"
#import "SDHiddenViewController.h"
#import "MyNavgationViewController.h"
/**
 BaseViewController基础vc
 */
@interface BaseViewController ()<UINavigationControllerDelegate>
@property (nonatomic,assign) BOOL navViewHidden;
@end

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.navigationController.delegate = self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTitle:NSStringFromClass([self class])];
    [self setupUI];
    [self setupBtns];
    // Do any additional setup after loading the view.
}

- (void )setupTitle:(NSString *)title
{
    MyNavgationViewController *navc= (MyNavgationViewController *)self.navigationController;
    [navc setupTitle:title];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    BOOL isHiddenNavBar = [viewController isKindOfClass:[SDHiddenViewController class]];
    
    [self.navigationController setNavigationBarHidden:isHiddenNavBar animated:YES];
}

-(void)setupUI{
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.text =  NSStringFromClass([self class]);;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:17];
    label.numberOfLines = 1;
    [self.view addSubview:label];
    
    
    
//    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(10, 300, 200, 200)];
//    [view1 setBackgroundColor:[UIColor grayColor]];//view1 设置为灰色
//    [self.view addSubview:view1];
    
    //根据view1的大小变换后创建view2;
//    CGRect view2Rect=CGRectInset(view1.frame, -20,-20);
    
//    UIView *view2=[[UIView alloc]initWithFrame:view2Rect];
//    [view2 setBackgroundColor:[UIColor redColor]];//view2 设置为蓝色
//    [self.view addSubview:view2];
}

-(void)setupBtns{
    //
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame = CGRectMake(10, 100, 100, 100);
    [leftbtn setTitle:@"返回上一层" forState:UIControlStateNormal];
    [leftbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftbtn setBackgroundColor:[UIColor orangeColor]];
    [leftbtn  addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    self.leftBtn = leftbtn;
    [self.view addSubview: leftbtn];
    
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame = CGRectMake(200, 100, 100, 100);
    [rightbtn setTitle:@"跳转下一层" forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightbtn setBackgroundColor:[UIColor orangeColor]];
    [rightbtn  addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = rightbtn;
    [self.view addSubview: rightbtn];
    
}

//-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    NSLog(@"viewController:%@",viewController);
//    
//    if ([viewController isKindOfClass:[SDHiddenViewController class]] ) {
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
//    }else{
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
//    }
//    
//}

-(void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pushViewController{
    
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
