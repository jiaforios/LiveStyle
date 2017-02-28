//
//  JokeModel.h
//  LiveStyle
//
//  Created by qlh on 2017/2/28.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Jokeresult :NSObject
@property (nonatomic , copy) NSString              * unixtime;
@property (nonatomic , copy) NSString              * updatetime;
@property (nonatomic , copy) NSString              * content;
@property (nonatomic , copy) NSString              * hashId;

@end

@interface JokeModel :NSObject
@property (nonatomic , strong) NSArray              * Jokeresult;
@property (nonatomic , strong) NSNumber              * error_code;
@property (nonatomic , copy) NSString              * reason;

@end
