//
//  BaseNavController.m
//  LiveStyle
//
//  Created by qlh on 2017/2/23.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "BaseNavController.h"

@interface BaseNavController ()

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    if ([[self.viewControllers objectAtIndex:0] isKindOfClass:[viewController class]]) {

    }else
    {
        
        [viewController.navigationItem setHidesBackButton:YES];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 25)];
        [button setTitle:@"back" forState: UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *left  = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        viewController.navigationItem.leftBarButtonItem = left;
        
        self.tabBarController.tabBar.hidden = YES;
    }
    
}

- (void)backAction
{
    [self popViewControllerAnimated:YES];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;

    [super popToRootViewControllerAnimated:animated];

    return self.viewControllers;
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [super popViewControllerAnimated:animated];

    if (self.viewControllers.count > 1) {
        
        
    }else
    {
        self.tabBarController.tabBar.hidden = NO;

    }
    return nil;
    
//    return [self.viewControllers objectAtIndex:self.viewControllers.count-2];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
