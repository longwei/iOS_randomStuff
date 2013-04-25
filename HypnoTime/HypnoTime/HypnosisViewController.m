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
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisterView *v = [[HypnosisterView alloc] initWithFrame:frame];
    
    NSArray* colorOptions = [[NSArray alloc]initWithObjects:@"Red",@"Green",@"Blue", nil];
    UISegmentedControl* colorChange = [[UISegmentedControl alloc] initWithItems:colorOptions];
    CGPoint centerPoint;
    centerPoint.x = frame.size.width/2;
    centerPoint.y = frame.size.height /5*4;
    [colorChange setCenter:centerPoint];
    [self setView:v];
    [v addSubview:colorChange];
    [colorChange addTarget:v action:@selector(colorChangedButtons:)
          forControlEvents:UIControlEventValueChanged];
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"hypnosis view loaded");
}

@end
