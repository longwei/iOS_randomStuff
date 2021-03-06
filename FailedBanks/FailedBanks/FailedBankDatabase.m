//
//  FailedBankDatabase.m
//  FailedBanks
//
//  Created by longwei su on 7/11/13.
//  Copyright (c) 2013 Longwei Su. All rights reserved.
//

#import "FailedBankDatabase.h"
#import "FailedBankDatabase.h"
#import "FailedBankInfo.h"

@implementation FailedBankDatabase

static FailedBankDatabase* _database;


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


+ (FailedBankDatabase*)database {
    if (_database == nil) {
        _database = [[FailedBankDatabase alloc] init];
    }
    return _database;
}

- (NSArray *)failedBankInfos {
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT id, name, city, state FROM failed_banks ORDER BY close_date DESC";
    sqlite3_stmt *statement;
    if (sqlite3_prepare(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *stateChars = (char *) sqlite3_column_text(statement, 3);
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *city = [[NSString alloc] initWithUTF8String:cityChars];
            NSString *state = [[NSString alloc] initWithUTF8String:stateChars];
            FailedBankInfo *info = [[FailedBankInfo alloc]
                                    initWithUniqueId:uniqueId name:name city:city state:state];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

@end