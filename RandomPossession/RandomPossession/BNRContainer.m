//
//  BNRContainer.m
//  RandomPossession
//
//  Created by longwei su on 3/12/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

-(id) init
{
    self = [super init];
    if(self){
        subitems =[[NSMutableArray alloc] init];
    }
    return self;
}

-(id) initWithArray:(NSMutableArray*) inputArray
{
    self = [self init];
    self = [super init];
    for(BNRItem* i in inputArray){
        [subitems addObject:i];
//        subitems = [[NSMutableArray alloc] initWithArray:inputArray copyItems:YES];
    }
    return self;
}


- (void) addItem:(BNRItem*) item
{
    [subitems addObject:item];
}

- (int) fullValue
{
    int result = 0;
    for (BNRItem *i in subitems) {
        result += [i valueInDollars];
    }
    return result;
}

- (int) valueInDollarsWithIndex:(int) index
{
    if (index < [subitems count]) {
        return [subitems objectAtIndex:index];
    }
    return 0;
}


- (NSString *) description
{
//    NSString *desc = [[NSString alloc] initWithFormat:@("%@ (%@): Worth $%d, recored %@")
//                      ,itemName, serialName, valueInDollars, dateCreated];
//    return desc;
    NSMutableString *result = [[NSMutableString alloc] initWithFormat:@("name :%@, sum: %d \n"),
                             [self itemName], [self fullValue]];
    return result;
}


@end
