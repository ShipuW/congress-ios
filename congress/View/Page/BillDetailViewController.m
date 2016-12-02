//
//  BillDetailViewController.m
//  congress
//
//  Created by 王士溥 on 11/26/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BillDetailViewController.h"

@interface BillDetailViewController ()

@end

@implementation BillDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBillTitle];
    [self setNavRightButton];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBillTitle{
    _textView.text = _billInfo.officialTitle;
}





- (void)setNavRightButton{
    NSData *getBillsData = [defaults objectForKey:SAVE_BIL_KEY];
    NSMutableArray * array = [[NSMutableArray alloc]initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:getBillsData]];
    
    
    for (BillModel* a in array){
        if([a.ID isEqualToString: _billInfo.ID]){
            rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:FILLED_STAR] style:UIBarButtonItemStylePlain target:self action:@selector(tappedStar)];
            self.navigationItem.rightBarButtonItem = rightButton;
            isLiked = YES;
            return;
        }
    }
    rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:EMPTY_STAR] style:UIBarButtonItemStylePlain target:self action:@selector(tappedStar)];
    self.navigationItem.rightBarButtonItem = rightButton;
    isLiked = NO;
    
    
}

- (void)tappedStar{
    if(isLiked){
        isLiked = NO;
        rightButton.image = [UIImage imageNamed:EMPTY_STAR];
        NSData *getBillsData = [defaults objectForKey:SAVE_BIL_KEY];
        NSMutableArray * array = [[NSMutableArray alloc]initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:getBillsData]];
        
        for (BillModel* a in array){
            if([a.ID isEqualToString: _billInfo.ID]){
                [array removeObject:a];
                NSData *saveBillsData = [NSKeyedArchiver archivedDataWithRootObject:array];
                [defaults setObject:saveBillsData forKey:SAVE_BIL_KEY];
                [defaults synchronize];
                return;
            }
        }
        
        
    }else{
        isLiked = YES;
        rightButton.image = [UIImage imageNamed:FILLED_STAR];
        NSData *getBillsData = [defaults objectForKey:SAVE_BIL_KEY];
        NSMutableArray * array = [[NSMutableArray alloc]initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:getBillsData]];
        
        for (BillModel* a in array)
            if([a.ID isEqualToString: _billInfo.ID])
                return;
        
        [array addObject:_billInfo];
        NSData *saveBillsData = [NSKeyedArchiver archivedDataWithRootObject:array];
        [defaults setObject:saveBillsData forKey:SAVE_BIL_KEY];
        [defaults synchronize];
        SendNotify(AddBilNotice, @{})
    }
}

#pragma UITableViewDegelate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _billInfo.getTableDisplayNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* displayDictionary = [_billInfo getDictionaryByIndex:(int)indexPath.row];
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
