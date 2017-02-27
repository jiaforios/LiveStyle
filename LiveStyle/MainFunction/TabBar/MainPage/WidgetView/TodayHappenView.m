//
//  TodayHappenView.m
//  LiveStyle
//
//  Created by qlh on 2017/2/27.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "TodayHappenView.h"
#import "UIScrollView+EmptyDataSet.h"
#import "TodayHappenCell.h"
#import "todayHappenModel.h"
#import "WidgetNetwork.h"

@interface TodayHappenView ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)todayHappenModel *tmodel;

@property (nonatomic, strong)UITableView *tabv;


@end

@implementation TodayHappenView

- (instancetype)init
{
    if (self = [super init]) {
        
        [self addSubview:self.tabv];
        [_tabv mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    
    return  self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.tabv];
    }
    
    return self;
}
- (void)requestData
{
    NSDictionary *params = @{@"key":todayHappenToken,@"v":@"1.0",@"month":[DateManager getMonth],@"day":[DateManager getDay]};
    
    [WidgetNetwork todayHappen:todayHappenUrl andParams:params andsucBlock:^(id dic) {
        
        _tmodel = [todayHappenModel mj_objectWithKeyValues:dic];
        [_tabv reloadData];
        
    } andFailBlock:^(NSError *error) {
        
        NSLog(@"error = %@",[error description]);
    }];
}

- (UITableView *)tabv
{
    if (!_tabv) {
        _tabv = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
   
        _tabv.delegate = self;
        _tabv.dataSource = self;
        _tabv.emptyDataSetSource = self;
        _tabv.emptyDataSetDelegate = self;
        _tabv.estimatedRowHeight = 100;
        [_tabv registerNib:[UINib nibWithNibName:@"TodayHappenCell" bundle:nil] forCellReuseIdentifier:@"todaycell"];
        _tabv.tableFooterView = [UIView new];

    }
    
    return _tabv;
}

#pragma  mark tabview delagate  + dataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _tmodel.result.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodayHappenCell *todaycell = [tableView dequeueReusableCellWithIdentifier:@"todaycell" forIndexPath:indexPath];
    
    [todaycell viewData:_tmodel.result[indexPath.row]];
    
    [todaycell layoutIfNeeded];
    return  todaycell;
}


- (void)reloadView
{
    [self.tabv reloadData];
}

#pragma mark empty dataSource + delegate   https://github.com/dzenbot/DZNEmptyDataSet

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"empty_placeholder"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"Please Allow Photo Access";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"This allows you to share photos from your library and save photos to your camera roll.";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]};
    
    return [[NSAttributedString alloc] initWithString:@"Continue" attributes:attributes];
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [UIImage imageNamed:@"button_image"];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor whiteColor];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    // button tap
    
    NSLog(@" button Taped");
    
}

@end

