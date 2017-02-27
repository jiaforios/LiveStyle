//
//  AddViewController.m
//  LiveStyle
//
//  Created by qlh on 2017/2/23.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *addTabv;
@property (nonatomic, copy)NSMutableArray *dataSource;
@property (nonatomic, strong) RLMNotificationToken *token;
@end

@implementation AddViewController

-(void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.addTabv];
    
    _token =  [Realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
        // 当前界面不是 key window 才刷新
        if([[self  getCurrentUIVC] isKindOfClass:[AddViewController class]])
        {
        }else
        {
            // 不是keywindow 才处理外界通知更新UI
            [self getDataFromRealm];
            [self.addTabv reloadData];
        }
       
    }];

}





#pragma mark DataSource LazyLoad

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray new];
        [self getDataFromRealm];
    }
  
    
    return _dataSource;
}


- (void)getDataFromRealm
{
    
    [_dataSource removeAllObjects];
    [Realm transactionWithBlock:^{
        
        RLMResults *result = [RealmModel allObjects];
        
        for (RealmModel *m in result) {
            
            if (!m.isAdded) {
                [_dataSource addObject:m];    // 只保留 未添加的
            }
            
        }
    }];
}


#pragma mark DataSource tabview LazyLoad


- (UITableView *)addTabv
{
    if (_addTabv == nil) {
        _addTabv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
        _addTabv.delegate = self;
        _addTabv.dataSource = self;
        _addTabv.editing = YES; // 开启编辑，才会显示前面的加减号
        
    }
    return _addTabv;
}

#pragma mark   delegate + dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    RealmModel *m = self.dataSource[indexPath.row];
    
    cell.textLabel.text = m.widgetName;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        [Realm transactionWithBlock:^{
            RLMResults *result = [RealmModel allObjects];
            RealmModel *model = self.dataSource[indexPath.row];
            for (RealmModel *m in result) {
                if (m.widgetId == model.widgetId) {
                    m.added = YES;
                    [self.dataSource removeObject:self.dataSource[indexPath.row]];
                    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
                }
            }
        }];
    }
}


- (void)dealloc
{
    [_token stop];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
