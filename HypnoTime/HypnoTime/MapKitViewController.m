//
//  MapKitViewController.m
//  HypnoTime
//
//  Created by longwei su on 4/25/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "MapKitViewController.h"

@interface MapKitViewController ()

@end

@implementation MapKitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [worldView setShowsUserLocation:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
