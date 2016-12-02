//
//  BaseTableViewController.h
//  congress
//
//  Created by 王士溥 on 11/24/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseWidgetController.h"

@interface BaseTableViewController : BaseWidgetController<UISearchBarDelegate>{
    IBOutlet UITableView    *_tableView;
    CGFloat                 _cellHeight;
    BOOL                    tapFilter;
}
@property(strong, nonatomic) NSMutableArray    *filterData;
@property(nonatomic) BOOL       goDetail;
@property(nonatomic, strong) NSString   *cellIdentifier;
@property(nonatomic, assign) id         owner;
@property(strong, nonatomic) NSDictionary *groupedItems;
@property(strong, nonatomic) NSArray *sectionTitles;
@property(strong, nonatomic) NSArray *indexTitles;
@property(strong, nonatomic) NSMutableArray *searchData;

- (void)loadPicker;

- (NSDictionary *)generateGroupedDataFromArray:(NSArray *)array;

@end
