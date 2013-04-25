//
//  HypnosisterView.m
//  Hypnosister
//
//  Created by longwei su on 3/14/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "HypnosisterView.h"

@implementation HypnosisterView

@synthesize circleColor;

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    return self;	
}

-(void) drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2;
    center.y = bounds.origin.y + bounds.size.height/2;
    
    float MaxRadius = hypotf(bounds.size.width, bounds.size.height) / 2.0;
    CGContextSetLineWidth(ctx, 10);
//    CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    [circleColor setStroke];
    
    for(float currentRadius = MaxRadius; currentRadius > 0; currentRadius -=20){
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(ctx);
    }
    NSString* text = @"getting sleepy";
    UIFont *font = [UIFont boldSystemFontOfSize:20];
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width/2.0;
    textRect.origin.y = center.y - textRect.size.height/2.0;
    [[UIColor blackColor] setFill];
    CGSize offset = CGSizeMake(4,3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    [text drawInRect:textRect withFont:font];
}

-(BOOL) canBecomeFirstResponder
{
    return YES;
}

-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];//position of this message dont matter? it seems to be.
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"shaking");
        [self setCircleColor:[UIColor redColor]];
    }
}

@end
