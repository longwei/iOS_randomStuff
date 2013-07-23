//
//  DetailedViewController.h
//  Homepwner
//
//  Created by longwei su on 7/22/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BNRItem;

@interface DetailedViewController : UIViewController
{
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
//    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UIButton *changeDate;
}
@property(nonatomic, strong) BNRItem* item;

-(IBAction)changeDate:(id)sender;
@end
