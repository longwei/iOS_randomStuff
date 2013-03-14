//
//  HypnosisterView.m
//  Hypnosister
//
//  Created by longwei su on 3/14/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "HypnosisterView.h"

@implementation HypnosisterView

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
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
    CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    
    for(float currentRadius = MaxRadius; currentRadius > 0; currentRadius -=20){
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(ctx);
    }
}
@end
