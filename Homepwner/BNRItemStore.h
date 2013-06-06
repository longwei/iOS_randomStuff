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
    NSMutableArray* allItems;
}
+ (BNRItemStore*) sharedStore;
- (NSArray*) allItems;
- (BNRItem *) createItem;
- (void) removeItem:(BNRItem*) p;
- (void) moveItemAtIndex:(int)from toIndex:(int)to;
@end
