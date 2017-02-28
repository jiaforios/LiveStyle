//
//  JokeCell.h
//  LiveStyle
//
//  Created by qlh on 2017/2/28.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JokeModel.h"
@interface JokeCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

- (void)jokeViewData:(Jokeresult *)result;

@end
