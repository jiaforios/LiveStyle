//
//  TodayHappenCell.m
//  LiveStyle
//
//  Created by qlh on 2017/2/24.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "TodayHappenCell.h"

@implementation TodayHappenCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.pic mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.height.mas_equalTo(80);
    }];
    
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
        make.left.mas_equalTo(self.pic.mas_rightMargin).with.offset(15);
    }];
    
    [self.personLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.top.mas_equalTo(self.timeLabel.mas_bottomMargin).with.offset(10);
        make.left.mas_equalTo(self.pic.mas_rightMargin).with.offset(15);
    }];
    
    [self.whatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.top.mas_equalTo(self.personLabel.mas_bottomMargin).with.offset(20);
        make.left.mas_equalTo(self.pic.mas_rightMargin).with.offset(15);
    }];
    
    
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.whatLabel.mas_bottom).offset(15);
    }];

}


- (void)viewData:(NSDictionary *)data
{
    self.whatLabel.text = data[@"des"];
    [self.pic sd_setImageWithURL:data[@"pic"] placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    self.timeLabel.text = data[@"title"];
    self.personLabel.text = @"";

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
