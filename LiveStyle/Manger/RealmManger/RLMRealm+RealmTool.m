//
//  RLMRealm+RealmTool.m
//  LiveStyle
//
//  Created by qlh on 2017/2/24.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "RLMRealm+RealmTool.h"

@implementation RLMRealm (RealmTool)

- (void)realmAdd:(__attribute__((noescape)) void(^)(void))block NS_SWIFT_UNAVAILABLE("")
{
    
    [Realm transactionWithBlock:block];

}
@end
