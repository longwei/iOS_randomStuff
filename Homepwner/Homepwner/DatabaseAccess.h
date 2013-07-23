//
//  DatabaseAccess.h
//  Homepwner
//
//  Created by longwei su on 7/23/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DatabaseAccess : NSObject
{
    sqlite3* _database;
}

+(DatabaseAccess*) database;
-(NSMutableArray*) topicsListInfos;
@end