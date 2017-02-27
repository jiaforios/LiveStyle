//
//  LSTabViewController.m
//  LiveStyle
//
//  Created by qlh on 2017/2/23.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "LSTabViewController.h"
#import "BaseNavController.h"
#import "MainViewController.h"
#import "AddViewController.h"
#import "SettingViewController.h"

@interface LSTabViewController ()

@end

@implementation LSTabViewController


- (instancetype)init
{
    if (self = [super init]) {
      
        NSArray *clsArr = @[@"MainViewController",
                            @"AddViewController",
                            @"SettingViewController"];
        
        NSArray *colorArr = @[[UIColor whiteColor],
                                  [UIColor whiteColor],
                                  [UIColor whiteColor]];
        
        NSArray *nameArr = @[@"常用",
                            @"添加",
                            @"设置"];
        
          [self makeNav:clsArr
               andColor:colorArr
             andNameArr:nameArr];
        

    }
    
    return self;
}



- (void)makeNav:(NSArray <NSString *>*)clsarr
       andColor:(NSArray <UIColor *>*)colorArr
     andNameArr:(NSArray <NSString *>*)nameArr
{
    
    NSMutableArray *vcArr = [NSMutableArray new];
    
    [clsarr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        Class cls = NSClassFromString(obj);
        
        BaseViewController * objvc = [cls new];
        objvc.bgColor = colorArr[idx];
        objvc.pageName = nameArr[idx];
        
        BaseNavController *bav = [[BaseNavController alloc] initWithRootViewController:objvc];
        
        [bav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
        bav.tabBarItem.title = nameArr[idx];
        
        [vcArr addObject:bav];
        
    }];
    
    self.viewControllers = vcArr;

}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}



@end
