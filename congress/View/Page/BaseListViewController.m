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
    [self setNavigationBarLeftButton];
    [self setNavigationBarRightButton];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
//    [_searchBar setHidden:NO];
    [self.tabBarController.tabBar setHidden: NO];
    _tableWidget.goDetail=NO;
    [super viewWillAppear:animated];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    if(![_categoryInfo.name isEqualToString:@""])
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [_searchBar setHidden:YES];
    [_searchBar resignFirstResponder];
    rightButton.image = [UIImage imageNamed:SEARCH_IMAGE];
    if(_tableWidget.goDetail==YES)
        [self.tabBarController.tabBar setHidden: YES];
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setNavigationBarLeftButton{
    [self addLeftBarButtonWithImage:[UIImage imageNamed:@"leftNaviIcon"]];
}

- (void)setNavigationBarRightButton{
    rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:SEARCH_IMAGE] style:UIBarButtonItemStylePlain target:self action:@selector(tapSearchButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
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
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(50, 10, self.navigationController.navigationBar.bounds.size.width - 100, 20)];
    [self.navigationController.navigationBar addSubview:self.searchBar];
    [self.searchBar setHidden:YES];
    self.searchBar.delegate = _tableWidget;

}

- (void)setNavigationSearchBar{
    
    
}

- (void)tapSearchButton{
    if(self.searchBar.hidden == YES){
        rightButton.image = [UIImage imageNamed:CANCEL_IMAGE];
        [self.searchBar setHidden:NO];
        [self.searchBar becomeFirstResponder];
    }else{
        rightButton.image = [UIImage imageNamed:SEARCH_IMAGE];
        [self.searchBar setHidden:YES];
        [self.searchBar resignFirstResponder];
    }
}

@end
