//
//  LegislatorDetailViewController.m
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "LegislatorDetailViewController.h"

@interface LegislatorDetailViewController ()

@end

@implementation LegislatorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RegisterNotify(NofifyNewsIcon, @selector(downloadIcon:))
    [self setImage];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setImage{
    [[ImageDownload download] setNewsIcon:_legislatorInfo imageView:_infoImage];
}


- (void)tappedStar{
    
    NSData *getLegislatorsData = [defaults objectForKey:SAVE_LEG_KEY];
    NSMutableArray * array = [[NSMutableArray alloc]initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:getLegislatorsData]];
    
    for (LegislatorModel* a in array)
        if(a.ID == _legislatorInfo.ID)
            return;
    
    [array addObject:_legislatorInfo];
    NSData *saveLegislatorsData = [NSKeyedArchiver archivedDataWithRootObject:array];
    [defaults setObject:saveLegislatorsData forKey:SAVE_LEG_KEY];
    [defaults synchronize];
    SendNotify(AddLegNotice, @{})
}

- (void)dealloc
{
    RemoveNofify
}

- (void)downloadIcon:(NSNotification *)notification
{
    NSDictionary *dict = [notification object];
    LegislatorModel *info = [dict objectForKey:@"info"];
    
    if ([info.ID isEqualToString:_legislatorInfo.ID]) {
        UIImage *image = [dict objectForKey:@"data"];
        _infoImage.image = image;
    }
}

#pragma UITableViewDegelate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _legislatorInfo.getTableDisplayNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* displayDictionary = [_legislatorInfo getDictionaryByIndex:(int)indexPath.row];
    BaseDetailTableViewCell *cell = [[BaseDetailTableViewCell alloc]init];
    for (NSString *key in displayDictionary) {
        NSString *cellIdentifier = @"";
        if([[displayDictionary objectForKey:key] isKindOfClass:[NSString class]]){
            cellIdentifier = LABEL_CELL_ID;
            cell = (LabelTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSArray* Objects = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:tableView options:nil];
                cell = [Objects objectAtIndex:0];
            }
        }else if ([[displayDictionary objectForKey:key] isKindOfClass:[NSURL class]]){
            cellIdentifier = BUTTON_CELL_ID;
            cell = (ButtonTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSArray* Objects = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:tableView options:nil];
                cell = [Objects objectAtIndex:0];
            }
        }
        
    }
    
    cell.displayDictionary = displayDictionary;
    [cell setDisplay];
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


@end
