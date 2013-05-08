//
//  BNRItemStore.m
//  Homepwner
//
//  Created by longwei su on 5/7/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemStore

+(BNRItemStore*) sharedStore
{
    static BNRItemStore* sharedStore = nil;
    if(!sharedStore){
        //use sharedstore's NSObject's allocWithZone to avoid loop
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+(id) allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (id) init
{
    self = [super init];
    if(self){
//        allItems = [[NSMutableArray alloc] init];
        expensiveItems = [[NSMutableArray alloc] init];
        cheapItems = [[ NSMutableArray alloc] init];
        
    }
    return self;
}

- (NSArray*) expensiveItems
{
    return expensiveItems;
}

- (NSArray*) cheapItems
{
    return cheapItems;
}

- (BNRItem*) createItem
{
    BNRItem *p = [BNRItem randomItem];
    if ([p valueInDollars] > 50) {
        [expensiveItems addObject:p];
    }
    if ([p valueInDollars] <= 50) {
        [cheapItems addObject:p];
    }
    return p;
}

@end
