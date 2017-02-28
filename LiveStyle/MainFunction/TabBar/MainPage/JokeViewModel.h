//
//  JokeViewModel.h
//  LiveStyle
//
//  Created by qlh on 2017/2/28.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^callback) (NSArray * result);

@interface JokeViewModel : NSObject
//tableView头部刷新的网络请求

- (void)headerRefreshRequestWithPage:(int)page Callback:(callback)callback;
//tableView底部刷新的网络请求

- (void )footerRefreshRequestWithPage:(int)page Callback:(callback)callback;

@end
