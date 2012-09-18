//
//  FlapAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-28.
//  Copyright 2011 ms. All rights reserved.
//

#import "FlapAction.h"


@implementation FlapAction

-(id) initWithRate:(float)r To:(float)t {
	
	self = [super init];
	rate = (r > 1)||(r < 0) ? 1: r;
	minScale = (t > 1)||(t < 0) ? 1: t;
	
	return self;
}

+(id) actionWithRate:(float)r To:(float)t {
	
	return [[self alloc] initWithRate:r To:t];
}

-(void) execute:(Character *)character {
	
	character.ccLabel.scaleY -= rate;
	
	if(character.ccLabel.scaleY < minScale) {
		character.ccLabel.scaleY = minScale;
		rate = -rate;
	}
	
	if(character.ccLabel.scaleY > 1) {
		character.ccLabel.scaleY = 1;
		rate = -rate;
	}
}

-(BOOL) hasFinished:(Character *)character {
	return FALSE;
}

@end
