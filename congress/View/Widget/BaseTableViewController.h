//
//  BaseTableViewController.h
//  congress
//
//  Created by 王士溥 on 11/24/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : BaseWidgetController{
    IBOutlet UITableView    *_tableView;
    CGFloat                 _cellHeight;
}

@property(nonatomic, strong) NSString   *cellIdentifier;
@property(nonatomic, assign) id         owner;



@end
