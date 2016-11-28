//
//  BaseListViewController.h
//  congress
//
//  Created by 王士溥 on 11/27/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableViewController.h"

@interface BaseListViewController : BaseViewController{
    NSString *tableIdentifier;
    BaseTableViewController *_tableWidget;
}

@property(nonatomic, strong) CategoryModel    *categoryInfo;

@property(nonatomic, strong) UISearchBar  *searchBar;

@end
