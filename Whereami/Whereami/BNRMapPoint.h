//
//  BNRMapPoint.h
//  Whereami
//
//  Created by longwei su on 3/13/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface BNRMapPoint : NSObject <MKAnnotation>

- (id) initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString*) t;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;

@end

