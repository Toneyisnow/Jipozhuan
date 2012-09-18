//
//  AlertController.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-28.
//  Copyright 2011 ms. All rights reserved.
//

#import "AlertController.h"
#import "GameConfig.h"
#import "Game.h"

@implementation AlertController

-(id) init {
	
	NSLog(@"Init AlertController");
	
	self = [super initWithChar:@"X" Size:10];
	centralLocation.x = GAME_SCREEN_WIDTH - 20;
	centralLocation.y = GAME_SCREEN_HEIGHT - 20;
	
	[self setPositionX:centralLocation.x Y:centralLocation.y];
	[self setColor:[Color R:255 G:255 B:255 A:1]];
	[self setRadio:10.0];
	return self;
}

-(void) setTarget:(id)t {
	
	target = t;
}

-(void) pressed:(CGPoint) location {
	
	if (![self isClickedOn:location]) {
		return;
	}
	
	NSLog(@"Alert Controller Pressed.");
	Game *game = (Game *)target;
	
	if (game != nil) {
		[game gamePause];
	}
}

-(bool) isClickedOn:(CGPoint) location {
	
	float r = 10;
	return (abs(centralLocation.x - location.x) <= r && abs(centralLocation.y - location.y) <= r);
}

@end
