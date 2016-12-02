//
//  LeftMenuTableViewController.m
//  congress
//
//  Created by 王士溥 on 11/24/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "LeftMenuTableViewController.h"
#import "LeftMenuTableViewCell.h"
#import "LegislatorViewController.h"
#import "BillViewController.h"
#import "CommitteeViewController.h"
#import "FavoriteViewController.h"
#import "AboutViewController.h"
#import "LegFavTableViewController.h"
#import "BilFavTableViewController.h"
#import "ComFavTableViewController.h"

@interface LeftMenuTableViewController ()

@end

@implementation LeftMenuTableViewController

-(void)viewDidLoad {
    self.view.backgroundColor = Leftbar_Background_Color;
    _menus = @[@"Legislators", @"Bills", @"Committees", @"Favorite", @"About"];
    self.tableView.separatorColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LegislatorViewController* legislatorViewControllerState = [storyboard instantiateViewControllerWithIdentifier:@"LegislatorViewController"];
    legislatorViewControllerState.title = @"State";
    legislatorViewControllerState.navigationItem.title = @"State";
    legislatorViewControllerState.categoryInfo = [CategoryModel infoFromDict:@{@"name":@""}];
    UINavigationController *legNavigationControllerState = [[UINavigationController alloc] initWithRootViewController:legislatorViewControllerState];
    
    LegislatorViewController* legislatorViewControllerHouse = [storyboard instantiateViewControllerWithIdentifier:@"LegislatorViewController"];
    legislatorViewControllerHouse.title = @"House";
    legislatorViewControllerHouse.navigationItem.title = @"House";
    legislatorViewControllerHouse.categoryInfo = [CategoryModel infoFromDict:@{@"name":HOUSE_TAB_NAME}];
    UINavigationController *legNavigationControllerHouse = [[UINavigationController alloc] initWithRootViewController:legislatorViewControllerHouse];
    
    LegislatorViewController* legislatorViewControllerSenate = [storyboard instantiateViewControllerWithIdentifier:@"LegislatorViewController"];
    legislatorViewControllerSenate.title = @"Senate";
    legislatorViewControllerHouse.navigationItem.title = @"Senate";
    legislatorViewControllerSenate.categoryInfo = [CategoryModel infoFromDict:@{@"name":SENATE_TAB_NAME}];
    UINavigationController *legNavigationControllerSenate = [[UINavigationController alloc] initWithRootViewController:legislatorViewControllerSenate];
    
    self.legislatorViewController = [[UITabBarController alloc]init];
    self.legislatorViewController.viewControllers = [NSArray arrayWithObjects:legNavigationControllerState, legNavigationControllerHouse, legNavigationControllerSenate, nil];
    
     [_legislatorViewController.tabBar setBackgroundColor:[UIColor whiteColor]];
    
    
    
    BillViewController* billViewControllerActive = [storyboard instantiateViewControllerWithIdentifier:@"BillViewController"];
    billViewControllerActive.title = @"Active";
    billViewControllerActive.navigationItem.title = @"Acitve";
    billViewControllerActive.categoryInfo = [CategoryModel infoFromDict:@{@"name":ACTIVE_TAB_NAME}];
    UINavigationController *bilNavigationControllerActive = [[UINavigationController alloc] initWithRootViewController:billViewControllerActive];
    
    BillViewController* billViewControllerNew = [storyboard instantiateViewControllerWithIdentifier:@"BillViewController"];
    billViewControllerNew.title = @"New";
    billViewControllerNew.navigationItem.title = @"New";
    billViewControllerNew.categoryInfo = [CategoryModel infoFromDict:@{@"name":NEW_TAB_NAME}];
    UINavigationController *bilNavigationControllerNew = [[UINavigationController alloc] initWithRootViewController:billViewControllerNew];

    
    self.billViewController = [[UITabBarController alloc]init];
    self.billViewController.viewControllers = [NSArray arrayWithObjects:bilNavigationControllerActive, bilNavigationControllerNew, nil];
    
     [_billViewController.tabBar setBackgroundColor:[UIColor whiteColor]];
    
    
    
    CommitteeViewController* committeeViewControllerHouse = [storyboard instantiateViewControllerWithIdentifier:@"CommitteeViewController"];
    committeeViewControllerHouse.title = @"House";
    committeeViewControllerHouse.navigationItem.title = @"House";
    committeeViewControllerHouse.categoryInfo = [CategoryModel infoFromDict:@{@"name":HOUSE_TAB_NAME}];
    UINavigationController *comNavigationControllerHouse = [[UINavigationController alloc] initWithRootViewController:committeeViewControllerHouse];
    
    CommitteeViewController* committeeViewControllerSenate = [storyboard instantiateViewControllerWithIdentifier:@"CommitteeViewController"];
    committeeViewControllerSenate.title = @"Committee";
    committeeViewControllerSenate.navigationItem.title = @"Committee";
    committeeViewControllerSenate.categoryInfo = [CategoryModel infoFromDict:@{@"name":SENATE_TAB_NAME}];
    UINavigationController *comNavigationControllerSenate = [[UINavigationController alloc] initWithRootViewController:committeeViewControllerSenate];
    
    CommitteeViewController* committeeViewControllerJoint = [storyboard instantiateViewControllerWithIdentifier:@"CommitteeViewController"];
    committeeViewControllerJoint.title = @"Joint";
    committeeViewControllerJoint.navigationItem.title = @"Joint";
    committeeViewControllerJoint.categoryInfo = [CategoryModel infoFromDict:@{@"name":JOINT_TAB_NAME}];
    UINavigationController *comNavigationControllerJoint = [[UINavigationController alloc] initWithRootViewController:committeeViewControllerJoint];

    
    
    self.committeeViewController = [[UITabBarController alloc]init];
    self.committeeViewController.viewControllers = [NSArray arrayWithObjects:comNavigationControllerHouse, comNavigationControllerSenate,comNavigationControllerJoint , nil];
     [_committeeViewController.tabBar setBackgroundColor:[UIColor whiteColor]];

    
    LegFavTableViewController* favLegislatorViewController = [storyboard instantiateViewControllerWithIdentifier:@"LegFavTableViewController"];
    favLegislatorViewController.title = @"Legislator";
    favLegislatorViewController.navigationItem.title = @"Legislator";
    UINavigationController *favLegNavigationController = [[UINavigationController alloc] initWithRootViewController:favLegislatorViewController];
    
    BilFavTableViewController* favBillViewController = [storyboard instantiateViewControllerWithIdentifier:@"BilFavTableViewController"];
    favBillViewController.title = @"Bill";
    favBillViewController.navigationItem.title = @"Bill";

    UINavigationController *favBilNavigationController = [[UINavigationController alloc] initWithRootViewController:favBillViewController];
    
    ComFavTableViewController* favCommitteeViewController = [storyboard instantiateViewControllerWithIdentifier:@"ComFavTableViewController"];
    favCommitteeViewController.title = @"Committee";
    favCommitteeViewController.navigationItem.title = @"Committee";
    UINavigationController *favComNavigationController = [[UINavigationController alloc] initWithRootViewController:favCommitteeViewController];
    

    
    self.favoriteViewController = [[UITabBarController alloc]init];
    self.favoriteViewController.viewControllers = [NSArray arrayWithObjects:favLegNavigationController, favBilNavigationController,favComNavigationController , nil];
     [_favoriteViewController.tabBar setBackgroundColor:[UIColor whiteColor]];

    self.aboutViewController = [[UINavigationController alloc] initWithRootViewController:[storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"]];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.view layoutIfNeeded];
}

-(void)changeViewController:(LeftMenu) menu {
    switch (menu) {
        case LeftMenuLeg:
            self.legislatorViewController.selectedIndex = 0;
            [self.slideMenuController changeMainViewController:self.legislatorViewController close:YES];
            break;
        case LeftMenuBil:
            self.billViewController.selectedIndex = 0;
            [self.slideMenuController changeMainViewController:self.billViewController close:YES];
            break;
        case LeftMenuCom:
            self.committeeViewController.selectedIndex = 0;
            [self.slideMenuController changeMainViewController:self.committeeViewController close:YES];
            break;
        case LeftMenuFav:
            self.favoriteViewController.selectedIndex = 0;
            [self.slideMenuController changeMainViewController:self.favoriteViewController close:YES];
            break;
        case LeftMenuAbo:
            [self.slideMenuController changeMainViewController:self.aboutViewController close:YES];
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  48;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _menus.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftMenuCell"];
    
    UILabel * sectionName = [[UILabel alloc]initWithFrame:cell.contentView.frame];
    [cell.contentView addSubview:sectionName];

    cell.backgroundColor = Leftbar_Background_Color;
    sectionName.font = [UIFont italicSystemFontOfSize:18];
    sectionName.textColor = Leftbar_Text_Color;
    if([_menus[indexPath.row] isKindOfClass:[NSString class]]) {
        sectionName.text = (NSString *)_menus[indexPath.row];
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self changeViewController:indexPath.row];
}

@end
