//
//  GameStatistics.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-23.
//  Copyright 2011 ms. All rights reserved.
//

#import "GameStatistics.h"

static GameStatistics *_instance;

@implementation GameStatistics

@synthesize level, scoreTotal, scoreGained, countTotal, countGained;
@synthesize heroPerfect, shockwavUsed;

-(id) init {

	self = [super init];
	
	level = 0;
	scoreTotal = 0;
	scoreGained = 0;
	
	countTotal = 0;
	countGained = 0;
	
	heroPerfect = TRUE;
	shockwavUsed = FALSE;
	
	return self;
}

+(GameStatistics *) instance {

	if (_instance == nil) {
		_instance = [[GameStatistics alloc] init];
	}
	return _instance;
}

+(void) newInstance {
	_instance = [[GameStatistics alloc] init];
}

+(void) clearInstance {

	[_instance release];
	_instance = nil;
}


@end
