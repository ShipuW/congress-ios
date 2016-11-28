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
    info.sponsor        = [NSString stringWithFormat:@"%@%@%@",
                           [[dict objectForKey:@"sponsor"] objectForKey:@"title"],
                           [[dict objectForKey:@"sponsor"] objectForKey:@"first_name"],
                           [[dict objectForKey:@"sponsor"] objectForKey:@"last_name"]
                           ];
    info.lastActionDate = [dict objectForKey:@"last_action_at"];
    info.pdfUrl         = ![[[dict objectForKey:@"urls"] objectForKey:@"pdf"] isKindOfClass:[NSNull class]]?[NSURL URLWithString:[NSString stringWithFormat:@"%@", [[dict objectForKey:@"urls"] objectForKey:@"pdf"]]]:nil;
    info.lastVoteDate   = [dict objectForKey:@"last_vote_at"];
    info.status         = [[dict objectForKey:@"history"] objectForKey:@"active"]?@"Active":@"New";
    info.introducedOn   = [dict objectForKey:@"introduced_on"];
    
    return info;
}

- (int)getTableDisplayNumber{
    int res = 0;
    if (![self.ID isKindOfClass:[NSNull class]])     res++;
    if (![self.type isKindOfClass:[NSNull class]])      res++;
    if (![self.sponsor isKindOfClass:[NSNull class]])         res++;
    if (![self.lastActionDate isKindOfClass:[NSNull class]])        res++;
    if (![self.pdfUrl isKindOfClass:[NSNull class]])     res++;
    if (![self.chamber isKindOfClass:[NSNull class]])       res++;
    if (![self.lastVoteDate isKindOfClass:[NSNull class]])           res++;
    if (![self.status isKindOfClass:[NSNull class]])   res++;
    return res;
}

- (NSDictionary *)getDictionaryByIndex:(int)index{
    int i = 0;
    if(![self.ID isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Bill ID":self.ID};
        i++;
    }
    if(![self.type isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Bill Type":self.type};
        i++;
    }
    if(![self.sponsor isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Sponsor":self.sponsor};
        i++;
    }
    if(![self.lastActionDate isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Last Action":self.lastActionDate};
        i++;
    }
    if(![self.pdfUrl isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"PDF":self.pdfUrl};
        i++;
    }
    if(![self.chamber isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Chamber":self.chamber};
        i++;
    }
    if(![self.lastVoteDate isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Last Vote":self.lastVoteDate};
        i++;
    }
    if(![self.status isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Status":self.status};
        i++;
    }

    return nil;
}

- (NSComparisonResult)compare:(BillModel *)otherObject {
    NSComparisonResult returnResult = NSOrderedSame;
    returnResult = [self.introducedOn compare:otherObject.introducedOn];
    if(NSOrderedAscending == returnResult)
        returnResult = NSOrderedDescending;
    else if(NSOrderedDescending == returnResult)
        returnResult = NSOrderedAscending;
    return returnResult;
}


+ (NSArray*)sortByTime:(NSArray*)array{
    return  [array sortedArrayUsingSelector:@selector(compare:)];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.ID = [aDecoder decodeObjectForKey:@"bill_id"];
        self.chamber = [aDecoder decodeObjectForKey:@"chamber"];
        self.officialTitle = [aDecoder decodeObjectForKey:@"official_title"];
        self.type = [aDecoder decodeObjectForKey:@"bill_type"];
        self.sponsor = [aDecoder decodeObjectForKey:@"sponsor"];
        self.lastActionDate = [aDecoder decodeObjectForKey:@"last_action_at"];
        self.pdfUrl = [aDecoder decodeObjectForKey:@"pdf"];
        self.lastVoteDate = [aDecoder decodeObjectForKey:@"last_vote_at"];
        self.status = [aDecoder decodeObjectForKey:@"status"];
        self.introducedOn = [aDecoder decodeObjectForKey:@"introduced_on"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.ID forKey:@"bill_id"];
    [aCoder encodeObject:self.chamber forKey:@"chamber"];
    [aCoder encodeObject:self.officialTitle forKey:@"official_title"];
    [aCoder encodeObject:self.type forKey:@"bill_type"];
    [aCoder encodeObject:self.sponsor forKey:@"sponsor"];
    [aCoder encodeObject:self.lastActionDate forKey:@"last_action_at"];
    [aCoder encodeObject:self.pdfUrl forKey:@"pdf"];
    [aCoder encodeObject:self.lastVoteDate forKey:@"last_vote_at"];
    [aCoder encodeObject:self.status forKey:@"status"];
    [aCoder encodeObject:self.introducedOn forKey:@"introduced_on"];
}

@end
