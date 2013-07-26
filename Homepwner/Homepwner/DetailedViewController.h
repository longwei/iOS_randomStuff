//
//  DetailedViewController.h
//  Homepwner
//
//  Created by longwei su on 7/22/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class BNRItem;
@class TopicsList;

@interface DetailedViewController : UIViewController
{
    __weak IBOutlet UITextField *titleField;
    __weak IBOutlet UITextField *descrField;
    __weak IBOutlet UITextField *uniqueIDField;
    __weak IBOutlet UIButton *changeDate;
}
@property(nonatomic, strong) TopicsList* item;

-(IBAction)changeDate:(id)sender;
@end
