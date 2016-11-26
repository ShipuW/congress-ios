//
//  BaseViewController.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigationBar{
    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    button.backgroundColor = ViewTextBlack;
    [button addTarget:self action:@selector(presentLeftMenu) forControlEvents: UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:button];
}

- (void)presentLeftMenu{
    [self.slideMenuController openLeft];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
