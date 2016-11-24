//
//  Committee.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "CommitteeModel.h"

@implementation CommitteeModel

+ (instancetype)infoFromDict:(NSDictionary *)dict
{
    CommitteeModel *info = [[CommitteeModel alloc] init];
    
    info.ID         = [dict objectForKey:@"committee_id"];
    info.chamber    = [dict objectForKey:@"chamber"];
    info.name       = [dict objectForKey:@"name"];
    info.parentID   = [dict objectForKey:@"parent_committee_id"];
    info.office     = [dict objectForKey:@"office"];
    info.contact    = [dict objectForKey:@"phone"];
    
    return info;
}


@end
