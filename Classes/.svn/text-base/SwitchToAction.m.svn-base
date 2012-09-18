//
//  SwitchToAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-29.
//  Copyright 2011 ms. All rights reserved.
//

#import "SwitchToAction.h"


@implementation SwitchToAction


-(id) initWithChar:(NSString *)ch Rate:(float)r {

	self = [super init];
	newChar = ch;
	rate = r;
	return self;
}

+(id) actionWithChar:(NSString *)ch Rate:(float)r {

	return [[self alloc] initWithChar:ch Rate:r];
}

-(void) execute:(Character *)character {
	
	character.ccLabel.scaleX -= rate;
	
	if(character.ccLabel.scaleX < 0) {
		character.ccLabel.scaleX = 0;
		[character setCharacter:newChar];
		rate = -rate;
	}
	if(character.ccLabel.scaleX > 1) {
		character.ccLabel.scaleX = 1;
	}
}

-(BOOL) hasFinished:(Character *)character {
	return (character.ccLabel.scaleX == 1) && rate <= 0;
}


@end
