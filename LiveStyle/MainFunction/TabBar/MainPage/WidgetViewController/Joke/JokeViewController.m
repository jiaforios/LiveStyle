//
//  JokeViewController.m
//  LiveStyle
//
//  Created by qlh on 2017/2/28.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "JokeViewController.h"
#import "JokeViewModel.h"
#import "TabviewProtocal.h"

@interface JokeViewController ()
@property (nonatomic, strong)UITableView *tabv;
@property (nonatomic, strong)JokeViewModel *JVModel;
@property (nonatomic, strong)TabviewProtocal *tabProtocal;

@property (nonatomic, strong)NSMutableArray *dataSource;


@end

@implementation JokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.view addSubview:self.tabv];
    
    [self requestHeadData];
    
}

- (void)requestHeadData
{
    
    [self.JVModel headerRefreshRequestWithPage:1 Callback:^(NSArray* result) {
        
        _tabProtocal.array = [result mutableCopy];
        [self.tabv reloadData];
        
    }];
    
}

- (void)requestFootData
{
    [self.JVModel footerRefreshRequestWithPage:0 Callback:^(NSArray* result) {
        
        
    }];
}


- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}
- (JokeViewModel *)JVModel
{
    if (_JVModel == nil) {
        _JVModel = [JokeViewModel new];
    }
    
    return _JVModel;
    
}

- (UITableView *)tabv
{
    if (_tabv == nil) {
        _tabv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
         _tabProtocal = [TabviewProtocal new];
        _tabv.estimatedRowHeight = 44;
        self.tabv.delegate = _tabProtocal;
        self.tabv.dataSource = _tabProtocal;
        [_tabv registerNib:[UINib nibWithNibName:@"JokeCell" bundle:nil] forCellReuseIdentifier:@"identifiercell"];
    }
    
    return _tabv;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
