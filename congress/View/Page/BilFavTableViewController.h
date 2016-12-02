//
//  BilFavTableViewController.h
//  congress
//
//  Created by 王士溥 on 12/1/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillModel.h"

@interface BilFavTableViewController : UITableViewController

@property (nonatomic) NSMutableArray* listData;
@property (nonatomic) BillModel *info;

@end
