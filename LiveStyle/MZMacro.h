//
//  MZMacro.h
//  AirMonitor
//
//  Created by zengjia on 16/12/8.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#ifndef MZMacro_h
#define MZMacro_h

#define MZ_WIDTH [[UIScreen mainScreen]bounds].size.width
#define MZ_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#define MZLocalizedString(key) ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"zh-Hans"].length)? ([[NSBundle mainBundle] localizedStringForKey:key value:@"" table:nil]):([[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"]] localizedStringForKey:key value:@"" table:nil])

#define MZLog(...) NSLog(@"%s (%d) \n%@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])

#define font_20 [UIFont systemFontOfSize:20]
#define font_15 [UIFont systemFontOfSize:15]
#define font_17 [UIFont systemFontOfSize:17]
#define font_80 [UIFont systemFontOfSize:80]

#define NET_ERROR @"neterror"

#define ScoreUrlStr  @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=1118629188"

#define kBaseUrl  @"http://1496m4862c.imwork.net:8080/EnvironmentMonitor/airQuality/queryAirQuality.do?"


#define kHistoryBaseUrl  @"http://1496m4862c.imwork.net:8080/EnvironmentMonitor/airQuality/queryAirQualitys.do?"

#define kNowHeatherUrl @"https://free-api.heweather.com/v5/now?"
#define kDevNetUrl @"http://www.smart029.com"
#define kcalendarUrl @"https://japi.juhe.cn/calendar/day?"
#define APPVERSIONURL @"https://itunes.apple.com/lookup?id=1118629188"
#define valuePoint(a,b) [NSValue valueWithCGPoint:CGPointMake(a, b)]

#define Realm [RLMRealm defaultRealm]



#define todayHappenUrl @"http://api.juheapi.com/japi/toh?"
#define todayHappenToken @"32224c03653c9b305585abb3bae0c3b0"





#endif /* MZMacro_h */

