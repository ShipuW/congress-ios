//
//  BillDetailViewController.h
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillModel.h"

@interface BillDetailViewController : BaseDetailViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) BillModel    *billInfo;

@end
