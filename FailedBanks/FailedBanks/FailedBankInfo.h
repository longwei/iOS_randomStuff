//
//  FailedBankInfo.h
//  FailedBanks
//
//  Created by longwei su on 7/11/13.
//  Copyright (c) 2013 Longwei Su. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FailedBankInfo : NSObject
{
    int _uniqueID;
    NSString* _name;
    NSString* _city;
    NSString* _state;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;

- (id)initWithUniqueId:(int)uniqueId name:(NSString *)name city:(NSString *)city
                 state:(NSString *)state;

@end
