//
//  BNRItemStore.h
//  Homepwner
//
//  Created by longwei su on 5/7/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject
{
//    NSMutableArray* allItems;
    NSMutableArray* expensiveItems;
    NSMutableArray* cheapItems;
}
+ (BNRItemStore*) sharedStore;
//- (NSArray*) allItems;

- (NSArray*) expensiveItems;
- (NSArray*) cheapItems;
- (BNRItem *) createItem;

@end
