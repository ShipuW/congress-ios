//
//  BaseTableViewController.m
//  congress
//
//  Created by 王士溥 on 11/24/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController () 
@end

@implementation BaseTableViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.listData = [[NSMutableArray alloc] init];
    self.filterData = [[NSMutableArray alloc] init];
    self.indexTitles = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(self.needRefresh && [self.categoryInfo.name isEqualToString:FAVORITE_CATEGORY]){
        self.listData = [[NSMutableArray alloc] init];
        [self reloadData];
    }
}

- (void)updateUI
{
    [_tableView reloadData];
}

- (NSDictionary *)generateGroupedDataFromArray:(NSArray *)array{
    return [[NSDictionary alloc]init];
}

#pragma mark - OperationDelegate methods

- (void)opSuccess:(id)data
{
    [super opSuccess:data];
    
    self.listData = data;
    [self updateUI];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource methods

-(void)tableView:(UITableView *)tableView  willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.filterData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = (BaseTableViewCell*)[tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (cell == nil) {
        NSArray* Objects = [[NSBundle mainBundle] loadNibNamed:self.cellIdentifier owner:tableView options:nil];
        
        cell = [Objects objectAtIndex:0];
        [cell initCell];
    }
    
    [cell setCellData:[self.filterData objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

//*实现更新代理
//-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
//{
//    
//    NSString *searchText=searchController.searchBar.text;
//    NSMutableArray *searchResult=[[NSMutableArray alloc]init];
//    for (BaseModel *p in self.listData) {
//        NSRange range=[p.ID rangeOfString:searchText];
//        if (range.length>0) {
//            [searchResult addObject:p];
//        }
//    }
//    self.listData=searchResult;
//    
//    
//    [_tableView reloadData];
//}



//#pragma mark - UISearchResultsUpdating
//
////*实现更新代理
//-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
//{
//
//    NSString *searchText=searchController.searchBar.text;
//    NSMutableArray *searchResult=[[NSMutableArray alloc]init];
//    for (BaseModel *p in self.listData) {
//        NSRange range=[p.ID rangeOfString:searchText];
//        if (range.length>0) {
//            [searchResult addObject:p];
//        }
//    }
//    self.listData=searchResult;
//    
//
//    [_tableView reloadData];
//}

//-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
//{
//    NSString *searchText=searchBar.text;
//    NSMutableArray *searchResult=[[NSMutableArray alloc]init];
//    for (BaseModel *p in self.listData) {
//        NSRange range=[p.ID rangeOfString:searchText];
//        if (range.length>0) {
//            [searchResult addObject:p];
//        }
//    }
//    self.listData=searchResult;
//    
//    
//    [_tableView reloadData];
//}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF.ID CONTAINS %@",searchText];
    self.filterData = (NSMutableArray *)[self.listData filteredArrayUsingPredicate:pred];
    [_tableView reloadData];
}

@end
