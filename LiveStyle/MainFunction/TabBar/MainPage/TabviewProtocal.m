//
//  TabviewProtocal.m
//  LiveStyle
//
//  Created by qlh on 2017/2/28.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "TabviewProtocal.h"
#import "JokeModel.h"
#import "JokeCell.h"
@implementation TabviewProtocal

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *identifiercell = @"identifiercell";
    JokeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiercell];
    if (cell == nil) {
        cell = [[JokeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifiercell];
        cell.detailTextLabel.numberOfLines = 0;
    }
    
    NSDictionary *dic = _array[indexPath.row];
    Jokeresult *rModel = [Jokeresult mj_objectWithKeyValues:dic];
    [cell jokeViewData:rModel];
    [cell layoutIfNeeded];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_array.count>0) {
//        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:((CustomModel *)[_array objectAtIndex:indexPath.row]).title delegate:nil cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
//        [alert show];
    }
}
@end
