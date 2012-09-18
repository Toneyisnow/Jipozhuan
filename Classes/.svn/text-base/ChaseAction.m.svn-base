//
//  ChaseAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "ChaseAction.h"
#import "Hero.h"
#import "Common.h"

@implementation ChaseAction

-(id) initWithParam:(float)param {

	self = [super init];
	baseSpeed = param;
	return self;
}

+(id) actionWithParam:(float)param {
	
	return [[self alloc] initWithParam:param];
}

-(void) execute:(Character *)character {

	Hero *hero = [Hero getCurrentHero];
	float vx = [hero getPosition].x - [character getPosition].x;
	float vy = [hero getPosition].y - [character getPosition].y;
	
	vx += [Common getRandomFrom:-50 To:50];
	vy += [Common getRandomFrom:-50 To:50];
	
	float total = abs(vx) + abs(vy);
	float dx = baseSpeed * vx / total;
	float dy = baseSpeed * vy / total;
	
	[character setSpeedX:dx Y:dy];
}

@end
