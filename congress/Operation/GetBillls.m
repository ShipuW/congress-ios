//
//  GetBillls.m
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "GetBillls.h"

@implementation GetBillls

- (void)parseSuccess:(NSDictionary *)dict
{
    NSArray *infos = [BillModel arrayFromDict:dict];
    [_delegate opSuccess:infos];
}

@end
