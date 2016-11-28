//
//  BaseDetailViewController.m
//  congress
//
//  Created by 王士溥 on 11/27/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BaseDetailViewController.h"

@interface BaseDetailViewController ()

@end

@implementation BaseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavRightButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setNavRightButton{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"star" style:UIBarButtonItemStylePlain target:self action:@selector(tappedStar)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)tappedStar{
    
   
}


@end
