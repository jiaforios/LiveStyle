//
//  TodayHappenViewController.m
//  LiveStyle
//
//  Created by qlh on 2017/2/27.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "TodayHappenViewController.h"
#import "TodayHappenView.h"

@interface TodayHappenViewController ()
@property (nonatomic, strong)TodayHappenView *tview;

@end

@implementation TodayHappenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    _tview = [[TodayHappenView alloc] init];

    [self.view addSubview:_tview];
    
    [_tview mas_makeConstraints:^(MASConstraintMaker *make) {

        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    [_tview requestData];

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
