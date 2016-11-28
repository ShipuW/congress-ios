//
//  BaseListViewController.m
//  congress
//
//  Created by 王士溥 on 11/27/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BaseListViewController.h"

@interface BaseListViewController ()

@end

@implementation BaseListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNavigationSearchBar];
    [self addNewsTable];
    [self configSearchBar];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [_searchBar setHidden:NO];
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [_searchBar setHidden:YES];
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)addNewsTable{
    
    if (_tableWidget == nil) {
        _tableWidget = [self.storyboard instantiateViewControllerWithIdentifier:tableIdentifier];
        _tableWidget.categoryInfo = self.categoryInfo;
        _tableWidget.owner = self;
        _tableWidget.view.frame = self.view.bounds;
        
        [self.view addSubview:_tableWidget.view];
    }
    else {
        _tableWidget.categoryInfo = self.categoryInfo;
        [_tableWidget reloadData];
    }
}
- (void)configSearchBar{
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    [self.navigationController.navigationBar addSubview:self.searchBar];

    self.searchBar.delegate = _tableWidget;

}

- (void)setNavigationSearchBar{
    

    
    
}

@end
