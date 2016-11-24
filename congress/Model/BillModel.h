//
//  BillModel.h
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface BillModel : BaseModel

@property(nonatomic, strong) NSString    *officialTitle;
@property(nonatomic, strong) NSString    *type;
@property(nonatomic, strong) NSString    *sponsor;
@property(nonatomic, strong) NSString    *lastActionDate;
@property(nonatomic, strong) NSString    *pdfUrl;
@property(nonatomic, strong) NSString    *lastVoteDate;
@property(nonatomic, strong) NSString    *status;


@end
