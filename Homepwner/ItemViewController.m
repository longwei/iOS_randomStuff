//
//  ItemViewController.m
//  Homepwner
//
//  Created by longwei su on 5/7/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "ItemViewController.h"
//#import "BNRItem.h"
#import "BNRItemStore.h"
#import "TopicsList.h"
#import "DatabaseAccess.h"

@implementation ItemViewController

-(id) init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self){
        [[self navigationItem] setTitle:@"TOPICS"];
        UIBarButtonItem* bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        [[self navigationItem] setRightBarButtonItem:bbi];
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
//        for (int i = 0; i < 4; ++i) {
//            [[BNRItemStore sharedStore] createItem];
//        }
        NSLog(@"reading db");
        NSArray *TopicsLists = [DatabaseAccess database].topicsListInfos;
        for (TopicsList *info in TopicsLists) {
            NSLog(@"%d: %@, %@, %@", info.uniqueId, info.name, info.city, info.state);
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
    TopicsList* p = [filteredArray objectAtIndex:[indexPath row]];
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
            viewForFooterInSection:(NSInteger)section
{
    return [self headerView];
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return [[self headerView]bounds].size.height;
}

//------
- (IBAction)addNewItem:(id)sender
{
    TopicsList* newItem = [[BNRItemStore sharedStore] createItem];
    int lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
    
}
//- (IBAction)toggleEditingMode:(id)sender
//{
//    if ([self isEditing]) {
//        [sender setTitle:@"Edit" forState:UIControlStateNormal];
//        [self setEditing:NO animated:YES];
//    } else {
//        [sender setTitle:@"Done" forState:UIControlStateNormal];
//        [self setEditing:YES animated:YES];
//    }
//}
- (IBAction)syncWithServer:(id)sender
{
    //todo.....
    NSLog(@"syncing..");
}

//-----------
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //pop a confirm
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No network connection"
//                                                        message:@"You must be connected to the internet to use this app."
//                                                       delegate:nil
//                                              cancelButtonTitle:@"Cancel"
//                                              otherButtonTitles:@"Remove", nil];
//        [alert show];
        BNRItemStore* ps = [BNRItemStore sharedStore];
        NSArray* items = [ps allItems];
        TopicsList* p = [items objectAtIndex:[indexPath row]];
        [ps removeItem:p];;
        //also remove that rwo from table view
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
    
}

-(NSString*) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"REMOVE";
}

//-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    DetailedViewController* detailedController = [[DetailedViewController alloc] init];
//    NSArray* items = [[BNRItemStore sharedStore] allItems];
//    BNRItem* selectedItem = [items objectAtIndex:[indexPath row]];
//    [detailedController setItem:selectedItem];
//    [[self navigationController] pushViewController:detailedController animated:YES];
//}
//
//-(void) viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [[self tableView] reloadData];
//}

@end
