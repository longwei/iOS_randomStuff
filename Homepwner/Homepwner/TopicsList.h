//
//  TopicsList.h
//  Homepwner
//
//  Created by longwei su on 7/23/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicsList : NSObject
{

}
//@property (nonatomic, assign) int uniqueId;
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *city;
//@property (nonatomic, copy) NSString *state;

@property (nonatomic, assign)int uniqueId;
@property (nonatomic, copy)NSDate* lastDeleted;
@property (nonatomic, copy)NSString* descr;
@property (nonatomic, copy)NSString* title;
@property (nonatomic, assign)int deleted;
@property (nonatomic, copy)NSDate* created;
@property (nonatomic, copy)NSString* itemOrder;
@property (nonatomic, assign)int priority;
@property (nonatomic, assign)int numItems;
@property (nonatomic, copy)NSDate* lastModified;
@property (nonatomic, assign)int numChecked;
@property (nonatomic, assign)int hidden;


- (id)initWithUniqueId:(int)p_uniqueId
          lastDeleted:(NSDate*) p_lastDetected
           descr:(NSString*) p_description
                 title:(NSString*) p_title
               deleted: (Boolean) p_deleted
               created: (NSDate*) p_created
             itemOrder: (NSString*) p_itemOrder
              priority: (int) p_priority
              numItems: (int) p_numItems
          lastModified: (NSDate*) p_lastModified
            numChecked: (int) numChecked
                hidden: (int) p_hidden;
+ (id) randomItem;

+ (NSArray*) scheme;
@end
