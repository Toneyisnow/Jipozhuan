//
//  ExplodeAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-21.
//  Copyright 2011 ms. All rights reserved.
//

#import "ExplodeAction.h"
#import "Enemy.h"
#import "AnimatedCharacter.h"
#import "FadeoutAction.h"
#import "Curve.h"
#import "Common.h"
#import "Color.h"
#import "GameConfig.h"

@implementation ExplodeAction

-(id) initWithString:(NSString *)ch Size:(int)s {

	self = [super init];
	str = ch;
	size = s;
	tick = 0;
	return self;
}

+(id) actionWithString:(NSString *)ch Size:(int)s {

	return [[self alloc] initWithString:ch Size:s];
}

-(void) execute:(Character *)character {
	
	if ([self isOutOfScreen:character]) {
		return;
	}
	tick ++;
	if(tick % 3 == 1) {
		
		Enemy *craft = (Enemy *)character;
		
		AnimatedCharacter *explode1 = [self generateExplodeChar:character];
		[craft addComposedItem:explode1];
		
		AnimatedCharacter *explode2 = [self generateExplodeChar:character];
		[craft addComposedItem:explode2];
		
		AnimatedCharacter *explode3 = [self generateExplodeChar:character];
		[craft addComposedItem:explode3];
	}

}

-(BOOL) hasFinished:(Character *)character {

	return FALSE;
}

-(BOOL) isOutOfScreen:(Character *) ch {

	CGPoint pos = [ch getPosition];
	
	return !(pos.x > 0 && pos.x < GAME_SCREEN_WIDTH 
		 && pos.y > 0 && pos.y < GAME_SCREEN_HEIGHT);
}

-(AnimatedCharacter *) generateExplodeChar:(Character *)character {
	
	AnimatedCharacter *explode = [[AnimatedCharacter alloc] initWithChar:str Size:size];
	[explode setColor:[Color R:255 G:70 B:50]];
	[explode setOpacity:30];
	[explode setPositionX:[character getPosition].x Y:[character getPosition].y];
	[explode setSpeedX:[Common getRandomFrom:-150 To:150] Y:[Common getRandomFrom:-150 To:150]];
	
	Curve *curve = [[Curve alloc] init];
	FadeoutAction *action0 = [FadeoutAction actionWithRate:1.2];
	//SlowDownAction *action1 = [SlowDownAction actionWithRate:0.4];
	[curve addAction:action0 Tick:0];
	//[curve addAction:action1 Tick:0];
	[curve setTimeoutTime:0.7];
	[explode setDefaultCurve:curve];
	
	return explode;
}



@end
