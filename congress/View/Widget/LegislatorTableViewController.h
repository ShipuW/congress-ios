//
//  LegislatorTableViewController.h
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetLegislators.h"
#import "LegislatorTableViewCell.h"

@interface LegislatorTableViewController : BaseTableViewController

@property(nonatomic, strong) CategoryModel    *categoryInfo;

@end
