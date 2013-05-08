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

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    BNRItem* p = [[[BNRItemStore sharedStore] allItems]objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[p valueInDollar]];
    return cell;
}

@end
