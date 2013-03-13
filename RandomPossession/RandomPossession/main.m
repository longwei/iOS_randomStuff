//
//  main.m
//  RandomPossession
//
//  Created by longwei su on 10/30/12.
//  Copyright (c) 2012 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray* items= [[NSMutableArray alloc] init];
//        [items addObject:@"one"];
//        [items addObject:@"two"];
//        [items insertObject:@"three" atIndex:2];
        for(int i = 0; i < 3; i++){
            BNRItem* p = [BNRItem randomItem];
            [items addObject:p];
        }
//        for (BNRItem* s in items) {
//            NSLog(@"%@",s);
//        }
        
//        BNRItem* another = [[BNRItem alloc] initWithItemName:@"Longwei" serialNumber:@"Su"];
//        NSLog(@"%@", another);
        
        BNRContainer* container1 = [[BNRContainer alloc] initWithArray:items];
        [container1 setItemName: @"container1"];
        BNRContainer* container2 = [[BNRContainer alloc] initWithArray:items];
        [container2 setItemName: @"container2"];
        NSLog(@"%@",container1);
        NSLog(@"%@",container2);
        BNRContainer* containerTop = [[BNRContainer alloc] init];
        [containerTop addItem: container1];
        [containerTop addItem: container2];
        NSLog(@"%@",containerTop);
        
//        BNRItem *backpack = [[BNRItem alloc] init];
//        [backpack setItemName:@"Backpack"];
//        BNRItem *calculator = [[BNRItem alloc] init];
//        [calculator setItemName:@"Calculator"];
//        [backpack setContainedItem:calculator];
//        NSLog(@"Container: %@", [calculator container]);
//        backpack = nil;
//        calculator = nil;

    }
    return 0;
}

