//
//  BaseDetailTableViewCell.h
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseDetailTableViewCell : UITableViewCell

@property(strong, nonatomic) NSDictionary    *displayDictionary;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setDisplay;

@end
