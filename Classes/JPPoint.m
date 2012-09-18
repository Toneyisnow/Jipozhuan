//
//  JPPoint.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-6.
//  Copyright 2011 ms. All rights reserved.
//

#import "JPPoint.h"


@implementation JPPoint

@synthesize value;

+(JPPoint *) new:(CGPoint)val {

	JPPoint *p = [[JPPoint alloc] init];
	p.value = val;
	return p;
}

-(CGPoint) getCGPoint {

	return value;
}

@end
