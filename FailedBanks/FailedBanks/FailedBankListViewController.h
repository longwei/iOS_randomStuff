//
//  FailedBankListViewController.h
//  FailedBanks
//
//  Created by longwei su on 7/12/13.
//  Copyright (c) 2013 Longwei Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FailedBankListViewController : UIViewController
{
    NSArray* _failedBankInfos;
}
@property (nonatomic, retain) NSArray *failedBankInfos;
@end
