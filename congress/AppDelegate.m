//
//  AppDelegate.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftMenuTableViewController.h"
#import "LegislatorViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName:[UIFont systemFontOfSize:20.0f]
                                                        } forState:UIControlStateNormal];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -13)];
    // Override point for customization after application launch.
    [[UINavigationBar appearance] setBackgroundColor:[UIColor whiteColor]];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    

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
    
    UITabBarController *legislatorTabBarController = [[UITabBarController alloc]init];
    legislatorTabBarController.viewControllers = [NSArray arrayWithObjects:legNavigationControllerState, legNavigationControllerHouse, legNavigationControllerSenate, nil];
    [legislatorTabBarController.tabBar setBackgroundColor:[UIColor whiteColor]];
    
    LeftMenuTableViewController* leftMenuTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"LeftMenuTableViewController"];
    SlideMenuController *slideMenuController = [[SlideMenuController alloc] initWithMainViewController:legislatorTabBarController leftMenuViewController:leftMenuTableViewController];
    
    self.window.rootViewController = slideMenuController;
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
