//
//  GameControlLayer.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-28.
//  Copyright 2011 ms. All rights reserved.
//

#import "AlertLayer.h"
#import "GameConfig.h"
#import "Game.h"

@implementation AlertLayer

-(id) init
{
	// Apple recommends to re-assign "self" with the "super" return value
	if((self=[super init])) {
		
		self.isTouchEnabled = NO;
		[self initContent];
		self.visible = FALSE;
	}
	return self;
}

-(void) initContent {

	CCSprite *sprite = [CCSprite node];
	sprite.textureRect = CGRectMake(0, 0, GAME_SCREEN_WIDTH, GAME_SCREEN_HEIGHT);
	
	CCLabelTTF *label = [CCLabelTTF labelWithString:@"游戏暂停" fontName:@"Marker Felt" fontSize:80];
	label.position =  ccp(GAME_SCREEN_WIDTH/2, GAME_SCREEN_HEIGHT * 0.7);
	label.color = ccc3(255, 255, 255);
	
	[CCMenuItemFont setFontSize:35];
	CCMenuItemFont *item1 = [CCMenuItemFont itemFromString: @"继续" target:self selector:@selector(onContinue)];
	CCMenuItemFont *item2 = [CCMenuItemFont itemFromString: @"退出" target:self selector:@selector(onGameEnd)];
	CCMenu *menu = [CCMenu menuWithItems: item1, item2, nil];
	
	[menu alignItemsVertically];
	//[menu alignItemsInRows:[NSNumber numberWithInt:1]];
	menu.position = ccp(GAME_SCREEN_WIDTH/2, GAME_SCREEN_HEIGHT /4);
	
	[self addChild:label];
	[self addChild: menu];
}

-(void) setTarget:(id) t {

	target = t;
}

-(void) ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	
	NSLog(@"Alert Layer Clicked");
	/*
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
	*/
	//[self controllerPressed: convertedLocation];
}


-(void) onContinue {
	
	if (!self.visible) {
		return;
	}
	
	Game *game = (Game *)target;
	
	if (game != nil) {
		[game gameResume];
	}
	self.visible = FALSE;
	self.isTouchEnabled = NO;
}

-(void) onGameEnd {
	
	if (!self.visible) {
		return;
	}
	
	Game *game = (Game *)target;
	
	if (game != nil) {
		[game gameEnd];
	}
	
}

@end

