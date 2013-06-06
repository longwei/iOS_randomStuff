//
//  SHCToDoItem.h
//  ClearClone
//
//  Created by longwei su on 6/5/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHCToDoItem : NSObject

@property(nonatomic, copy) NSString* text;
@property(nonatomic) BOOL completed;

-(id) initWithText: (NSString*) text;
+(id) toDoItemWithText: (NSString*) text;
@end
