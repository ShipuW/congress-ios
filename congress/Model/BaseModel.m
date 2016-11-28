//
//  BaseModel.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


+ (instancetype)infoFromDict:(NSDictionary *)dict
{
    BaseModel *info = [[BaseModel alloc] init];
    
    info.ID      = [dict objectForKey:@"id"];
    info.chamber = [dict objectForKey:@"chamber"];
    
    return info;
}

+ (NSArray *)arrayFromDict:(NSDictionary *)dict
{
    NSArray *array = [dict objectForKey:NetResults];
    return [[self class] arrayFromArray:array];
}

+ (NSArray *)arrayFromArray:(NSArray *)array
{
    NSMutableArray *infos = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in array) {
        [infos addObject:[[self class] infoFromDict:dict]];
    }
    
    if (infos.count <= 0) {
        infos = nil;
    }
    
    return infos;
}

- (NSComparisonResult)compare:(BaseModel *)bInfo
{
    return [self.ID caseInsensitiveCompare:bInfo.ID];
}

- (BOOL)isEqual:(BaseModel *)bInfo
{
    return [self.ID isEqualToString:bInfo.ID];
}

- (int)getTableDisplayNumber{
    int res = 0;
    if (self.ID) res++;
    if (self.chamber) res++;
    return res;
}

- (NSDictionary *)getDictionaryByIndex:(int)index{
    int i = 0;
    if(self.ID){
        if (index == i)return @{@"id":self.ID};
        i++;
    }
    if(self.chamber){
        if (index == i)return @{@"id":self.ID};
        i++;
    }
    return nil;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.ID = [aDecoder decodeObjectForKey:@"ID"];
        self.chamber = [aDecoder decodeObjectForKey:@"chamber"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.ID forKey:@"ID"];
    [aCoder encodeObject:self.chamber forKey:@"chamber"];
}

@end
