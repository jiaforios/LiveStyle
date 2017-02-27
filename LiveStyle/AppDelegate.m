//
//  AppDelegate.m
//  LiveStyle
//
//  Created by qlh on 2017/2/23.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "AppDelegate.h"
#import "LSTabViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self initRealm];
    
    LSTabViewController *lstab = [[LSTabViewController alloc] init];
    
    self.window.rootViewController = lstab;
    
    return YES;
}


- (void)initRealm
{

    
    
    
    [Realm transactionWithBlock:^{
        
        RLMResults *reault = [RealmModel allObjects];
        if (reault.count == 0) {
            
            NSString *path = [[NSBundle mainBundle] pathForResource:@"widgetPlist" ofType:@"plist"];
            
            NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
            NSArray *AllSupportWidget = [dic allKeys];

            NSLog(@"第一次使用 初始化数据");

            for (int i = 0; i<AllSupportWidget.count; i++) {
                
                RealmModel *model = [RealmModel new];
                model.added = NO;
                model.widgetId = [AllSupportWidget[i] intValue];
                model.widgetName = [dic objectForKey:AllSupportWidget[i]];

                [Realm addObject:model];
            }

        }else
        {
            NSLog(@"数据库中已存在数据");
        }
        
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
