//
//  BNRItem.h
//  RandomPossession
//
//  Created by longwei su on 10/30/12.
//  Copyright (c) 2012 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
//{
//    NSString *itemName;
//    NSString *serialName;
//    int valueInDollars;
//    NSDate *dateCreated;
//    
//    BNRItem *containedItem;
//    __weak BNRItem *container;
//}
+ (id) randomItem;

- (id) initWithItemName: (NSString *)name
          valueInDollar: (int) value
           serialNumber: (NSString *) sNumber;
- (id) initWithItemName:(NSString *)name
           serialNumber:(NSString *)sNumber;

//- (void) setContainer:(BNRItem *) i;
//- (BNRItem *) container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialName;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@end
