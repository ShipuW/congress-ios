//
//  BaseController.h
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController <BaseOperationDelegate> {
    BaseOperation     *_operation;
    NSUserDefaults    *defaults;
}

@end
