//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by longwei su on 5/3/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "HeavyViewController.h"

//@interface HeavyViewController ()
//
//@end

@implementation HeavyViewController

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)x
{
    return (x == UIInterfaceOrientationMaskPortrait) ||  UIInterfaceOrientationIsLandscape(x);
    
}

@end
