//
//  Committee.h
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface CommitteeModel : BaseModel

@property(nonatomic, strong) NSString    *name;
@property(nonatomic, strong) NSString    *parentID;
@property(nonatomic, strong) NSString    *office;
@property(nonatomic, strong) NSString    *contact;

+ (NSArray*)sortByName:(NSArray*)array;

@end
