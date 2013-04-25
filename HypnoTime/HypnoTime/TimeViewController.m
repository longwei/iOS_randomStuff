//
//  TimeViewController.m
//  HypnoTime
//
//  Created by longwei su on 4/24/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

-(id) initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    self = [super initWithNibName:nil bundle:nil];
    if(self){
        UITabBarItem* tbi = [self tabBarItem];
        [tbi setTitle:@"Time"];
        UIImage* i = [UIImage imageNamed:@"Time.png"];
        [tbi setImage:i];
    }
    return self;
}

-(IBAction)showCurrentTime:(id)sender
{
    NSDate* now = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    [timeLabel setText:[formatter stringFromDate:now]];
    NSLog(@"pushed");
    
}
-(void) viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"time view loaded");
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"CurrentTimeViewController will appear");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

-(void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"view disppeared");
    [super viewWillDisappear:animated];
}



@end
