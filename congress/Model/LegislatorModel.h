//
//  LegislatorModel.h
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface LegislatorModel : BaseModel

@property(nonatomic, strong) NSURL       *imageUrl;
@property(nonatomic, strong) NSString    *firstName;
@property(nonatomic, strong) NSString    *lastName;
@property(nonatomic, strong) NSString    *state;
@property(nonatomic, strong) NSString    *gender;
@property(nonatomic, strong) NSString    *birthDate;
@property(nonatomic, strong) NSString    *fax;
@property(nonatomic, strong) NSURL       *twitterLink;
@property(nonatomic, strong) NSURL       *facebookLink;
@property(nonatomic, strong) NSURL       *websiteLink;
@property(nonatomic, strong) NSString    *office;
@property(nonatomic, strong) NSString    *endTerm;

+ (NSArray*)sortByFirstName:(NSArray*)array;
@end
