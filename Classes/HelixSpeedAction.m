//
//  HelixSpeedAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-13.
//  Copyright 2011 ms. All rights reserved.
//

#import "HelixSpeedAction.h"
#import "Constants.h"

@implementation HelixSpeedAction

-(id) initWithRate:(float)r Duration:(float)du {

	self = [super init];
	rate = r;
	durationTick = du * [Constants gameFPS];
	return self;
}

+(id) actionWithRate:(float)r Duration:(float)du {

	return [[self alloc] initWithRate:r Duration:du];
}

-(void)execute:(Character *)character {

	durationTick --;
	
	if (durationTick % 2 == 1) {
		float speedX = [character getSpeed].x;
		float speedY = [character getSpeed].y;
	
		float dx = speedY * rate;
		float dy = -speedX * rate;
		[character changeSpeedDX:dx DY:dy];
	}
	
	rate *= 1.015;
}

-(BOOL) hasFinished:(Character *)character {
	return (durationTick <= 0);
}

@end
