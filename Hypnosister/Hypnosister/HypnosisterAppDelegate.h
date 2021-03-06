//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by longwei su on 3/14/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisterView.h"

@class HypnosisterViewController;

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnosisterView* view;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HypnosisterViewController *viewController;

@end
