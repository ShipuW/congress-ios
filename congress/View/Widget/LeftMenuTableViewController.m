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

@interface LeftMenuTableViewController ()

@end

@implementation LeftMenuTableViewController

-(void)viewDidLoad {
    _menus = @[@"Legislators", @"Bills", @"Committees", @"Favorite", @"About"];
    self.tableView.separatorColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LegislatorViewController* legislatorViewControllerState = [storyboard instantiateViewControllerWithIdentifier:@"LegislatorViewController"];
    legislatorViewControllerState.title = STATE_TAB_NAME;
    legislatorViewControllerState.navigationItem.title = STATE_TAB_NAME;
    legislatorViewControllerState.categoryInfo = [CategoryModel infoFromDict:@{@"name":@""}];
    UINavigationController *legNavigationControllerState = [[UINavigationController alloc] initWithRootViewController:legislatorViewControllerState];
    
    LegislatorViewController* legislatorViewControllerHouse = [storyboard instantiateViewControllerWithIdentifier:@"LegislatorViewController"];
    legislatorViewControllerHouse.title = HOUSE_TAB_NAME;
    legislatorViewControllerHouse.navigationItem.title = HOUSE_TAB_NAME;
    legislatorViewControllerHouse.categoryInfo = [CategoryModel infoFromDict:@{@"name":HOUSE_TAB_NAME}];
    UINavigationController *legNavigationControllerHouse = [[UINavigationController alloc] initWithRootViewController:legislatorViewControllerHouse];
    
    LegislatorViewController* legislatorViewControllerSenate = [storyboard instantiateViewControllerWithIdentifier:@"LegislatorViewController"];
    legislatorViewControllerSenate.title = SENATE_TAB_NAME;
    legislatorViewControllerHouse.navigationItem.title = HOUSE_TAB_NAME;
    legislatorViewControllerSenate.categoryInfo = [CategoryModel infoFromDict:@{@"name":SENATE_TAB_NAME}];
    UINavigationController *legNavigationControllerSenate = [[UINavigationController alloc] initWithRootViewController:legislatorViewControllerSenate];
    
    self.legislatorViewController = [[UITabBarController alloc]init];
    self.legislatorViewController.viewControllers = [NSArray arrayWithObjects:legNavigationControllerState, legNavigationControllerHouse, legNavigationControllerSenate, nil];
    

    
    
    
    BillViewController* billViewControllerActive = [storyboard instantiateViewControllerWithIdentifier:@"BillViewController"];
    billViewControllerActive.title = ACTIVE_TAB_NAME;
    billViewControllerActive.navigationItem.title = ACTIVE_TAB_NAME;
    billViewControllerActive.categoryInfo = [CategoryModel infoFromDict:@{@"name":ACTIVE_TAB_NAME}];
    UINavigationController *bilNavigationControllerActive = [[UINavigationController alloc] initWithRootViewController:billViewControllerActive];
    
    BillViewController* billViewControllerNew = [storyboard instantiateViewControllerWithIdentifier:@"BillViewController"];
    billViewControllerNew.title = NEW_TAB_NAME;
    billViewControllerNew.navigationItem.title = NEW_TAB_NAME;
    billViewControllerNew.categoryInfo = [CategoryModel infoFromDict:@{@"name":NEW_TAB_NAME}];
    UINavigationController *bilNavigationControllerNew = [[UINavigationController alloc] initWithRootViewController:billViewControllerNew];

    
    self.billViewController = [[UITabBarController alloc]init];
    self.billViewController.viewControllers = [NSArray arrayWithObjects:bilNavigationControllerActive, bilNavigationControllerNew, nil];
    
    
    
    
    
    CommitteeViewController* committeeViewControllerHouse = [storyboard instantiateViewControllerWithIdentifier:@"CommitteeViewController"];
    committeeViewControllerHouse.title = HOUSE_TAB_NAME;
    committeeViewControllerHouse.navigationItem.title = HOUSE_TAB_NAME;
    committeeViewControllerHouse.categoryInfo = [CategoryModel infoFromDict:@{@"name":HOUSE_TAB_NAME}];
    UINavigationController *comNavigationControllerHouse = [[UINavigationController alloc] initWithRootViewController:committeeViewControllerHouse];
    
    CommitteeViewController* committeeViewControllerSenate = [storyboard instantiateViewControllerWithIdentifier:@"CommitteeViewController"];
    committeeViewControllerSenate.title = SENATE_TAB_NAME;
    committeeViewControllerSenate.navigationItem.title = SENATE_TAB_NAME;
    committeeViewControllerSenate.categoryInfo = [CategoryModel infoFromDict:@{@"name":SENATE_TAB_NAME}];
    UINavigationController *comNavigationControllerSenate = [[UINavigationController alloc] initWithRootViewController:committeeViewControllerSenate];
    
    CommitteeViewController* committeeViewControllerJoint = [storyboard instantiateViewControllerWithIdentifier:@"CommitteeViewController"];
    committeeViewControllerJoint.title = JOINT_TAB_NAME;
    committeeViewControllerJoint.navigationItem.title = JOINT_TAB_NAME;
    committeeViewControllerJoint.categoryInfo = [CategoryModel infoFromDict:@{@"name":JOINT_TAB_NAME}];
    UINavigationController *comNavigationControllerJoint = [[UINavigationController alloc] initWithRootViewController:committeeViewControllerJoint];

    
    
    self.committeeViewController = [[UITabBarController alloc]init];
    self.committeeViewController.viewControllers = [NSArray arrayWithObjects:comNavigationControllerHouse, comNavigationControllerSenate,comNavigationControllerJoint , nil];
    

    
    LegislatorViewController* favLegislatorViewController = [storyboard instantiateViewControllerWithIdentifier:@"LegislatorViewController"];
    favLegislatorViewController.title = LEG_TAB_NAME;
    favLegislatorViewController.navigationItem.title = LEG_TAB_NAME;
    favLegislatorViewController.categoryInfo = [CategoryModel infoFromDict:@{@"name":FAVORITE_CATEGORY}];
    UINavigationController *favLegNavigationController = [[UINavigationController alloc] initWithRootViewController:favLegislatorViewController];
    
    BillViewController* favBillViewController = [storyboard instantiateViewControllerWithIdentifier:@"BillViewController"];
    favBillViewController.title = BIL_TAB_NAME;
    favBillViewController.navigationItem.title = BIL_TAB_NAME;
    favBillViewController.categoryInfo = [CategoryModel infoFromDict:@{@"name":FAVORITE_CATEGORY}];
    UINavigationController *favBilNavigationController = [[UINavigationController alloc] initWithRootViewController:favBillViewController];
    
    CommitteeViewController* favCommitteeViewController = [storyboard instantiateViewControllerWithIdentifier:@"CommitteeViewController"];
    favCommitteeViewController.title = COM_TAB_NAME;
    favCommitteeViewController.navigationItem.title = COM_TAB_NAME;
    favCommitteeViewController.categoryInfo = [CategoryModel infoFromDict:@{@"name":FAVORITE_CATEGORY}];
    UINavigationController *favComNavigationController = [[UINavigationController alloc] initWithRootViewController:favCommitteeViewController];
    

    
    self.favoriteViewController = [[UITabBarController alloc]init];
    self.favoriteViewController.viewControllers = [NSArray arrayWithObjects:favLegNavigationController, favBilNavigationController,favComNavigationController , nil];
 

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
            [self.slideMenuController changeMainViewController:self.legislatorViewController close:YES];
            break;
        case LeftMenuBil:
            [self.slideMenuController changeMainViewController:self.billViewController close:YES];
            break;
        case LeftMenuCom:
            [self.slideMenuController changeMainViewController:self.committeeViewController close:YES];
            break;
        case LeftMenuFav:
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
