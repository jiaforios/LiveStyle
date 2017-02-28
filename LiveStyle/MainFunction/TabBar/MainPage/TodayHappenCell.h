//
//  TodayHappenCell.h
//  LiveStyle
//
//  Created by qlh on 2017/2/24.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 关于tabview cell 自适应的处理
 
 1. 基于 XIB 创建 基础控件
 2. 在layoutSubviews 中 使用masnory 设置相对约束，注意是contentview 的相对约束，以及contentview 与 cell的相对约束
 3. 设置 语气高度   _viewTabv.estimatedRowHeight = 100;
 4. 给cell 设置  [cell layoutIfNeeded]; 关键步骤

 */
@interface TodayHappenCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *personLabel;
@property (strong, nonatomic) IBOutlet UILabel *whatLabel;

- (void)viewData:(NSDictionary *)model;


@end
