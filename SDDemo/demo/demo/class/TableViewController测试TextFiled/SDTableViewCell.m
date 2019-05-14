//
//  SDTableViewCell.m
//  demo
//
//  Created by slowdony on 2018/1/15.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDTableViewCell.h"
#import "UITextField+LimitLength.h"
@implementation SDTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"SDTableViewCell";
    SDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        
        cell =[[SDTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    //
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(0, 0, 300, 30);
    textField.tag = 0;
    textField.placeholder = @"请输入文字";
    textField.font = [UIFont systemFontOfSize:15];
    textField.textColor =[UIColor blackColor];
    textField.clearButtonMode =  UITextFieldViewModeNever;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.titleText = textField;
    [textField setAdjustsFontSizeToFitWidth:YES];
    [textField setMinimumFontSize:1];
    textField.clearButtonMode = UITextFieldViewModeAlways;
    UIButton *clearButton = [textField valueForKey:@"_clearButton"];
    clearButton.frame = CGRectMake(0, 0, 40, 40);
    [clearButton setImage:[UIImage imageNamed:@"navigationbar_button_back_chat"] forState:UIControlStateNormal];
    
    UIView *rightView = [[UIView alloc] init];
    rightView.frame = CGRectMake(40, 0, 40, 40);
    rightView.backgroundColor = [UIColor redColor];
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
//    [textField limitTextLength:16];
    [self addSubview:textField];
}

@end
