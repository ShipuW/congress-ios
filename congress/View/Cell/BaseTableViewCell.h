//
//  BaseTableViewCell.h
//  congress
//
//  Created by 王士溥 on 11/24/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

@property(nonatomic, strong) BaseModel   *cellInfo;

- (void)initCell;
- (void)setCellData:(BaseModel *)info;

@end
