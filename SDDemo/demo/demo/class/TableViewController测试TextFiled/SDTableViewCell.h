//
//  SDTableViewCell.h
//  demo
//
//  Created by slowdony on 2018/1/15.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong) UITextField *titleText;
@end
