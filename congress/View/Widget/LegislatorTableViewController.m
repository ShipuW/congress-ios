//
//  LegislatorTableViewController.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "LegislatorTableViewController.h"
#import "FilterTableViewCell.h"

@interface LegislatorTableViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>{

    NSArray *states;
}

@end

@implementation LegislatorTableViewController

- (void)viewDidLoad
{
    self.cellIdentifier = @"LegislatorsCell";
    _cellHeight = 80;

    RegisterNotify(AddLegNotice, @selector(setRefreshStatus))
    
    [super viewDidLoad];
    states = @[@"All States",@"Alabama",@"Alaska",@"Arizona",@"Arkansas",@"California",@"Colorado",@"Connecticut",@"Delaware",@"Florida",@"Georgia", @"Hawaii",@"Idaho", @"Illinois", @"Indiana",   @"Iowa",@"Kansas", @"Kentucky", @"Louisiana",@"Maine",@"Maryland", @"Massachusetts", @"Michigan", @"Minnesota",@"Mississippi",@"Missouri",@"Montana",@"Nebraska", @"Nevada",@"New Hampshire",@"New Jersey",@"New Mexico", @"New York",@"North Carolina",@"North Dakota", @"Ohio", @"Oklahoma",@"Oregon",@"Pennsylvania",@"Rhode Island",@"South Carolina", @"South Dakota",@"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington",@"West Virginia", @"Wisconsin", @"Wyoming"];
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
    if([self.listData count])
        [self.listData removeAllObjects];
    if([self.filterData count])
        [self.filterData removeAllObjects];
    [super reloadData];
}


- (void)requestServerOp
{
    NSString *url = [NSString stringWithFormat:@"%@%@%@%@%@%@",MAIN_URL,LEGISLATOR_URL,CongressKey,ALLDATAFILTER,ChamberFilter,self.categoryInfo.name];
//    NSString *url = @"http://104.198.0.197:8080/legislators?per_page=all";
    NSDictionary *dictInfo = @{@"url":url};
    [activityIndicatorView startAnimating];
    _operation = [[GetLegislators alloc] initWithDelegate:self opInfo:dictInfo];
    [_operation executeOp];
}

- (void)getLocalData{
    [activityIndicatorView stopAnimating];
    NSData *getLegislatorsData = [defaults objectForKey:SAVE_LEG_KEY];
    [self.listData addObjectsFromArray:[NSKeyedUnarchiver unarchiveObjectWithData:getLegislatorsData]];
    [self.filterData addObjectsFromArray: self.listData];
    self.filterData = (NSMutableArray*)[LegislatorModel sortByFirstName:self.filterData];
    self.groupedItems = [self generateGroupedDataFromArray:self.filterData];
    self.sectionTitles = [[self.groupedItems allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self updateUI];
    self.needRefresh = NO;
}

- (void)opSuccess:(NSArray *)data
{
    [activityIndicatorView stopAnimating];
    _operation = nil;

    [self.listData addObjectsFromArray:data];
    
    [self.filterData addObjectsFromArray:self.listData];
    self.filterData = (NSMutableArray*)[LegislatorModel sortByFirstName:self.filterData];
    self.groupedItems = [self generateGroupedDataFromArray:self.filterData];
    self.sectionTitles = [[self.groupedItems allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self updateUI];
    self.needRefresh = NO;

}

- (NSDictionary *)generateGroupedDataFromArray:(NSArray *)array{
    NSMutableDictionary* res = [[NSMutableDictionary alloc]init];
    for(LegislatorModel *leg in array){
        NSString * firstChar = [leg.state substringToIndex:1];

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
    if(tapFilter)return 1;
    // Return the number of sections.
    return [self.sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tapFilter)return 1;
    // Return the number of rows in the section.
    NSString *sectionTitle = [self.sectionTitles objectAtIndex:section];
    NSArray *sectionItems = [self.groupedItems objectForKey:sectionTitle];
    return [sectionItems count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tapFilter)return self.view.frame.size.height;
    return 55;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(tapFilter)return nil;
    return [self.sectionTitles objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tapFilter){
        FilterTableViewCell *cell = (FilterTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"FilterTableViewCell"];
        
        if (cell == nil) {
            NSArray* Objects = [[NSBundle mainBundle] loadNibNamed:@"FilterTableViewCell" owner:tableView options:nil];
            cell = [Objects objectAtIndex:0];
        }
        cell.pickerView.delegate = self;
        cell.pickerView.dataSource = self;
        return cell;
    }
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
    if(tapFilter)return nil;
    return self.indexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if(tapFilter)return 0;
    return [self.sectionTitles indexOfObject:title];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tapFilter)return ;
    self.goDetail = YES;
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
    
    if([searchText isEqualToString:@""]){
        self.filterData = self.listData;
    }else{
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF.firstName CONTAINS %@",searchText];
        self.filterData = (NSMutableArray *)[self.listData filteredArrayUsingPredicate:pred];
    }
    self.filterData = (NSMutableArray*)[LegislatorModel sortByFirstName:self.filterData];
    self.groupedItems = [self generateGroupedDataFromArray:self.filterData];
    self.sectionTitles = [[self.groupedItems allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self updateUI];
    self.needRefresh = NO;
}
-(void)loadPicker{
    tapFilter = YES;
    [self updateUI];
}

#pragma UIPickerViewDataSource,Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    return states.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
               titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    return [states objectAtIndex:row];
}

// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component
{
    
    tapFilter=NO;
    if([[states objectAtIndex:row] isEqualToString:@"All States"]){
        self.filterData = self.listData;
    }else{
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF.state == %@",[states objectAtIndex:row]];
        self.filterData = (NSMutableArray *)[self.listData filteredArrayUsingPredicate:pred];
    }
    self.filterData = (NSMutableArray*)[LegislatorModel sortByFirstName:self.filterData];
    self.groupedItems = [self generateGroupedDataFromArray:self.filterData];
    self.sectionTitles = [[self.groupedItems allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self updateUI];
    self.needRefresh = NO;

}

@end
