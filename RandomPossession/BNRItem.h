//
//  BNRItem.h
//  RandomPossession
//
//  Created by longwei su on 10/30/12.
//  Copyright (c) 2012 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *itemName;
    NSString *serialName;
    int valueInDollars;
    NSDate *dateCreated;
    
    BNRItem *containedItem;
    BNRItem *container;
}
+ (id) randomItem;

- (id) initWithItemName: (NSString *)name
          valueInDollar: (int) value
           serialNumber: (NSString *) sNumber;

- (void) setItemName: (NSString *) str;
- (NSString *) itemName;

- (void) setSerialName: (NSString *) str;
- (NSString *)serialName;

- (void) setValueInDollars: (int) i;
- (int) valueInDollars;

- (NSData *) dateCreated;

- (void) setContainedItem: (BNRItem *)i;
- (BNRItem *) containedItem;

- (void) setContainer:(BNRItem *) i;
- (BNRItem *) container;



@end
