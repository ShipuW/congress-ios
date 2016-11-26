//
//  GetLegislators.m
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "GetLegislators.h"

@implementation GetLegislators

- (void)parseSuccess:(NSDictionary *)dict
{
    NSArray *infos = [LegislatorModel arrayFromDict:dict];
    [_delegate opSuccess:infos];
}


@end
