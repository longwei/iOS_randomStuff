//
//  FailedBankDatabase.h
//  FailedBanks
//
//  Created by longwei su on 7/11/13.
//  Copyright (c) 2013 Longwei Su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface FailedBankDatabase : NSObject
{
    sqlite3* _database;
}

+(FailedBankDatabase*) database;
-(NSArray*) failedBankInfos;
@end
