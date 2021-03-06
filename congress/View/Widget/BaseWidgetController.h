//
//  BaseWidgetController.h
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BaseController.h"

@interface BaseWidgetController : BaseController

@property(strong, nonatomic) NSMutableArray    *listData;
@property(nonatomic, strong) CategoryModel    *categoryInfo;
@property(nonatomic) BOOL    needRefresh;
- (void)updateUI;
- (void)reloadData;
- (BOOL)isReloadLocalData;

@end
