//
//  BNRMapPoint.m
//  Whereami
//
//  Created by longwei su on 3/13/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint

@synthesize coordinate, title, subtitle;

- (id) initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString*) t
{
    self = [super init];
    if(self){
        coordinate = c;
        subtitle = [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterShortStyle];
        [self setTitle:t];

    }
    return self;
}

- (id) init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32)
                                    title:@"Hometown"];
}
@end
