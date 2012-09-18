//
//  Foreground.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-1.
//  Copyright 2011 ms. All rights reserved.
//

#import "Foreground.h"
#import "AnimatedCharacter.h"
#import "GameConfig.h"
#import "Game.h"

@implementation Foreground

-(id) initWithScreen:(ForegroundLayer *)layer AlertLayer:(AlertLayer *)alert Game:(id)game {

	self = [super init];
	foregroundLayer = layer;
	alertLayer = alert;
	
	[foregroundLayer setController:((Game *)game)];
	
	leftHeroCount = 0;
	leftShockwaveCount = 0;
	leftHeroes = [[NSMutableArray alloc] init];
	leftShockwaves = [[NSMutableArray alloc] init];
	return self;
}

-(void) setLeftHero:(int) count {
	leftHeroCount = count;
}

-(void) setLeftShockwave:(int) count {
	leftShockwaveCount = count;
}

-(void) onShow {

	[self showLeftHeroes];
	[self showControllers];
}

-(void) onHide {
	
	[foregroundLayer removeControllers];
	
	for(int i = [leftHeroes count] - 1; i >= 0; i--) {
		AnimatedCharacter *ch = [leftHeroes objectAtIndex:i];
		[ch removeFromCurrentScene];
		[leftHeroes removeObjectAtIndex:i];
	}	
}

-(void) showLeftHeroes {

	for(int i = [leftHeroes count] - 1; i >= 0; i--) {
		AnimatedCharacter *ch = [leftHeroes objectAtIndex:i];
		[ch removeFromCurrentScene];
		[leftHeroes removeObjectAtIndex:i];
	}
	
	for(int i = 0; i < leftHeroCount; i++) {
		AnimatedCharacter *ch = [[AnimatedCharacter alloc] initWithChar:@"击" Size:15];
		[ch setColor:[Color R:80 G:0 B:0]];
		[ch setPositionX:(30 + 15 * i) Y:300];
		[ch addToScene:foregroundLayer];
		[leftHeroes addObject:ch];
	}
}

-(void) showLeftShockwave {

	for(int i = [leftShockwaves count] - 1; i >= 0; i--) {
		AnimatedCharacter *ch = [leftShockwaves objectAtIndex:i];
		[ch removeFromCurrentScene];
		[leftShockwaves removeObjectAtIndex:i];
	}
	
	for(int i = 0; i < leftShockwaveCount; i++) {
		AnimatedCharacter *ch = [[AnimatedCharacter alloc] initWithChar:@"破" Size:15];
		[ch setColor:[Color R:0 G:50 B:0]];
		[ch setPositionX:(30 + 15 * i) Y:280];
		[ch addToScene:foregroundLayer];
		[leftShockwaves addObject:ch];
	}
}

-(void) showControllers {

	[foregroundLayer initControllers];
}

-(void) showAlert {
	
	alertLayer.visible = TRUE;
	alertLayer.isTouchEnabled = YES;
}

-(void) hideAlert {

	alertLayer.visible = FALSE;
	alertLayer.isTouchEnabled = NO;
}

-(void) showAlert:(Character *)msg {
		
	[msg setPositionX:(GAME_SCREEN_WIDTH/2) Y:(GAME_SCREEN_HEIGHT/2)];
	[msg addToScene:foregroundLayer];
	
	/*
	message = [[AnimatedCharacter alloc] initWithChar:messageString Size:80];
	[message setColor:[Color R:0 G:0 B:0]];
	[message setPositionX:(GAME_SCREEN_WIDTH/2) Y:(GAME_SCREEN_HEIGHT/2)];
	[message addToScene:alertLayer];
	 */
}

-(void) dealloc {
	
	[leftHeroes dealloc];
	[leftShockwaves dealloc];
	[super dealloc];
}


@end
