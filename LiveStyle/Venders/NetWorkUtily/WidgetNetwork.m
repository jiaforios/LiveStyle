//
//  WidgetNetwork.m
//  LiveStyle
//
//  Created by qlh on 2017/2/27.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "WidgetNetwork.h"
#import "NetworkTool.h"
@implementation WidgetNetwork

+ (void)todayHappen:(NSString *)urlStr
          andParams:(id)params
        andsucBlock:(successBlock)sblock
       andFailBlock:(failureBlock)fblock
{
    [NetworkTool getWithUrlString:urlStr andParams:params success:sblock fail:fblock];
}


+ (void)joke:(NSString *)urlStr
          andParams:(id)params
        andsucBlock:(successBlock)sblock
       andFailBlock:(failureBlock)fblock
{
    [NetworkTool getWithUrlString:urlStr andParams:params success:sblock fail:fblock];
    
}

@end
