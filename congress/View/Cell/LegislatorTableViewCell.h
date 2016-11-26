//
//  LegislatorTableViewCell.h
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LegislatorModel.h"

@interface LegislatorTableViewCell : BaseTableViewCell{
    IBOutlet UIImageView    *_imageView;
    IBOutlet UILabel        *_nameLabel;
    IBOutlet UILabel        *_stateLabel;
}

@end
