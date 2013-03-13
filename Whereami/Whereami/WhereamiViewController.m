//
//  WhereamiViewController.m
//  Whereami
//
//  Created by longwei su on 3/13/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "WhereamiViewController.h"
@implementation WhereamiViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager setDistanceFilter:50];
        [locationManager setHeadingFilter:50];
        [locationManager startUpdatingHeading];
        [locationManager startUpdatingLocation];
    }
    return self;
}

-(void) dealloc
{
    [locationManager setDelegate:nil];
}

- (void) locationManager: (CLLocationManager*) manager
     didUpdateToLocation: (CLLocation*) newLocation
            fromLocation: (CLLocation*) oldLocation
{
    NSLog(@"location: %@", newLocation);	
}

- (void) locationManager:(CLLocationManager *)manager
        didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"heading: %@", newHeading);
}

- (void) locationManager: (CLLocationManager*) manager
        didFailWIthError:(NSError*) error
{
    //here just in case
    NSLog(@"Could not find the location: %@", error);
}

@end
