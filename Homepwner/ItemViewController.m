//
//  ItemViewController.m
//  Homepwner
//
//  Created by longwei su on 5/7/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "ItemViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"

@implementation ItemViewController

-(id) init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self){
        for (int i = 0; i < 10; ++i) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

-(id) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [[[BNRItemStore sharedStore] allItems] count];
    if (section == 0) {
        return [[[BNRItemStore sharedStore] expensiveItems] count];
    } else {
        return [[[BNRItemStore sharedStore] cheapItems] count];
    }
    
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
//    BNRItem* p = [[[BNRItemStore sharedStore] allItems]objectAtIndex:[indexPath row]];
//    [[cell textLabel] setText:[p valueInDollar]];
    if ([indexPath section] == 0) {
        BNRItem *p = [[[BNRItemStore sharedStore] expensiveItems] objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[p description]];
    } else {
        BNRItem *p = [[[BNRItemStore sharedStore] cheapItems] objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[p description]];
    }
    return cell;
}

@end
