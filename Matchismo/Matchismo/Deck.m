//
//  Deck.m
//  Matchismo
//
//  Created by longwei su on 6/16/13.
//  Copyright (c) 2013 Longwei Su. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property(strong, nonatomic)NSMutableArray* cards;
@end
@implementation Deck

- (NSMutableArray *)cards
{
    
}

- (void) addCard: (Card*)card atTop:(BOOL) atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}
- (Card*) drawRandomCard
{
    
}
@end
