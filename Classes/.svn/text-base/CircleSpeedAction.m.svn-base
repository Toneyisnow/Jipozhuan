//
//  CircleSpeedAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-20.
//  Copyright 2011 ms. All rights reserved.
//

#import "CircleSpeedAction.h"
#import "Constants.h"
#import "GameConfig.h"
#import "JPPoint.h"

static NSMutableDictionary *dictionary;



@implementation CircleSpeedAction

-(id) initWithRate:(float)r Duration:(float)du {
	
	self = [super init];
	rate = r;
	durationTick = du * GAME_FPS;
	if (dictionary == nil) {
		dictionary = [[NSMutableDictionary alloc] init];
	}
	return self;
}

+(id) actionWithRate:(float)r Duration:(float)du {
	
	return [[self alloc] initWithRate:r Duration:du];
}

-(void) execute:(Character *)character {
	
	durationTick --;
	if (durationTick % 2 == 1) {
		
		JPPoint *speed = [dictionary objectForKey:[self getHashA:[character getSpeed].x B:[character getSpeed].y C:rate]];
		if (speed == nil) {
			speed = [JPPoint new:[self calculateNext:character]];
			[dictionary setValue:speed forKey:[self getHashA:[character getSpeed].x B:[character getSpeed].y C:rate]];
		}

		[character setSpeedX:[speed getCGPoint].x Y:[speed getCGPoint].y];
	}
}

-(NSString *) getHashA:(float)a B:(float)b C:(float)c {
	return [NSString stringWithFormat:@"%f", (a * 1000 + b) * 1000 + c];
}

-(CGPoint) calculateNext:(Character *)character {
	float speedX = [character getSpeed].x;
	float speedY = [character getSpeed].y;
	
	float dx = speedY * rate;
	float dy = -speedX * rate;
	
	float radio = sqrt(1.0 + rate*rate);
	speedX = (speedX + dx) / radio;
	speedY = (speedY + dy) / radio;
	
	return CGPointMake(speedX, speedY);
}

-(BOOL) hasFinished:(Character *)character {
	
	return (durationTick <= 0);
}

@end
