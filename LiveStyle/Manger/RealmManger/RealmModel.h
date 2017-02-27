//
//  RealmModel.h
//  LiveStyle
//
//  Created by qlh on 2017/2/23.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    TOOL,
    LIFE,
} WIDGETTYPE;

@interface RealmModel : RLMObject

@property (nonatomic, copy) NSString *widgetName;

@property (nonatomic, assign,getter=isAdded) BOOL added;


@property (nonatomic, assign) int widgetKind; // 分类

@property (nonatomic, assign) int useCount; // 单位用户使用频率

@property (nonatomic, assign) int allUseCount; // 全平台使用频率

@property (nonatomic, assign) int widgetId;

@end
