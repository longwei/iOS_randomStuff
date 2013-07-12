//
//  FailedBankListViewController.m
//  FailedBanks
//
//  Created by longwei su on 7/12/13.
//  Copyright (c) 2013 Longwei Su. All rights reserved.
//

#import "FailedBankListViewController.h"
#import "FailedBankDatabase.h"
#import "FailedBankInfo.h"


@implementation FailedBankListViewController
{
    
    
}
@synthesize failedBankInfos = _failedBankInfos;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.failedBankInfos = [FailedBankDatabase database].failedBankInfos;
    self.title = @"Failed Banks";
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [_failedBankInfos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                       reuseIdentifier:CellIdentifier] autorelease];
//    }
    
    // Set up the cell...
    FailedBankInfo *info = [_failedBankInfos objectAtIndex:indexPath.row];
    cell.textLabel.text = info.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@",
                                 info.city, info.state];
    
    return cell;
}

@end
