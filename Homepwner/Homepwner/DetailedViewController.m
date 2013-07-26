//
//  DetailedViewController.m
//  Homepwner
//
//  Created by longwei su on 7/22/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "DetailedViewController.h"
#import "BNRItem.h"

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
    [nameField setText:[item itemName]];
    [serialNumberField setText:[item serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d", [item valueInDollars]]];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [changeDate setTitle:[dateFormatter stringFromDate:[item dateCreated]]forState:UIControlStateNormal];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //clear first responder
    [[self view] endEditing:YES];
    
    [item setItemName:[nameField text]];
    [item setSerialNumber:[serialNumberField text]];
    [item setValueInDollars:[[valueField text] intValue]];
    
}

-(void) setItem:(BNRItem *)i
{
    item = i;
    [[self navigationItem] setTitle:[item itemName]];
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [valueField resignFirstResponder];
//}

- (BOOL)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == valueField) {
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
    if (textField == valueField) {
        [[self navigationItem] setRightBarButtonItem:nil];
    }
    return YES;
}

- (void)doneEditingValueField:(id)sender
{
    [valueField resignFirstResponder];
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
