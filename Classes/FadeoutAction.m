//
//  FadeoutAction.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-23.
//  Copyright 2011 ms. All rights reserved.
//

#import "FadeoutAction.h"


@implementation FadeoutAction

-(id) initWithRate:(float)r {

	self = [super init];
	rate = r;
	return self;
}

+(id) actionWithRate:(float)r {

	return [[self alloc] initWithRate:r];
}

-(void) execute:(Character *)character {

	float opacity = character.ccLabel.opacity *= rate;
	
	if (opacity > 255) {
		opacity = 255;
	}
	if (opacity < 0) {
		opacity = 0;
	}
	
	character.ccLabel.opacity = opacity;
}

-(BOOL) hasFinished:(Character *)character {
	return character.ccLabel.opacity <= 1 || character.ccLabel.opacity >= 255;
}

@end
