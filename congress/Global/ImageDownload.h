//
//  ImageDownload.h
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//


#import "LegislatorModel.h"

@interface ImageDownload : NSObject

@property(nonatomic, strong)NSMutableDictionary *dictIcons;

+ (ImageDownload *)download;

- (void)cancelDownload;
- (void)setNewsIcon:(LegislatorModel *)newsInfo
          imageView:(UIImageView *)imageView;

@end
