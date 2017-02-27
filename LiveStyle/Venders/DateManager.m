//
//  DateManager.m
//  LiveStyle
//
//  Created by qlh on 2017/2/27.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "DateManager.h"

@interface DateManager ()

@property (nonatomic ,strong)NSDateComponents *components;

@end

@implementation DateManager

static DateManager *manager = nil;

+(instancetype)Sharemanager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[DateManager alloc] init];
    });
    
    return manager;
}


- (instancetype)init
{
    if (self = [super init]) {
        NSDate  *currentDate = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
         _components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    }
    return self;
}

+ (NSString *)getYear
{
    return @([[DateManager Sharemanager].components year]).stringValue;
}

+(NSString *)getMonth
{
    return @([[DateManager Sharemanager].components month]).stringValue;
}

+(NSString *)getDay
{
    return @([[DateManager Sharemanager].components day]).stringValue;
}

@end


