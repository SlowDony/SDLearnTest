//
//  ViewController.m
//  iOS11
//
//  Created by slowdony on 2018/2/8.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "ViewController.h"
#import "LargeTitlesViewController.h"
@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)  UITableView *tableView;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (@available(iOS 11.0, *)) {
        [self.navigationController.navigationBar setPrefersLargeTitles:YES];
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
    } else {
        // Fallback on earlier versions
    }
   
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (@available(iOS 11.0, *)) {
        [self.navigationController.navigationBar setPrefersLargeTitles:NO];
    } else {
        // Fallback on earlier versions
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"大萨达所多撒多撒多多撒多适配iOS11以下大标题";
   
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableView *)tableView{
    if (!_tableView){
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.showsVerticalScrollIndicator = NO;
        
        _tableView = tableView;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor = [UIColor clearColor];
//    tableView.transform=CGAffineTransformMakeRotation(-M_PI / 2);
        
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
    cell.textLabel.text = [NSString stringWithFormat:@"iOS:%ld",(long)indexPath.row];
//    cell.textLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
