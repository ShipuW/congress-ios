//
//  CategoryModel.m
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

+ (instancetype)infoFromDict:(NSDictionary *)dict
{
    CategoryModel *info = [[CategoryModel alloc] init];
    
    info.name      = [dict objectForKey:@"name"];
    
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

@end
