//
//  HWScanViewController.h
//  HWScanTest
//
//  Created by sxmaps_w on 2017/2/18.
//  Copyright © 2017年 hero_wqb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SaomiaoBlock)(NSString *qrStr);

@interface HWScanViewController : UIViewController

@property (nonatomic, copy)SaomiaoBlock sBlock;

@end
