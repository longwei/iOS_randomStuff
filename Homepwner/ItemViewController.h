//
//  ItemViewController.h
//  Homepwner
//
//  Created by longwei su on 5/7/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemViewController : UITableViewController
{
    IBOutlet UIView* headerView;
}

- (UIView*) headerView;
- (IBAction)addNewItem:(id)sender;
- (IBAction)toggleEditingMode:(id)sender;

//-(NSArray*) dataWithSectionIndex:(NSInteger) section;//?why?
@end
