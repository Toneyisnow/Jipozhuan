//
//  AnimatedCharacter.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-29.
//  Copyright 2011 ms. All rights reserved.
//

#import "AnimatedCharacter.h"


@implementation AnimatedCharacter

-(id) initWithChar:(NSString *)ch Size:(float)size {

	self = [super initWithChar:ch Size:size];
	
	currentCurve = nil;
	defaultCurve = nil;
	beep = 0;
	
	return self;
}

-(Curve *) getCurrentCurve {
	return currentCurve;
}

-(void) setDefaultCurve:(Curve *)curve {
	
	defaultCurve = curve;
	currentCurve = curve;
}

-(void) takeTick:(int)tick {
	
	beep ++;
	if (currentCurve != nil) {
		[currentCurve takeTick:tick target:self];
	}
}

-(void) release {
	
	[defaultCurve release];
	[super release];
}

@end
