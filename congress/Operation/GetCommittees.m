//
//  GetCommittees.m
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "GetCommittees.h"

@implementation GetCommittees

- (void)parseSuccess:(NSDictionary *)dict
{
    NSArray *infos = [CommitteeModel arrayFromDict:dict];
    [_delegate opSuccess:infos];
}

@end
