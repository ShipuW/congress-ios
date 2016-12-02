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
    
    tableIdentifier = @"LegislatorTableViewController";
    [super viewDidLoad];


    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setNavigationBarRightButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setNavigationBarRightButton{
    rightButton = [[UIBarButtonItem alloc]initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:self action:@selector(tapSearchButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)tapSearchButton{
    [_tableWidget loadPicker];
}


@end
