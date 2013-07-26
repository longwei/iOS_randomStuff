//
//  DatabaseAccess.m
//  Homepwner
//
//  Created by longwei su on 7/23/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "DatabaseAccess.h"
#import "TopicsList.h"

@implementation DatabaseAccess

static DatabaseAccess* _database;


-(id) init
{
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"topics"
                                                             ofType:@"sqlite3"];
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}


+ (DatabaseAccess*)database {
    if (_database == nil) {
        _database = [[DatabaseAccess alloc] init];
    }
    return _database;
}

- (NSMutableArray *)readAllFromLocal {
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT lastdetected, description, title, deleted, timeofcreation, itemsorder, priority, numItems, lastmodified, numChecked, hidden, id FROM topics_lists";
    sqlite3_stmt *statement;
    if (sqlite3_prepare(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
//            int uniqueId = sqlite3_column_int(statement, 0);
            char *c_lastdeleted = (char *) sqlite3_column_text(statement, 0);
            char *c_descr       = (char *) sqlite3_column_text(statement, 1);
            char *c_title       = (char *) sqlite3_column_text(statement, 2);
            int deleted         = sqlite3_column_int(statement, 3);
            char *c_timeofcreation= (char *) sqlite3_column_text(statement, 4);
            char *c_itemsorder    = (char *) sqlite3_column_text(statement, 5);
            int priority        = sqlite3_column_int(statement, 6);
            int numItems        = sqlite3_column_int(statement, 7);
            char *c_lastmodified  = (char *) sqlite3_column_text(statement, 8);
            int numChecked      = sqlite3_column_int(statement, 9);
            int hidden          = sqlite3_column_int(statement, 10);
            int uniqueId        = sqlite3_column_int(statement, 11);
            
            NSString *description = [[NSString alloc] initWithUTF8String:c_descr];
            NSString *title = [[NSString alloc] initWithUTF8String:c_title];
            NSString *itemsorder = [[NSString alloc] initWithUTF8String:c_itemsorder];
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"YYYY-MM-DDTHH:MM:SSZ"];
            NSDate *lastdeleted = [format dateFromString:[[NSString alloc] initWithUTF8String:c_lastdeleted]];
            NSDate *timeofcreation = [format dateFromString:[[NSString alloc] initWithUTF8String:c_timeofcreation]];
            NSDate *lastmodified = [format dateFromString:[[NSString alloc] initWithUTF8String:c_lastmodified]];
            
            TopicsList *info = [[TopicsList alloc]initWithUniqueId: uniqueId lastDeleted:lastdeleted
                                descr:description title:title
                                deleted:deleted created:timeofcreation itemOrder:itemsorder
                                priority:priority numItems:numItems lastModified:lastmodified
                                numChecked:numChecked hidden:hidden];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    } else {
        NSLog(@"Error %s while preparing statement", sqlite3_errmsg(_database));
    }
    
    return retval;
    
}
@end