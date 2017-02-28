//
//  JokeViewModel.m
//  LiveStyle
//
//  Created by qlh on 2017/2/28.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "JokeViewModel.h"
#import "JokeModel.h"
#import "WidgetNetwork.h"

@implementation JokeViewModel

- (void)headerRefreshRequestWithPage:(int)page Callback:(callback)callback
{
    NSDictionary *param = @{@"key":JOKEToken,@"page":@(page).stringValue,@"rows":@"10"};
    [WidgetNetwork joke:JOKEUrl andParams:param andsucBlock:^(id dic) {
        
        JokeModel *jModel = [JokeModel mj_objectWithKeyValues:dic];
        callback?callback(jModel.Jokeresult):nil;
        
    } andFailBlock:^(NSError *error) {
        callback?callback(nil):nil;
    }];
    
}

- (void )footerRefreshRequestWithPage:(int)page Callback:(callback)callback
{

}
@end
