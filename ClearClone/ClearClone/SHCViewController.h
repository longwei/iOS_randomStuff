//
//  SHCViewController.h
//  ClearClone
//
//  Created by longwei su on 6/5/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHCViewController : UIViewController <UITableViewDataSource>
{
    IBOutlet UITableView* tableView;
    NSMutableArray* _toDoItems;
}
@end
