//
//  ButtonTableViewCell.m
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "ButtonTableViewCell.h"

@implementation ButtonTableViewCell


- (void)setDisplay{
    [super setDisplay];
    for (NSString *key in self.displayDictionary) {
        self.titleLabel.text = key;
        if([[self.displayDictionary objectForKey:key] isKindOfClass:[NSURL class]]){
            for (NSString *key in self.displayDictionary){
                NSURL *a = [self.displayDictionary objectForKey:key];
                if([a.absoluteString isEqualToString:DUMMY_URL]){
                    [_urlButton setTitle:@"N.A"  forState:UIControlStateNormal];
                    [_urlButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
                else{
                    [_urlButton setTitle:[NSString stringWithFormat:@"%@ %@",key, LINK_BUTTON_SUFFIX]  forState:UIControlStateNormal];
                }
            }

            [_urlButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)buttonPressed{
    for (NSString *key in self.displayDictionary){
        NSURL *a = [self.displayDictionary objectForKey:key];
        if(![a.absoluteString isEqualToString:DUMMY_URL])
            [[UIApplication sharedApplication]openURL:[self.displayDictionary objectForKey:key] options:@{} completionHandler:nil];
    }
}

@end
