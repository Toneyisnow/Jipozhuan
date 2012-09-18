//
//  ChasingAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "ChasingAction.h"
#import "Hero.h"
#import "Common.h"
#import "GameConfig.h"

@implementation ChasingAction

-(id) initWithParam:(float)param Duration:(float)du {
	
	self = [super init];
	baseSpeed = param;
	durationTick = du * GAME_FPS;
	return self;
}

+(id) actionWithParam:(float)param Duration:(float)du {
	
	return [[self alloc] initWithParam:param Duration:du];
}

-(void) execute:(Character *)character {
	
	Hero *hero = [Hero getCurrentHero];
	float vx = [hero getPosition].x - [character getPosition].x;
	float vy = [hero getPosition].y - [character getPosition].y;
	
	float total = abs(vx) + abs(vy);
	float dx = baseSpeed * vx / total;
	float dy = baseSpeed * vy / total;
	
	[character changeSpeedDX:dx DY:dy];
	
	durationTick --;
}

-(BOOL) hasFinished:(Character *)character {
	
	// We need to set a minimum distance to hero that to stop this action
	return ([self distanceToHero:character] <= 100 || durationTick <= 0);
}

-(float) distanceToHero:(Character *)character {
	
	Hero *hero = [Hero getCurrentHero];
	float vx = [hero getPosition].x - [character getPosition].x;
	float vy = [hero getPosition].y - [character getPosition].y;
	float distance = abs(vx) + abs(vy);
	return distance;
}
@end
