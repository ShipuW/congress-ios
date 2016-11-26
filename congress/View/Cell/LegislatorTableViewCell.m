//
//  LegislatorTableViewCell.m
//  congress
//
//  Created by 王士溥 on 11/18/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "LegislatorTableViewCell.h"

@implementation LegislatorTableViewCell

- (void)initCell
{
    [super initCell];
    RegisterNotify(NofifyNewsIcon, @selector(downloadIcon:))
}

- (void)dealloc
{
    RemoveNofify
}

- (void)setCellData:(LegislatorModel *)info
{
    [super setCellData:info];
    
    _nameLabel.numberOfLines = 1;
    _nameLabel.text = [NSString stringWithFormat:@"%@ %@",info.firstName,info.lastName ];
    _stateLabel.numberOfLines = 1;
    _stateLabel.text = info.state;
    
    [[ImageDownload download] setNewsIcon:info imageView:_imageView];
}

- (void)downloadIcon:(NSNotification *)notification
{
    NSDictionary *dict = [notification object];
    LegislatorModel *info = [dict objectForKey:@"info"];
    
    if ([info.ID isEqualToString:self.cellInfo.ID]) {
        UIImage *image = [dict objectForKey:@"data"];
        _imageView.image = image;
    }
}
@end
