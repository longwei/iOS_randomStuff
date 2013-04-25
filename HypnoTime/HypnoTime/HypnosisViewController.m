//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by longwei su on 3/15/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisterView.h"

@implementation HypnosisViewController


-(id) initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    self = [super initWithNibName:nil bundle:nil];
    if(self){
        UITabBarItem* tbi = [self tabBarItem];
        [tbi setTitle:@"Hypnosis"];
        UIImage* i = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:i];
    }
    return self;
}
-(void) loadView
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    HypnosisterView *v = [[HypnosisterView alloc] initWithFrame:rect];
    [self setView:v];
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"hypnosis view loaded");
}

@end
