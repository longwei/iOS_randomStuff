//
//  FailedBankAppDelegate.h
//  FailedBanks
//
//  Created by longwei su on 7/11/13.
//  Copyright (c) 2013 Longwei Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FailedBankViewController;

@interface FailedBankAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    UINavigationController *_navController;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) FailedBankViewController *viewController;

@end
