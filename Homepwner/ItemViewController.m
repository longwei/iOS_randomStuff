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
    NSPredicate* predicate;
    if (section == 0) {
        predicate = [NSPredicate predicateWithFormat:@"valueInDollars > 50"];
    } else {
        predicate = [NSPredicate predicateWithFormat:@"valueInDollars <= 50"];
    }
    NSArray* filteredArray = [self dataWithSectionIndex:section];
    
    return ([filteredArray count] + 1);
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    NSArray* filteredArray = [self dataWithSectionIndex:[indexPath section]];
    if ([indexPath row] < [filteredArray count]) {
        BNRItem* p = [filteredArray objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[p description]];
    } else {
        [[cell textLabel] setText:@"No More items"];
    }

    return cell;
}

-(NSArray*) dataWithSectionIndex:(NSInteger) section
{
    NSPredicate* predicate;
    if (section == 0) {
        predicate = [NSPredicate predicateWithFormat:@"valueInDollars > 50"];
    } else {
        predicate = [NSPredicate predicateWithFormat:@"valueInDollars <= 50"];
    }
    return [[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:predicate];
}

@end
