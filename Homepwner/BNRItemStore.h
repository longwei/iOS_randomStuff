//
//  BNRItemStore.h
//  Homepwner
//
//  Created by longwei su on 5/7/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class BNRItem;
@class TopicsList;

@interface BNRItemStore : NSObject
{
    NSMutableArray* allItems;
    NSMutableArray* remoteItems;
    
    NSDictionary *jsonDict;
    NSArray *episodes;
    NSURL *url;
}
+ (BNRItemStore*) sharedStore;
- (NSArray*) allItems;
- (TopicsList *) createItem;
- (void) removeItem:(TopicsList*) p;
- (void) moveItemAtIndex:(int)from toIndex:(int)to;
- (void) parseJSONWithURL:(NSURL *) jsonURL;
@end
