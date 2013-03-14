//
//  WhereamiViewController.m
//  Whereami
//
//  Created by longwei su on 3/13/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@implementation WhereamiViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
//        [locationManager setDistanceFilter:50];
//        [locationManager setHeadingFilter:50];
//        [locationManager startUpdatingHeading];
//        [locationManager startUpdatingLocation];
//        [worldView setMapType:MKMapTypeSatellite];
    }
    return self;
}

- (void) viewDidLoad
{
    [worldView setShowsUserLocation:YES];
    [worldView setMapType:MKMapTypeSatellite];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    [textField resignFirstResponder];//this how vkb dismissed;
    return YES;
}
-(IBAction)chooseMapType:(id)sender
{
    [worldView setMapType:[segmentControl selectedSegmentIndex]];
}


- (void)mapView:(MKMapView *)mapView
didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region= MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
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
    [self foundLocation:newLocation];
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

-(void) findLocation
//tell the locationMgr to find the location, textfield locked, and activeIndicator spinning
{
    [locationManager startUpdatingLocation];
    [locationTitleField setHidden:YES];
    [activityIndicator startAnimating];
}

-(void) foundLocation:(CLLocation*) loc
//create BNRMappoint and add to mapview
{
    CLLocationCoordinate2D coord = [loc coordinate];
    BNRMapPoint* tmp = [[BNRMapPoint alloc] initWithCoordinate:(coord) title:[locationTitleField text]];
    [worldView addAnnotation:tmp];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region];
    
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

@end
