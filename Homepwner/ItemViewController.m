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
        for (int i = 0; i < 4; ++i) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

-(id) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

//-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 2;
//}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
//    NSPredicate* predicate;
//    if (section == 0) {
//        predicate = [NSPredicate predicateWithFormat:@"valueInDollars > 50"];
//    } else {
//        predicate = [NSPredicate predicateWithFormat:@"valueInDollars <= 50"];
//    }
//    NSArray* filteredArray = [self dataWithSectionIndex:section];
    
//    return ([filteredArray count] + 1);
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
//    NSArray* filteredArray = [self dataWithSectionIndex:[indexPath section]];
    NSArray* filteredArray = [[BNRItemStore sharedStore] allItems];
    BNRItem* p = [filteredArray objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[p description]];
//    if ([indexPath row] < [filteredArray count]) {
//        BNRItem* p = [filteredArray objectAtIndex:[indexPath row]];
//        [[cell textLabel] setText:[p description]];
//    } else {
//        [[cell textLabel] setText:@"No More items"];
//    }

    return cell;
}

//-(NSArray*) dataWithSectionIndex:(NSInteger) section
//{
//    NSPredicate* predicate;
//    if (section == 0) {
//        predicate = [NSPredicate predicateWithFormat:@"valueInDollars > 50"];
//    } else {
//        predicate = [NSPredicate predicateWithFormat:@"valueInDollars <= 50"];
//    }
//    return [[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:predicate];
//}

- (UIView*) headerView
{
    if (!headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return headerView;
}

- (UIView*) tableView:(UITableView *)tableView
            viewForHeaderInSection:(NSInteger)section
{
    return [self headerView];
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [[self headerView]bounds].size.height;
}

- (IBAction)addNewItem:(id)sender
{
    BNRItem* newItem = [[BNRItemStore sharedStore] createItem];
    int lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
    
}
- (IBAction)toggleEditingMode:(id)sender
{
    if ([self isEditing]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
    
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BNRItemStore* ps = [BNRItemStore sharedStore];
        NSArray* items = [ps allItems];
        BNRItem* p = [items objectAtIndex:[indexPath row]];
        [ps removeItem:p];;
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
    
}

@end
