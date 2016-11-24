//
//  LegislatorModel.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "LegislatorModel.h"

@implementation LegislatorModel

+ (instancetype)infoFromDict:(NSDictionary *)dict
{
    LegislatorModel *info = [[LegislatorModel alloc] init];
    
    info.ID             = [dict objectForKey:@"bioguide_id"];
    info.chamber        = [dict objectForKey:@"chamber"];
    info.imageUrl       = [NSString stringWithFormat:@"%@,%@,%@",ImageUrl, [dict objectForKey:@"bioguide_id"], ImageSuffix];
    info.firstName      = [dict objectForKey:@"first_name"];
    info.lastName       = [dict objectForKey:@"last_name"];
    info.state          = [dict objectForKey:@"state_name"];
    info.gender         = [dict objectForKey:@"gender"];
    info.birthDate      = [dict objectForKey:@"birthday"];
    info.fax            = [dict objectForKey:@"fax"];
    info.twitterLink    = [NSString stringWithFormat:@"%@,%@",TwitterUrl, [dict objectForKey:@"twitter_id"]];
    info.websiteLink    = [dict objectForKey:@"website"];
    info.office         = [dict objectForKey:@"office"];
    info.endTerm        = [dict objectForKey:@"term_end"];

    
    return info;
}


@end
