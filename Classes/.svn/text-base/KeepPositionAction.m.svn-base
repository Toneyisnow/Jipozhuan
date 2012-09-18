//
//  KeepPositionAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-4-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "KeepPositionAction.h"


@implementation KeepPositionAction

-(id) initWithRect:(CGRect) r {

	self = [super init];
	rect = r;
	
	return self;
}

+(id) actionWithRect:(CGRect) r {

	return [[self alloc] initWithRect:r];
}

-(void) execute:(Character *)character {
	
	CGPoint currentPosition = [character getPosition];
	float posX = currentPosition.x;
	float posY = currentPosition.y;
	
	if (posX < rect.origin.x) {
		posX = rect.origin.x;
	}
	if (posY < rect.origin.y) {
		posY = rect.origin.y;
	}
	if (posX > rect.origin.x+rect.size.width) {
		posX = rect.origin.x+rect.size.width;
	}
	if (posY > rect.origin.y+rect.size.height) {
		posY = rect.origin.y+rect.size.height;
	}
	
	[character setPositionX:posX Y:posY];
}

@end
