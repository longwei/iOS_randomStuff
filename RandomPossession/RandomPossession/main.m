//
//  main.m
//  RandomPossession
//
//  Created by longwei su on 10/30/12.
//  Copyright (c) 2012 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSMutableArray *item = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; ++i) {
            BNRItem *p = [BNRItem randomItem];
            [item addObject:p];
        }
        for (int i = 0; i < [item count]; ++i) {
            NSLog(@"%@",[item objectAtIndex:i]);
        }
        NSLog(@"setting to nil...");
        item = nil;
    }
    return 0;
}

