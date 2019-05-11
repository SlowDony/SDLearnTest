//
//  SDNormalBaseViewController.m
//  navDemo
//
//  Created by slowdony on 2017/12/22.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDNormalBaseViewController.h"
#import "PushTransition.h"
/**
 正常vc
 */
@interface SDNormalBaseViewController ()
<UINavigationControllerDelegate>
//push动画
@property (nonatomic,strong)  PushTransition  *pushTransition;
@end

@implementation SDNormalBaseViewController

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.delegate = self;
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush){
        return self.pushTransition;
    }else{
        return nil;
    }
}

- (PushTransition *)pushTransition{
    if(!_pushTransition){
        _pushTransition = [[PushTransition alloc]init];
        
    }
    return _pushTransition;
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
