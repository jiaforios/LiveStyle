//
//  JokeCell.m
//  LiveStyle
//
//  Created by qlh on 2017/2/28.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "JokeCell.h"

@implementation JokeCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.top.mas_equalTo(self.contentView.mas_top).with.offset(10);
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(10);
        make.height.mas_equalTo(20);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.top.mas_equalTo(self.timeLabel.mas_bottomMargin).with.offset(15);
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(10);
    }];
    
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.contentLabel.mas_bottom).offset(15);
    }];


}
- (void)jokeViewData:(Jokeresult *)result
{
    self.timeLabel.text = result.updatetime;
    self.contentLabel.text = result.content;
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
