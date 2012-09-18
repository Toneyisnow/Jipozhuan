//
//  SlowDownAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-25.
//  Copyright 2011 ms. All rights reserved.
//

#import "SlowDownAction.h"


@implementation SlowDownAction

-(id) initWithRate:(float)r {

	self = [super init];
	rate = r;
	
	if (rate >= 1 || rate < 0) {
		NSLog(@"[SlowDownAction] Rate should be in [0, 1)");
	}
	
	return self;
}

+(id) actionWithRate:(float)r {
	return [[self alloc] initWithRate:r];
}

-(void) execute:(Character *)character {

	//SolidCharacter *sch = (SolidCharacter)character;
	//if (sch == nil) {
	//	return;
	//}
	CGPoint v = [character getSpeed];
	[character setSpeedX:v.x*rate Y:v.y*rate];
}

-(BOOL) hasFinished:(Character *)character {
	
	CGPoint v = [character getSpeed];
	return (((v.x > -10) && (v.x < 10)) &&
			((v.y > -10) && (v.y < 10)));
}


@end
