//
//  WhereamiViewController.h
//  Whereami
//
//  Created by longwei su on 3/13/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager* locationManager;
}

@end
