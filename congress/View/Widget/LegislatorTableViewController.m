//
//  LegislatorTableViewController.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "LegislatorTableViewController.h"

@interface LegislatorTableViewController ()

@end

@implementation LegislatorTableViewController

- (void)viewDidLoad
{
    self.cellIdentifier = @"LegislatorsCell";
    _cellHeight = 80;

    RegisterNotify(AddLegNotice, @selector(setRefreshStatus))
    
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
    NSString *url = [NSString stringWithFormat:@"%@%@%@%@%@%@",MAIN_URL,LEGISLATOR_URL,CongressKey,ALLDATAFILTER,ChamberFilter,self.categoryInfo.name];
//    NSString *url = @"http://104.198.0.197:8080/legislators?per_page=all";
    NSDictionary *dictInfo = @{@"url":url};
    
    _operation = [[GetLegislators alloc] initWithDelegate:self opInfo:dictInfo];
    [_operation executeOp];
}

- (void)getLocalData{
    [self.listData removeAllObjects];
    [self.filterData removeAllObjects];
    NSData *getLegislatorsData = [defaults objectForKey:SAVE_LEG_KEY];
    [self.listData addObjectsFromArray:[NSKeyedUnarchiver unarchiveObjectWithData:getLegislatorsData]];
    self.filterData = self.listData;
    self.filterData = (NSMutableArray*)[LegislatorModel sortByFirstName:self.filterData];
    self.groupedItems = [self generateGroupedDataFromArray:self.filterData];
    self.sectionTitles = [[self.groupedItems allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
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
    self.filterData = (NSMutableArray*)[LegislatorModel sortByFirstName:self.filterData];
    self.groupedItems = [self generateGroupedDataFromArray:self.filterData];
    self.sectionTitles = [[self.groupedItems allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self updateUI];
    self.needRefresh = NO;

}

- (NSDictionary *)generateGroupedDataFromArray:(NSArray *)array{
    NSMutableDictionary* res = [[NSMutableDictionary alloc]init];
    for(LegislatorModel *leg in array){
        NSString * firstChar = [leg.firstName substringToIndex:1];

        NSMutableArray *array = [res objectForKey:firstChar];
        if(array == nil) array = [[NSMutableArray alloc]init];
        [array addObject:leg];
        [res setObject:array forKey:firstChar];
        
    }
    return (NSDictionary*)res;
}
#pragma UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [self.sectionTitles objectAtIndex:section];
    NSArray *sectionItems = [self.groupedItems objectForKey:sectionTitle];
    return [sectionItems count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.sectionTitles objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = nil;
    LegislatorModel *info = nil;
    
    if (indexPath.row < self.filterData.count) {
        cellIdentifier = self.cellIdentifier;
        info = [self.filterData objectAtIndex:indexPath.row];
    }else{
        return nil;
    }

    
    LegislatorTableViewCell *cell = (LegislatorTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [cell initCell];
    
    NSString *sectionTitle = [self.sectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionItems = [self.groupedItems objectForKey:sectionTitle];
    info = [sectionItems objectAtIndex:indexPath.row];
    
    [cell setCellData:info];
    
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.indexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [self.sectionTitles indexOfObject:title];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LegislatorDetailViewController *page = [[LegislatorDetailViewController alloc] init];
    NSString *sectionTitle = [self.sectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionItems = [self.groupedItems objectForKey:sectionTitle];
    LegislatorModel *info = [sectionItems objectAtIndex:indexPath.row];
    page.legislatorInfo = info;
    UIViewController *owner =  self.owner;
    [owner.navigationController pushViewController:page animated:YES];
}



- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF.firstName CONTAINS %@",searchText];
    self.filterData = (NSMutableArray *)[self.listData filteredArrayUsingPredicate:pred];
    self.filterData = (NSMutableArray*)[LegislatorModel sortByFirstName:self.filterData];
    self.groupedItems = [self generateGroupedDataFromArray:self.filterData];
    self.sectionTitles = [[self.groupedItems allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self updateUI];
    self.needRefresh = NO;
}

@end
