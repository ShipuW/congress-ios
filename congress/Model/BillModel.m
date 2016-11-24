//
//  BillModel.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BillModel.h"

@implementation BillModel

+ (instancetype)infoFromDict:(NSDictionary *)dict
{
    BillModel *info = [[BillModel alloc] init];
    
    info.ID             = [dict objectForKey:@"bill_id"];
    info.chamber        = [dict objectForKey:@"chamber"];
    info.officialTitle  = [dict objectForKey:@"official_title"];
    info.type           = [dict objectForKey:@"bill_type"];
    info.sponsor        = [NSString stringWithFormat:@"%@,%@,%@",
                           [[dict objectForKey:@"sponsor"] objectForKey:@"title"],
                           [[dict objectForKey:@"sponsor"] objectForKey:@"first_name"],
                           [[dict objectForKey:@"sponsor"] objectForKey:@"last_name"]
                           ];
    info.lastActionDate = [dict objectForKey:@"last_action_at"];
    info.pdfUrl         = [[dict objectForKey:@"urls"] objectForKey:@"pdf"];
    info.lastVoteDate   = [dict objectForKey:@"last_vote_at"];
    info.status         = [[dict objectForKey:@"history"] objectForKey:@"active"]?@"Active":@"New";
    
    return info;
}


@end
