//
//  SetScaleAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-4-12.
//  Copyright 2011 ms. All rights reserved.
//

#import "SetScaleAction.h"


@implementation SetScaleAction

-(id) initWithScaleX:(float)x ScaleY:(float)y {

	self = [super init];
	
	scaleX = x;
	scaleY = y;
	
	return self;
}

+(id) actionWithScaleX:(float)x ScaleY:(float)y {

	return [[self alloc] initWithScaleX:x ScaleY:y];
}

-(void) execute:(Character *)character {

	[character setScaleX:scaleX Y:scaleY];
}

@end
