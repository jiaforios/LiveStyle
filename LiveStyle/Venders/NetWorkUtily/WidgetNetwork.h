//
//  WidgetNetwork.h
//  LiveStyle
//
//  Created by qlh on 2017/2/27.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^successBlock)(id dic);
typedef void(^failureBlock)(NSError *error);

@interface WidgetNetwork : NSObject

+ (void)todayHappen:(NSString *)urlStr
          andParams:(id)params
        andsucBlock:(successBlock)sblock
       andFailBlock:(failureBlock)fblock;

+ (void)joke:(NSString *)urlStr
          andParams:(id)params
        andsucBlock:(successBlock)sblock
       andFailBlock:(failureBlock)fblock;

@end
