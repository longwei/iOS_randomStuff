//
//  BNRItemStore.m
//  Homepwner
//
//  Created by longwei su on 5/7/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "BNRItemStore.h"
//#import "BNRItem.h"
#import "TopicsList.h"
#import "DatabaseAccess.h"

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

//prevent alloc call
+(id) allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (id) init
{
    self = [super init];
    if(self){
//        allItems = [[NSMutableArray alloc] init];
        allItems = [DatabaseAccess database].topicsListInfos;
    }
    return self;
}

- (NSArray*) allItems
{
    return allItems;
}

- (TopicsList*) createItem
{
    TopicsList* p = [TopicsList randomItem];
    [allItems addObject:p];
    return p;
}


- (void) removeItem:(TopicsList*) p
{
    [allItems removeObjectIdenticalTo:p];
}

-(void) moveItemAtIndex:(int) from toIndex:(int)to
{
    if(from == to) {return;}
    TopicsList* p = [allItems objectAtIndex:from];
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:p atIndex:to];
}

@end
