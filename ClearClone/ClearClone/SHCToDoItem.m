//
//  SHCToDoItem.m
//  ClearClone
//
//  Created by longwei su on 6/5/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "SHCToDoItem.h"

@implementation SHCToDoItem

-(id)initWithText:(NSString*)text {
    if (self = [super init]) {
        self.text = text;
    }
    return self;
}

+(id)toDoItemWithText:(NSString *)text {
    return [[SHCToDoItem alloc] initWithText:text];
}
@end
