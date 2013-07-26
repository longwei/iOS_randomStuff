//
//  TopicsList.m
//  Homepwner
//
//  Created by longwei su on 7/23/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "TopicsList.h"

@implementation TopicsList


@synthesize lastDeleted;
@synthesize descr;
@synthesize title;
@synthesize deleted;
@synthesize created;
@synthesize itemOrder;
@synthesize priority;
@synthesize numItems;
@synthesize lastModified;
@synthesize numChecked;
@synthesize hidden;
@synthesize uniqueId;

//- (id)initWithUniqueId:(int)p_uniqueId name:(NSString *)p_name city:(NSString *)p_city
//                 state:(NSString *)p_state {
//    if ((self = [super init])) {
//        self.uniqueId = p_uniqueId;
//        self.name = p_name;
//        self.city = p_city;
//        self.state = p_state;
//    }
//    return self;
//}

-(id) initWithUniqueId:(int)p_uniqueId
          lastDeleted:(NSDate *)p_lastDetected
           descr:(NSString *)p_description
                 title:(NSString *)p_title
               deleted:(Boolean)p_deleted
               created:(NSDate *)p_created
             itemOrder:(NSString* )p_itemOrder
              priority:(int)p_priority
              numItems:(int)p_numItems
          lastModified:(NSDate *)p_lastModified
            numChecked:(int)p_numChecked
                hidden:(int)p_hidden
{
    if ((self = [super init])) {
        self.uniqueId = p_uniqueId;
        self.lastDeleted = p_lastDetected;
        self.descr = p_description;
        self.title = p_title;
        self.deleted = p_deleted;
        self.created = p_created;
        self.itemOrder = p_itemOrder;
        self.priority = p_priority;
        self.numItems = p_numItems;
        self.lastModified = p_lastModified;
        self.numChecked = p_numChecked;
        self.hidden = p_hidden;
    }
    NSLog(@"created");
    return self;
    
}
- (NSString *) description
{
    return self.title;
}

+ (id) randomItem{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"YYYY-MM-DDTHH:MM:SSZ"];
    NSDate *now = [[NSDate alloc] init];
    
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                    @"Rusty",
                                    @"Shiny", nil];
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear",
                               @"Spork",
                               @"Mac", nil];
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    NSString *randomName = [NSString stringWithFormat:@"%@%@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    NSString *randomTitle = [NSString stringWithFormat:@"%@%@",
                            [ randomNounList objectAtIndex:adjectiveIndex],
                            [ randomAdjectiveList objectAtIndex:nounIndex]];
    return [[TopicsList alloc] initWithUniqueId: rand() % 10000
                                   lastDeleted:now
                                          descr:randomName
                                          title:randomTitle
                                        deleted: FALSE
                                        created:now
                                      itemOrder: @"[]"
                                       priority:1
                                       numItems:1
                                   lastModified:now
                                     numChecked:0
                                         hidden:0];
}

+ (NSArray*) scheme
{
    return [NSArray arrayWithObjects:@"lastdeleted",@"description", @"title", @"deleted",@"timeofcreation",
            @"itemsorder", @"priority", @"numItems", @"lastmodified", @"numChecked", @"hidden", @"id",nil];
}

@end
