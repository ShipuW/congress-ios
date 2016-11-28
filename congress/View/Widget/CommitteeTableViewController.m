//
//  CommitteeTableViewController.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "CommitteeTableViewController.h"

@interface CommitteeTableViewController ()

@end

@implementation CommitteeTableViewController

- (void)viewDidLoad
{
    self.cellIdentifier = @"CommitteesCell";
    _cellHeight = 80;
    
    
    RegisterNotify(AddComNotice, @selector(setRefreshStatus))
    
    [super viewDidLoad];
}



- (void)dealloc
{
    RemoveNofify
}

- (void)setRefreshStatus{
    self.needRefresh = YES;
}

- (void)reloadData
{
    // 停止网络请求
    [_operation cancelOp];
    _operation = nil;
    
    // 先清除上次内容
    [self.listData removeAllObjects];
    [self.filterData removeAllObjects];
    [super reloadData];
}

- (void)requestServerOp
{
    NSString *url = [NSString stringWithFormat:@"%@%@%@%@%@%@",MAIN_URL,COMMITTEE_URL,CongressKey,ALLDATAFILTER,ChamberFilter,self.categoryInfo.name];
    NSDictionary *dictInfo = @{@"url":url};
    
    _operation = [[GetCommittees alloc] initWithDelegate:self opInfo:dictInfo];
    [_operation executeOp];
}

- (void)getLocalData{
    [self.listData removeAllObjects];
    [self.filterData removeAllObjects];
    NSData *getCommitteesData = [defaults objectForKey:SAVE_COM_KEY];
    [self.listData addObjectsFromArray:[NSKeyedUnarchiver unarchiveObjectWithData:getCommitteesData]];
    self.filterData = self.listData;
    self.filterData = (NSMutableArray*)[CommitteeModel sortByName:self.filterData];
    
    [self updateUI];
    self.needRefresh = NO;
}


- (void)opSuccess:(NSArray *)data
{
    _operation = nil;
    [self.listData removeAllObjects];
    [self.filterData removeAllObjects];
    [self.listData addObjectsFromArray:data];
    self.filterData = self.listData;
    self.filterData = (NSMutableArray*)[CommitteeModel sortByName:self.filterData];
    
    [self updateUI];
    self.needRefresh = NO;
    
}


#pragma UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.filterData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = nil;
    CommitteeModel *info = nil;
    
    if (indexPath.row < self.filterData.count) {
        cellIdentifier = self.cellIdentifier;
        info = [self.filterData objectAtIndex:indexPath.row];
    }else{
        return nil;
    }
    
    
    CommitteeTableViewCell *cell = (CommitteeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [cell initCell];
    
    info = [self.filterData objectAtIndex:indexPath.row];
    
    [cell setCellData:info];
    
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CommitteeDetailViewController *page = [[CommitteeDetailViewController alloc] init];
    page.committeeInfo = [self.filterData objectAtIndex:indexPath.row];
    UIViewController *owner =  self.owner;
    [owner.navigationController pushViewController:page animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS %@",searchText];
    self.filterData = (NSMutableArray *)[self.listData filteredArrayUsingPredicate:pred];
    self.filterData = (NSMutableArray*)[LegislatorModel sortByFirstName:self.filterData];
    self.groupedItems = [self generateGroupedDataFromArray:self.filterData];
    self.sectionTitles = [[self.groupedItems allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self updateUI];
    self.needRefresh = NO;
}



@end
