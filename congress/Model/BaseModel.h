//
//  BaseModel.h
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface BaseModel : NSObject

@property(nonatomic, strong) NSString    *ID;
@property(nonatomic, strong) NSString    *chamber;

+ (instancetype)infoFromDict:(NSDictionary *)dict;
+ (NSArray *)arrayFromDict:(NSDictionary *)dict;
+ (NSArray *)arrayFromArray:(NSArray *)array;

@end
