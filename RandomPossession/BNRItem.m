//
//  BNRItem.m
//  RandomPossession
//
//  Created by longwei su on 10/30/12.
//  Copyright (c) 2012 com.longwei. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
+ (id) randomItem
{
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                    @"Rusty",
                                    @"Shiny", nil];
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear",
                               @"Spork",
                               @"Mac", nil];
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    int randomValue = rand() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10];
    // Once again, ignore the memory problems with this method
    BNRItem *newItem =
    [[self alloc] initWithItemName:randomName
                    valueInDollar:randomValue
                      serialNumber:randomSerialNumber];
    return newItem;
}

- (id) initWithItemName: (NSString *)name
          valueInDollar: (int) value
           serialNumber: (NSString *) sNumber;
{
    self = [super init];
    if (self) {
        [self setItemName:name];
        [self setSerialName:sNumber];
        valueInDollars = value;
        dateCreated = [[NSDate alloc] init];
    }
    return self;
}

- (void) dealloc
{
    NSLog(@"destroyed %@", self);
}

- (id) initvalueInDollar
{
    return [self initWithItemName:@"item"
                            valueInDollar:0
                     serialNumber:@""];
}

- (void) setItemName:(NSString *)str
{
    itemName = str;
}

- (NSString *)itemName
{
    return itemName;
}

- (void) setSerialName:(NSString *)str
{
    serialName = str;
}

- (NSString *) serialName
{
    return serialName;
}

- (void)setValueInDollars:(int)i
{
    valueInDollars = i;
}

- (int)valueInDollars
{
    return valueInDollars;
}

- (NSDate *) dateCreated
{
    return dateCreated;
}

- (NSString *) description
{
    NSString *desc = [[NSString alloc] initWithFormat:@("%@ (%@): Worth $%d, recored %@")
                      ,itemName, serialName, valueInDollars, dateCreated];
    return desc;
}

- (void) setContainedItem: (BNRItem *)i
{
    containedItem = i;
    [self setContainer:self];
}
- (BNRItem *) containedItem
{
    return containedItem;
}

- (void) setContainer:(BNRItem *) i
{
    container = i;
}
- (BNRItem *) container
{
    return container;
}


@end
