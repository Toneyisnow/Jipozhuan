//
//  SwingAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-28.
//  Copyright 2011 ms. All rights reserved.
//

#import "SwingAction.h"


@implementation SwingAction

-(id) initWithAxis:(int)a Central:(float)c Rate:(float)r {

	self = [super init];
	axis = a;
	central = c;
	swingRate = r;
	initial = TRUE;
	
	temp = 0;
	
	return self;
}

+(id) actionWithAxis:(int)a Central:(float)c Rate:(float)r {
	return [[self alloc] initWithAxis:a Central:c Rate:r];
}

-(void) execute:(Character *)character {
	
	float speedX = [character getSpeed].x;
	float speedY = [character getSpeed].y;
	
	if (axis == 0) {
		float posX = [character getPosition].x;
		if (initial && posX != 0) {
			
			//NSLog(@"PosY: %f", posY);
			central += posX;
			//NSLog(@"CentralY: %f", centralY);
			initial = FALSE;
		}
		
		float delta = (central - posX) * swingRate;
		[character setSpeedX:(speedX + delta) Y:speedY]; 
	}
	else {
		float posY = [character getPosition].y;
		if (initial && posY != 0) {
			
			//NSLog(@"PosY: %f", posY);
			central += posY;
			//NSLog(@"CentralY: %f", centralY);
			initial = FALSE;
		}
		
		float delta = (central - posY) * swingRate;
		[character setSpeedX:speedX Y:(speedY + delta)]; 
	}

	
}

-(BOOL) hasFinished:(Character *)character {
	return FALSE;
}

@end
