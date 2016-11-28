//
//  LegislatorDetailViewController.h
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LegislatorModel.h"

@interface LegislatorDetailViewController : BaseDetailViewController


@property(nonatomic, strong) LegislatorModel    *legislatorInfo;

@property (weak, nonatomic) IBOutlet UITableView *infoTable;
@property (weak, nonatomic) IBOutlet UIImageView *infoImage;

@end
