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
    info.imageUrl       = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",ImageUrl, [dict objectForKey:@"bioguide_id"], ImageSuffix]];
    info.firstName      = [dict objectForKey:@"first_name"];
    info.lastName       = [dict objectForKey:@"last_name"];
    info.state          = [dict objectForKey:@"state_name"];
    info.gender         = [dict objectForKey:@"gender"];
    info.birthDate      = [dict objectForKey:@"birthday"];
    info.fax            = [dict objectForKey:@"fax"];
    info.twitterLink    = ![[dict objectForKey:@"twitter_id"] isKindOfClass:[NSNull class]]?[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",TwitterUrl, [dict objectForKey:@"twitter_id"]]]:nil;
    info.facebookLink   = ![[dict objectForKey:@"facebook_id"] isKindOfClass:[NSNull class]]?[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",FacebookUrl, [dict objectForKey:@"facebook_id"]]]:nil;
    
    info.websiteLink    = ![[dict objectForKey:@"website"] isKindOfClass:[NSNull class]]?[NSURL URLWithString:[NSString stringWithFormat:@"%@", [dict objectForKey:@"website"]]]:nil;
    info.office         = [dict objectForKey:@"office"];
    info.endTerm        = [dict objectForKey:@"term_end"];

    
    return info;
}

- (int)getTableDisplayNumber{
    int res = 0;
    if (![self.firstName isKindOfClass:[NSNull class]])     res++;
    if (![self.lastName isKindOfClass:[NSNull class]])      res++;
    if (![self.state isKindOfClass:[NSNull class]])         res++;
    if (![self.gender isKindOfClass:[NSNull class]])        res++;
    if (![self.birthDate isKindOfClass:[NSNull class]])     res++;
    if (![self.chamber isKindOfClass:[NSNull class]])       res++;
    if (![self.fax isKindOfClass:[NSNull class]])           res++;
    if (![self.twitterLink isKindOfClass:[NSNull class]]&&self.twitterLink != nil)   res++;
    if (![self.facebookLink isKindOfClass:[NSNull class]]&&self.facebookLink != nil)  res++;
    if (![self.websiteLink isKindOfClass:[NSNull class]]&&self.websiteLink != nil)   res++;
    if (![self.office isKindOfClass:[NSNull class]])        res++;
    if (![self.endTerm isKindOfClass:[NSNull class]])       res++;
    return res;
}

- (NSDictionary *)getDictionaryByIndex:(int)index{
    int i = 0;
    if(![self.firstName isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"First Name":self.firstName};
        i++;
    }
    if(![self.lastName isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Last Name":self.lastName};
        i++;
    }
    if(![self.state isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"State":self.state};
        i++;
    }
    if(![self.birthDate isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Birth Date":self.birthDate};
        i++;
    }
    if(![self.gender isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Gender":self.gender};
        i++;
    }
    if(![self.chamber isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Chamber":self.chamber};
        i++;
    }
    if(![self.fax isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Fax No.":self.fax};
        i++;
    }
    if(![self.twitterLink isKindOfClass:[NSNull class]]&&self.twitterLink != nil){
        if (index == i)return @{@"Twitter":self.twitterLink};
        i++;
    }
    if(![self.facebookLink isKindOfClass:[NSNull class]]&&self.facebookLink != nil){
        if (index == i)return @{@"Facebook":self.facebookLink};
        i++;
    }
    if(![self.websiteLink isKindOfClass:[NSNull class]]&&self.websiteLink != nil){
        if (index == i)return @{@"Website":self.websiteLink};
        i++;
    }
    if(![self.office isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Office No.":self.office};
        i++;
    }
    if(![self.endTerm isKindOfClass:[NSNull class]]){
        if (index == i)return @{@"Term ends on":self.endTerm};
        i++;
    }
    return nil;
}

- (NSComparisonResult)compare:(LegislatorModel *)otherObject {
    return [self.firstName compare:otherObject.firstName];
}


+ (NSArray*)sortByFirstName:(NSArray*)array{
    return  [array sortedArrayUsingSelector:@selector(compare:)];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.ID = [aDecoder decodeObjectForKey:@"bioguide_id"];
        self.chamber = [aDecoder decodeObjectForKey:@"chamber"];
        self.imageUrl = [aDecoder decodeObjectForKey:@"image"];
        self.firstName = [aDecoder decodeObjectForKey:@"first_name"];
        self.lastName = [aDecoder decodeObjectForKey:@"last_name"];
        self.state = [aDecoder decodeObjectForKey:@"state_name"];
        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        self.birthDate = [aDecoder decodeObjectForKey:@"birthday"];
        self.fax = [aDecoder decodeObjectForKey:@"fax"];
        self.twitterLink = [aDecoder decodeObjectForKey:@"twitter"];
        self.facebookLink = [aDecoder decodeObjectForKey:@"facebook"];
        self.websiteLink = [aDecoder decodeObjectForKey:@"website"];
        self.office = [aDecoder decodeObjectForKey:@"office"];
        self.endTerm = [aDecoder decodeObjectForKey:@"term_end"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.ID forKey:@"bioguide_id"];
    [aCoder encodeObject:self.chamber forKey:@"chamber"];
    [aCoder encodeObject:self.imageUrl forKey:@"image"];
    [aCoder encodeObject:self.firstName forKey:@"first_name"];
    [aCoder encodeObject:self.lastName forKey:@"last_name"];
    [aCoder encodeObject:self.state forKey:@"state_name"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
    [aCoder encodeObject:self.birthDate forKey:@"birthday"];
    [aCoder encodeObject:self.fax forKey:@"fax"];
    [aCoder encodeObject:self.twitterLink forKey:@"twitter"];
    [aCoder encodeObject:self.facebookLink forKey:@"facebook"];
    [aCoder encodeObject:self.websiteLink forKey:@"website"];
    [aCoder encodeObject:self.office forKey:@"office"];
    [aCoder encodeObject:self.endTerm forKey:@"term_end"];

}

@end
