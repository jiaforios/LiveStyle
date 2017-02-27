//
//  BaseViewController.h
//  LiveStyle
//
//  Created by qlh on 2017/2/23.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


@property (nonatomic, copy)NSString *pageName;
@property (nonatomic, strong)UIColor *bgColor;
- (UIViewController *)getCurrentUIVC;

@end
