//
//  WillExplodeAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-21.
//  Copyright 2011 ms. All rights reserved.
//

#import "WillExplodeAction.h"
#import "GameConfig.h"
#import "Enemy.h"

@implementation WillExplodeAction

-(id) initWithWaitTime:(float)t {

	self = [super init];
	waitTick = t * GAME_FPS;
	
	return self;
}

+(id) actionWithWaitTime:(float)t {
	return [[self alloc] initWithWaitTime:t];
}

-(void) execute:(Character *)character {

	waitTick --;
	if (waitTick == 0) {
		Enemy *enemy = (Enemy *)character;
		[enemy onExplode];
	}
}

-(BOOL) hasFinished:(Character *)character {
	return FALSE;
}

@end
