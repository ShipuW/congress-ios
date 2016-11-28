//
//  BillTableViewCell.h
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillModel.h"

@interface BillTableViewCell : BaseTableViewCell{

    IBOutlet UILabel *idLabel;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *timeLabel;
    
}

@end
