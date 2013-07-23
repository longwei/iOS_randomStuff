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
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"banklist"
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

- (NSArray *)topicsListInfos {
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT id, name, city, state FROM failed_banks ORDER BY close_date DESC LIMIT 10";
    sqlite3_stmt *statement;
    NSLog(@"infos");
    if (sqlite3_prepare(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSLog(@"infos");
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *stateChars = (char *) sqlite3_column_text(statement, 3);
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *city = [[NSString alloc] initWithUTF8String:cityChars];
            NSString *state = [[NSString alloc] initWithUTF8String:stateChars];
            TopicsList *info = [[TopicsList alloc]
                                    initWithUniqueId:uniqueId name:name city:city state:state];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}
@end