//
//  CommitteeDetailViewController.h
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommitteeModel.h"

@interface CommitteeDetailViewController : BaseDetailViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) CommitteeModel    *committeeInfo;

@end
