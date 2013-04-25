//
//  TimeViewController.h
//  HypnoTime
//
//  Created by longwei su on 4/24/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
    IBOutlet UILabel* timeLabel;
}
-(IBAction)showCurrentTime:(id)sender;

@end
