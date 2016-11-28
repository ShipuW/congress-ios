//
//  ImageDownload.m
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "ImageDownload.h"

@interface ImageDownload ()
@property(nonatomic, strong) NSOperationQueue   *imageQueue;
@end


@implementation ImageDownload

+ (ImageDownload *)download
{
    static ImageDownload *s_download = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        s_download = [[ImageDownload alloc] init];
    });
    
    return s_download;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.dictIcons = [[NSMutableDictionary alloc] init];
        
        _imageQueue = [[NSOperationQueue alloc] init];
        [_imageQueue setMaxConcurrentOperationCount:4];
    }
    
    return self;
}


#pragma mark - Download NewsIcon

- (void)cancelDownload
{
    [_imageQueue cancelAllOperations];
}

- (void)setNewsIcon:(LegislatorModel *)newsInfo
          imageView:(UIImageView *)imageView
{

    imageView.image = [UIImage imageNamed:@"NewsDefault.png"];
    [self downloadNewsIcon:newsInfo];

}

- (void)downloadNewsIcon:(LegislatorModel *)info
{
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downNewsIconThread:) object:info];
    
    [_imageQueue addOperation:op];
}

- (void)downNewsIconThread:(LegislatorModel *)info
{

    NSURL *url = info.imageUrl;
    

    if (url != nil) {
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        NSDictionary *dictInfo = @{
                                   @"info": info,
                                   @"data": image
                                   };
        SEL sel = @selector(notifyNewsIconDownload:);
        
        [self performSelectorOnMainThread:sel
                               withObject:dictInfo
                            waitUntilDone:NO];
    }
}

- (void)notifyNewsIconDownload:(NSDictionary *)dict
{
    SendNotify(NofifyNewsIcon, dict)
}


@end
