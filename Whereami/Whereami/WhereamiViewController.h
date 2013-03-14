//
//  WhereamiViewController.h
//  Whereami
//
//  Created by longwei su on 3/13/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager* locationManager;
    
    IBOutlet MKMapView* worldView;
    IBOutlet UITextField * locationTitleField;
    IBOutlet UIActivityIndicatorView* activityIndicator;
    IBOutlet UISegmentedControl* segmentControl;
    //IBOutlet means it will create obhect in a XIB file. 
}
-(void) findLocation;

-(void) foundLocation:(CLLocation*) loc;

-(IBAction)chooseMapType:(id)sender;

@end