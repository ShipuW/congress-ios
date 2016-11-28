//
//  LabelTableViewCell.m
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "LabelTableViewCell.h"

@implementation LabelTableViewCell


- (void)setDisplay{
    [super setDisplay];
    for (NSString *key in self.displayDictionary) {
        self.titleLabel.text = key;
        if([[self.displayDictionary objectForKey:key] isKindOfClass:[NSString class]]){
            self.valueLabel.text = [self.displayDictionary objectForKey:key];
        }
    }
}



@end
