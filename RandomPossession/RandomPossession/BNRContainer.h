//
//  BNRContainer.h
//  RandomPossession
//
//  Created by longwei su on 3/12/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
//description of name of container sum of values, and list of every BNRitem it contains
{
    NSMutableArray* subitems;
}

-(id) init;
-(id) initWithArray:(NSMutableArray*)inputArray;

- (void) addItem:(BNRItem*) item;

- (int) fullValue;

- (int) valueInDollarsWithIndex:(int) index;


@end
