//
//  ItemViewController.h
//  Homepwner
//
//  Created by longwei su on 5/7/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailedViewController.h"

@interface ItemViewController : UITableViewController
{
    IBOutlet UIView* headerView;
}

- (UIView*) headerView;
- (IBAction)addNewItem:(id)sender;
- (IBAction)syncWithServer:(id)sender;

//-(NSArray*) dataWithSectionIndex:(NSInteger) section;//?why?
@end
