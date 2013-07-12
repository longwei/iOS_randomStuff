//
//  Deck.h
//  Matchismo
//
//  Created by longwei su on 6/16/13.
//  Copyright (c) 2013 Longwei Su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void) addCard: (Card*)card atTop:(BOOL) atTop;
- (Card*) drawRandomCard;
@end
