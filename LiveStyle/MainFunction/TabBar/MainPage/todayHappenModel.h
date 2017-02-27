//
//  todayHappenModel.h
//  LiveStyle
//
//  Created by qlh on 2017/2/24.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface result :NSObject
@property (nonatomic , copy) NSString              * _id;
@property (nonatomic , copy) NSString              * pic;
@property (nonatomic , strong) NSNumber              * day;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , strong) NSNumber              * month;
@property (nonatomic , strong) NSNumber              * year;
@property (nonatomic , copy) NSString              * lunar;
@property (nonatomic , copy) NSString              * des;

@end

@interface todayHappenModel :NSObject
@property (nonatomic , strong) NSArray              * result;
@property (nonatomic , strong) NSNumber              * error_code;
@property (nonatomic , copy) NSString              * reason;

@end
