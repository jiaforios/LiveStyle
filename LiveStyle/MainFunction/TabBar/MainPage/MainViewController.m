//
//  MainViewController.m
//  LiveStyle
//
//  Created by qlh on 2017/2/23.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "MainViewController.h"
#import "TodayHappenCell.h"
#import "WidgetNetwork.h"
#import "todayHappenModel.h"
#import "TodayHappenView.h"
#import "TodayHappenViewController.h"
#import "QRViewController.h"
#import "JokeViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *widgetTabv;
@property (nonatomic, copy)NSMutableArray *dataSource;
@property (nonatomic, strong) RLMNotificationToken *token;  // 此处的数据库更新通知必须是强指针


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.widgetTabv];
    
    [self.widgetTabv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-49);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(50*5);
    }];
    
    [self realmToken];
    
}


// 配置 数据库消息通知

- (void)realmToken
{
    _token =  [Realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
        
        if([[self  getCurrentUIVC] isKindOfClass:[MainViewController class]])
        {
            
        }else
        {
            // 不是keywindow 才处理外界通知更新UI
            [self getDataFromRealm:^(NSArray *arr) {
                [self.widgetTabv reloadData];
            }];
            
        }
        
    }];
}


- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray new];
        [self getDataFromRealm:nil];
    }
    return _dataSource;
}

- (void)getDataFromRealm:(void(^)(NSArray *))realmBlock
{
    
    [_dataSource removeAllObjects];
    
    [Realm transactionWithBlock:^{
        
        RLMResults *result = [RealmModel allObjects];
        
        for (RealmModel *m in result) {
            
            if (m.isAdded) {
                [_dataSource addObject:m];    // 只获取 添加的
            }
            
        }
        
        realmBlock?realmBlock([_dataSource copy]):nil;
        
    }];
}
- (UITableView *)widgetTabv
{
    if (_widgetTabv == nil) {
        _widgetTabv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _widgetTabv.delegate = self;
        _widgetTabv.dataSource = self;
        _widgetTabv.tableFooterView = [[UIView alloc] init];
    }
    return _widgetTabv;
}

#pragma mark   delegate + dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *V = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MZ_WIDTH, 44)];
    V.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    
//    UIButton *frequency= [[UIButton alloc] initWithFrame:CGRectMake(MZ_WIDTH-100, 10, 100, 20)];
//    [frequency setTitle:@"使用频率" forState:UIControlStateNormal];
//    frequency.titleLabel.font = [UIFont systemFontOfSize:15];
//    [frequency setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [V addSubview:frequency];
    

    return V;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        
    }
    RealmModel *m = self.dataSource[indexPath.row];
    cell.textLabel.text = m.widgetName;
    cell.detailTextLabel.text = @(m.useCount).stringValue;
    [cell layoutIfNeeded];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RealmModel *model = _dataSource[indexPath.row];
    [Realm transactionWithBlock:^{
        RLMResults *result = [RealmModel allObjects];
        RealmModel *model = self.dataSource[indexPath.row];
        for (RealmModel *m in result) {
            if (m.widgetId == model.widgetId) {
                m.useCount++;
            }
        }
        
//     [self.widgetTabv reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        
         [self.widgetTabv reloadData];
         [self.widgetTabv selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];

    }];
    
    [self dealWithWidget:model];
  
}

- (void)dealWithWidget:(RealmModel *)wid
{
    
    switch (wid.widgetId) {
        case 114:
        {
            TodayHappenViewController *tvc = [[TodayHappenViewController alloc] init];
            tvc.pageName = wid.widgetName;
            [self.navigationController pushViewController:tvc animated:YES];
        }
            break;
        case 103:
        {
            QRViewController *tvc = [[QRViewController alloc] init];
            tvc.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:tvc animated:YES];
        }
            break;
        case 106:
        {
            JokeViewController *jvc = [[JokeViewController alloc] init];
            jvc.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:jvc animated:YES];
        }
            break;
            
        default:
        {
            
        }
            break;
    }
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewRowAction *deleAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        [Realm transactionWithBlock:^{
            RLMResults *result = [RealmModel allObjects];
            RealmModel *model = self.dataSource[indexPath.row];
            for (RealmModel *m in result) {
                if (m.widgetId == model.widgetId) {
                    m.added = NO;
                    [self.dataSource removeObject:self.dataSource[indexPath.row]];
                    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
                }
            }
        }];
        
    }];
    
    UITableViewRowAction *fastAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"快捷显示" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        
    }];
    fastAction.backgroundColor = [UIColor blueColor];
    
    
    return @[deleAction,fastAction];

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
