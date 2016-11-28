//
//  BillTableViewCell.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BillTableViewCell.h"

@implementation BillTableViewCell

- (void)initCell
{
    [super initCell];
}



- (void)setCellData:(BillModel *)info
{
    [super setCellData:info];

    idLabel.text = info.ID;
    nameLabel.text = info.officialTitle;
    timeLabel.text = info.introducedOn;
}



@end
