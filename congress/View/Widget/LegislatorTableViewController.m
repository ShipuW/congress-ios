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

    self.listData = [[NSMutableArray alloc] init];
    [super viewDidLoad];
}

- (void)reloadData
{
    // 停止网络请求
    [_operation cancelOp];
    _operation = nil;

    // 先清除上次内容
    [self.listData removeAllObjects];
    [super reloadData];
}

- (void)requestServerOp
{
    
    NSString *url = @"http://104.198.0.197:8080/legislators";
    NSDictionary *dictInfo = @{@"url":url};
    
    _operation = [[GetLegislators alloc] initWithDelegate:self opInfo:dictInfo];
    [_operation executeOp];
}


- (void)opSuccess:(NSArray *)data
{
    _operation = nil;
    [self.listData removeAllObjects];
    [self.listData addObjectsFromArray:data];
    [self updateUI];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = nil;
    BaseModel *info = nil;
    
    if (indexPath.row < self.listData.count) {
        cellIdentifier = self.cellIdentifier;
        info = [self.listData objectAtIndex:indexPath.row];
    }else{
        return nil;
    }

    
    LegislatorTableViewCell *cell = (LegislatorTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [cell initCell];
    
    [cell setCellData:info];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end
