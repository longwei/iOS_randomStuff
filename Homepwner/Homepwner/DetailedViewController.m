//
//  DetailedViewController.m
//  Homepwner
//
//  Created by longwei su on 7/22/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "DetailedViewController.h"
//#import "BNRItem.h"
#import "TopicsList.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController
@synthesize item;

- (void) viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [titleField setText:[item title]];
    [descrField setText:[item descr]];
    [uniqueIDField setText:[NSString stringWithFormat:@"%d",item.uniqueId]];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];

    [changeDate setTitle:[dateFormatter stringFromDate:[[NSDate alloc] init]]
                forState:UIControlStateNormal];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //clear first responder
    [[self view] endEditing:YES];
    
    [item setDescr:[descrField text]];
    [item setUniqueId:[[uniqueIDField text] intValue]];
    [item setTitle:[titleField text]];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-DDTHH:MM:SSZ"];
    [item setLastDeleted:[dateFormatter dateFromString:[uniqueIDField text]]];
    
    
}

-(void) setItem:(TopicsList *)i
{
    item = i;
    [[self navigationItem] setTitle:[item title]];
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [valueField resignFirstResponder];
//}

- (BOOL)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == uniqueIDField) {
        UIBarButtonItem *doneEditingButton = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                              target:self
                                              action:@selector(doneEditingValueField:)];
        [[self navigationItem] setRightBarButtonItem:doneEditingButton];
    }
    return YES;
}
- (BOOL)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == uniqueIDField) {
        [[self navigationItem] setRightBarButtonItem:nil];
    }
    return YES;
}

- (void)doneEditingValueField:(id)sender
{
    [uniqueIDField resignFirstResponder];
}

- (IBAction)changeDate:(id)sender
{
    // Create a new Date View Controller instance
//    DateViewController *dvc = [[DateViewController alloc] init];
    
    // Set the dateItem property to the current BNRItem *item
    // This is how we pass it to the dvc controller
//    [dvc setDateItem:item];
    
    // Push this new Date View Controller onto the Navigation stack
//    [[self navigationController] pushViewController:dvc
//                                           animated:YES];
    NSLog(@"changing....");
}
@end
