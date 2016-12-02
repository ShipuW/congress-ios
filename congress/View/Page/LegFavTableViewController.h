//
//  LegFavTableViewController.h
//  congress
//
//  Created by 王士溥 on 12/1/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LegislatorModel.h"

@interface LegFavTableViewController : UITableViewController

@property (nonatomic) NSMutableArray* listData;
@property (nonatomic) LegislatorModel *info;

@end
