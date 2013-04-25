//
//  OpenGLAppDelegate.h
//  HelloOpenGL
//
//  Created by longwei su on 3/21/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@class OpenGLViewController;

@interface OpenGLAppDelegate : UIResponder <UIApplicationDelegate, GLKViewDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OpenGLViewController *viewController;

@end
