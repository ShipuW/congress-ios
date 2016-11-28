//
//  CommitteeTableViewCell.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "CommitteeTableViewCell.h"

@implementation CommitteeTableViewCell

- (void)initCell
{
    [super initCell];
}



- (void)setCellData:(CommitteeModel *)info
{
    [super setCellData:info];
    nameLabel.text = info.name;
    idLabel.text = info.ID;

}

@end
