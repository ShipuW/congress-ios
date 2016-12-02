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
    info.name       = [dict objectForKey:@"name"]?[dict objectForKey:@"name"]:@"N.A";
    info.parentID   = [dict objectForKey:@"parent_committee_id"]?[dict objectForKey:@"parent_committee_id"]:@"N.A";
    info.office     = [dict objectForKey:@"office"]?[dict objectForKey:@"office"]:@"N.A";
    info.contact    = [dict objectForKey:@"phone"]?[dict objectForKey:@"phone"]:@"N.A";
    
    return info;
}

- (int)getTableDisplayNumber{
    int res = 0;
    if (![self.ID isKindOfClass:[NSNull class]])     res++;
    if (![self.parentID isKindOfClass:[NSNull class]])      res++;
    if (![self.chamber isKindOfClass:[NSNull class]])         res++;
    if (![self.office isKindOfClass:[NSNull class]]&&self.office != nil)        res++;
    if (![self.contact isKindOfClass:[NSNull class]])     res++;
    return res;
}

- (NSDictionary *)getDictionaryByIndex:(int)index{
    int i = 0;
    if(![self.ID isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"ID":self.ID};
        i++;
    }
    if(![self.parentID isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Parent ID":self.parentID};
        i++;
    }
    if(![self.chamber isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Chamber":self.chamber};
        i++;
    }
    if(![self.office isKindOfClass:[NSNull class]]&&self.office != nil){
        if (index == i)return @{@"Office":self.office};
        i++;
    }
    if(![self.contact isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Contact":self.contact};
        i++;
    }


    return nil;
}

- (NSComparisonResult)compare:(CommitteeModel *)otherObject {
    return [self.name compare:otherObject.name];
}


+ (NSArray*)sortByName:(NSArray*)array{
    return  [array sortedArrayUsingSelector:@selector(compare:)];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.ID = [aDecoder decodeObjectForKey:@"committee_id"];
        self.chamber = [aDecoder decodeObjectForKey:@"chamber"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.parentID = [aDecoder decodeObjectForKey:@"parent_committee_id"];
        self.office = [aDecoder decodeObjectForKey:@"office"];
        self.contact = [aDecoder decodeObjectForKey:@"phone"];

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.ID forKey:@"committee_id"];
    [aCoder encodeObject:self.chamber forKey:@"chamber"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.parentID forKey:@"parent_committee_id"];
    [aCoder encodeObject:self.office forKey:@"office"];
    [aCoder encodeObject:self.contact forKey:@"phone"];
}

@end
