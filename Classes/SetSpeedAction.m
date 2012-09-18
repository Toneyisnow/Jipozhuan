//
//  SetSpeedAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-24.
//  Copyright 2011 ms. All rights reserved.
//

#import "SetSpeedAction.h"


@implementation SetSpeedAction

-(id) initWithSpeedX:(float)x Y:(float)y {
	
	self = [super init];
	speedX = x;
	speedY = y;
	return self;
}

+(id) actionWithSpeedX:(float)x Y:(float)y {
	
	return [[self alloc] initWithSpeedX:x Y:y];
}

-(void) execute:(Character *)character {
	
	[character setSpeedX:speedX Y:speedY];
}

@end
