//
//  GameScene.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-17.
//  Copyright 2011 ms. All rights reserved.
//

#import "MainGameScene.h"
#import "Game.h"

static MainGameScene *instance;

@implementation MainGameScene

@synthesize mainGameLayer;
@synthesize foregroundLayer;
@synthesize backgroundLayer, backdropLayer, alertLayer;


-(id) initScene {

	self = [MainGameScene node];
	mainGameLayer = [MainGameLayer node];
	backgroundLayer = [BackgroundLayer node];
	backdropLayer = [ContainerLayer node];
	foregroundLayer = [ForegroundLayer node];
	alertLayer = [AlertLayer node];
	
	// add layer as a child to scene
	[self addChild: backdropLayer];
	[self addChild: backgroundLayer];
	[self addChild: mainGameLayer];
	[self addChild: foregroundLayer];
	[self addChild: alertLayer];
	
	gameInstance = [[Game alloc] initWithScene: self];
	[CCDirector sharedDirector].notificationNode = gameInstance;
	
	return self;
}

+(void) releaseDistance {

	if(instance != nil) {
		[instance release];
		instance = nil;
	}	
}

+(MainGameScene *) scene
{
	// 'scene' is an autorelease object.
	
	if(instance == nil) {
		instance = [[MainGameScene alloc] initScene];
		[instance gameStart];
	}	
	// return the scene
	return instance;
}

-(void) gameStart {

	[(Game *)gameInstance gameStart];
}

-(void) tick: (ccTime) dt
{
	//NSLog(@"Scene tick");
    Game *game = (Game *)gameInstance;
	if (game != nil) {
		[game tick];
	}
}

@end
