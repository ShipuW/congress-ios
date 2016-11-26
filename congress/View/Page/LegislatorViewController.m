//
//  LegislatorViewController.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "LegislatorViewController.h"

@interface LegislatorViewController ()

@end

@implementation LegislatorViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = _categoryInfo.name;
    self.navigationItem.title = _categoryInfo.name;
    [self addNewsTable];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)addNewsTable{
    
    if (_tableWidget == nil) {
        _tableWidget = [self.storyboard instantiateViewControllerWithIdentifier:@"LegislatorTableViewController"];
        _tableWidget.categoryInfo = _categoryInfo;
        _tableWidget.owner = self;
        _tableWidget.view.frame = self.view.bounds;
        
        [self.view addSubview:_tableWidget.view];
    }
    else {
        _tableWidget.categoryInfo = _categoryInfo;
        [_tableWidget reloadData];
    }
}

@end
