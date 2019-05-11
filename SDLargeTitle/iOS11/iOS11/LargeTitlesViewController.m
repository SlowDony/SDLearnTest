//
//  LargeTitlesViewController.m
//  iOS11
//
//  Created by slowdony on 2018/2/8.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "LargeTitlesViewController.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height

@interface LargeTitlesViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)  UITableView *tableView;
@property (nonatomic,strong)  UILabel *headLab;//
@property (nonatomic,strong)  UIView *headView;//
@end

@implementation LargeTitlesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

#pragma mark - lazy
-(UIView *)headView{
    if (!_headView){
       _headView = [[UIView alloc] init];
       _headView.frame = CGRectMake(0, 0,SCREEN_WIDTH , 52);
       _headView.backgroundColor = [UIColor clearColor];
        _headLab= [[UILabel alloc] init];
        _headLab.frame = CGRectMake(20, 0,CGRectGetWidth(_headView.frame)-40, CGRectGetHeight(_headView.frame));
        _headLab.backgroundColor = [UIColor clearColor];
        _headLab.textColor = [UIColor blackColor];
        _headLab.text = @"适配iOS11以下大标题";
        _headLab.textAlignment = NSTextAlignmentLeft;
        _headLab.font = [UIFont boldSystemFontOfSize:33];
        _headLab.numberOfLines = 1;
        [_headView addSubview:_headLab];
        
    }
    return _headView;
}

-(UITableView *)tableView{
    if (!_tableView){
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.showsVerticalScrollIndicator = NO;
        _tableView = tableView;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.tableHeaderView = self.headView;
    
    }
    return _tableView;
}

#pragma mark ----------UITabelViewDataSource----------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //配置数据
    cell.textLabel.text = @"大标题";
    
    return cell;
}


#pragma mark ----------UITabelViewDelegate----------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LargeTitlesViewController *vc = [[LargeTitlesViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int contentOffSetY =scrollView.contentOffset.y;
    NSLog(@"contentOffSetY:%d",contentOffSetY);
    CGFloat heitgt = SCREEN_HEIGHT ==812?24:0; 
    if(contentOffSetY >(42+heitgt)){
//        self.navView.alpha =scrollView.contentOffset.y/75.0;
//        self.nameLabel.alpha=1-scrollView.contentOffset.y/75.0;
//        NSLog(@"self.navView.alpha:%f",self.navView.alpha);
        self.navigationItem.titleView.alpha = 1-scrollView.contentOffset.y/75.0;
        self.navigationItem.title = @"适配iOS11以下大标题";
        
    }else {
        self.navigationItem.title = @"";
        
    }
    
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
