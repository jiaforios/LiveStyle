//
//  DateManager.h
//  LiveStyle
//
//  Created by qlh on 2017/2/27.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateManager : NSObject

+ (instancetype)Sharemanager;

+ (NSString *)getYear;
+ (NSString *)getMonth;
+ (NSString *)getDay;

@end
