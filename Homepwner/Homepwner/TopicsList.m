//
//  TopicsList.m
//  Homepwner
//
//  Created by longwei su on 7/23/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "TopicsList.h"

@implementation TopicsList

@synthesize uniqueId = _uniqueId;
@synthesize name = _name;
@synthesize city = _city;
@synthesize state = _state;

- (id)initWithUniqueId:(int)uniqueId name:(NSString *)name city:(NSString *)city
                 state:(NSString *)state {
    if ((self = [super init])) {
        self.uniqueId = uniqueId;
        self.name = name;
        self.city = city;
        self.state = state;
    }
    return self;
}

- (NSString *) description
{
//    NSString *desc = [[NSString alloc] initWithFormat:@("%@ (%@): $%d, %@")
//                      ,itemName, serialNumber, valueInDollars, dateCreated];
    return @"description";
}
@end
