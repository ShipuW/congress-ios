//
//  LeftMenuTableViewController.h
//  congress
//
//  Created by 王士溥 on 11/24/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum : NSInteger{
    LeftMenuLeg = 0,
    LeftMenuBil,
    LeftMenuCom,
    LeftMenuFav,
    LeftMenuAbo
} LeftMenu;

@protocol LeftMenuProtocol <NSObject>

@required
-(void)changeViewController:(LeftMenu) menu;

@end

@interface LeftMenuTableViewController : UITableViewController<LeftMenuProtocol, UITableViewDelegate, UITableViewDataSource>


@property (retain, nonatomic) NSArray *menus;
@property (retain, nonatomic) UITabBarController *legislatorViewController;
@property (retain, nonatomic) UITabBarController *billViewController;
@property (retain, nonatomic) UITabBarController *committeeViewController;
@property (retain, nonatomic) UITabBarController *favoriteViewController;
@property (retain, nonatomic) UIViewController *aboutViewController;



@end
