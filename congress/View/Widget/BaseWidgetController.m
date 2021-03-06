//
//  BaseWidgetController.m
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BaseWidgetController.h"

@interface BaseWidgetController ()

@end

@implementation BaseWidgetController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.needRefresh = YES;
    [self reloadData];
}

- (void)updateUI
{
}

- (void)reloadData
{
    if ([_categoryInfo.name isEqualToString:FAVORITE_CATEGORY]){
        [self getLocalData];
    }else{
        [self requestServer];

    }
}

- (BOOL)isReloadLocalData
{
    BOOL isReload = self.listData.count > 0;
    
    if (isReload) {
        [self updateUI];
    }
    
    return isReload;
}

- (void)requestServer
{
    [self requestServerOp];
}

- (void)requestServerOp
{
}

- (void)getLocalData{
}

@end
