//
//  TrophyScene.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-14.
//  Copyright 2011 ms. All rights reserved.
//

#import "TrophyScene.h"
#import "HomePageScene.h"
#import "GameState.h"
#import "AudioEngine.h"
#import "LocalString.h"

@implementation TrophyScene

+(id) scene:(int)lev
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	TrophyScene *layer = [TrophyScene node];
	//[layer setLevel:lev];
	[layer displayWithMode:lev];
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		[GameState loadGameStateFromFile];
	}
	return self;
}

-(void) setLevel:(int)lev {

	//level = lev;
}

-(void) displayWithMode:(int)level {

	GameState *gameState = [GameState gameState];
	BOOL trophy_ji   = (level == 0)? gameState.level0_ji   : gameState.level1_ji;
	BOOL trophy_jian = (level == 0)? gameState.level0_jian : gameState.level1_jian;
	BOOL trophy_quan = (level == 0)? gameState.level0_quan : gameState.level1_quan;
	BOOL trophy_qing = (level == 0)? gameState.level0_qing : gameState.level1_qing;
	
	CGSize size = [[CCDirector sharedDirector] winSize];
	
	CCLabelTTF *label = [CCLabelTTF labelWithString:[LocalString TrophyMenu] fontName:@"Marker Felt" fontSize:60];
	label.anchorPoint = ccp(0.5, 0.5);
	label.position =  ccp( size.width/2 , size.height * 0.8);
	label.color = ccc3(255, 255, 255);
	[self addChild:label];
	
	[CCMenuItemFont setFontSize:20];
	CCMenuItemFont *item1 = [CCMenuItemFont itemFromString: [LocalString TrophyEasy] target:self selector:@selector(onEasy)];
	CCMenuItemFont *item2 = [CCMenuItemFont itemFromString: [LocalString TrophyHard] target:self selector:@selector(onMedium)];
	if (level == 0) {
		[item1 setIsEnabled:FALSE];
		[item2 setIsEnabled:TRUE];
	} else {
		[item1 setIsEnabled:TRUE];
		[item2 setIsEnabled:FALSE];
	}

	CCMenu *menu = [CCMenu menuWithItems: item1, item2, nil];
	[menu alignItemsVertically];
	menu.position = ccp(size.width*0.9, size.height * 0.8);
	[self addChild:menu];
	
	int firstItemPosY = size.height * 0.6;
	//int secondItemPosY = size.height * 0.3;
	int firstItemPosX = 100;
	//int secondItemPosX = 20 + size.width/2;
	int intervalY = 40;
	int intervalX = 60;
	
	CCLabelTTF *label1_1 = [CCLabelTTF labelWithString:@"击" fontName:@"Marker Felt" fontSize:35];
	label1_1.anchorPoint = ccp(0, 0.5);
	label1_1.position = ccp( firstItemPosX, firstItemPosY);
	label1_1.color = trophy_ji ? ccc3(255, 255, 50) : ccc3(127, 127, 127);
	
	CCLabelTTF *label1_2 = [CCLabelTTF labelWithString:[LocalString TrophyJi] fontName:@"Marker Felt" fontSize:20];
	label1_2.anchorPoint = ccp(0, 0.5);
	label1_2.position =  ccp( firstItemPosX+intervalX, firstItemPosY);
	label1_2.color = trophy_ji ? ccc3(255, 255, 255) : ccc3(127, 127, 127);
	
	CCLabelTTF *label2_1 = [CCLabelTTF labelWithString:@"全" fontName:@"Marker Felt" fontSize:35];
	label2_1.position =  ccp( firstItemPosX, firstItemPosY - intervalY);
	label2_1.anchorPoint = ccp(0, 0.5);
	label2_1.color = trophy_quan ? ccc3(255, 55, 150) : ccc3(127, 127, 127);
	CCLabelTTF *label2_2 = [CCLabelTTF labelWithString:[LocalString TrophyQuan] fontName:@"Marker Felt" fontSize:20];
	label2_2.position =  ccp( firstItemPosX+intervalX, firstItemPosY - intervalY);
	label2_2.anchorPoint = ccp(0, 0.5);
	label2_2.color = trophy_quan ? ccc3(255, 255, 255) : ccc3(127, 127, 127);
	
	CCLabelTTF *label3_1 = [CCLabelTTF labelWithString:@"歼" fontName:@"Marker Felt" fontSize:35];
	label3_1.position =  ccp( firstItemPosX, firstItemPosY - intervalY*2);
	label3_1.anchorPoint = ccp(0, 0.5);
	label3_1.color = trophy_jian ? ccc3(155, 255, 150) : ccc3(127, 127, 127);
	CCLabelTTF *label3_2 = [CCLabelTTF labelWithString:[LocalString TrophyJian] fontName:@"Marker Felt" fontSize:20];
	label3_2.position =  ccp( firstItemPosX+intervalX, firstItemPosY - intervalY*2);
	label3_2.anchorPoint = ccp(0, 0.5);
	label3_2.color = trophy_jian ? ccc3(255, 255, 255) : ccc3(127, 127, 127);
	
	CCLabelTTF *label4_1 = [CCLabelTTF labelWithString:@"清" fontName:@"Marker Felt" fontSize:35];
	label4_1.position =  ccp( firstItemPosX, firstItemPosY - intervalY*3);
	label4_1.anchorPoint = ccp(0, 0.5);
	label4_1.color = trophy_qing ? ccc3(55, 55, 250) : ccc3(127, 127, 127);
	CCLabelTTF *label4_2 = [CCLabelTTF labelWithString:[LocalString TrophyQing] fontName:@"Marker Felt" fontSize:20];
	label4_2.position =  ccp( firstItemPosX+intervalX, firstItemPosY - intervalY*3);
	label4_2.anchorPoint = ccp(0, 0.5);
	label4_2.color = trophy_qing ? ccc3(255, 255, 255) : ccc3(127, 127, 127);
	
	[self addChild:label1_1];
	[self addChild:label1_2];
	[self addChild:label2_1];
	[self addChild:label2_2];
	[self addChild:label3_1];
	[self addChild:label3_2];
	[self addChild:label4_1];
	[self addChild:label4_2];
	
	CCMenuItemFont *item4 = [CCMenuItemFont itemFromString: [LocalString CommonBack] target:self selector:@selector(onBack)];
	CCMenu *back = [CCMenu menuWithItems: item4, nil];
	back.position = ccp(size.width - 50, 15);
	[self addChild: back];
}

-(void) onBack {
	
	CCScene *scene = [HomePageScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	[AudioEngine stopAllMusic];
	[AudioEngine clickButtonCancelEffect];
}

-(void) onEasy {
	
	CCScene *scene = [TrophyScene scene:0];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	
	[AudioEngine clickButtonConfirmEffect];
}

-(void) onMedium {

	CCScene *scene = [TrophyScene scene:1];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	[AudioEngine clickButtonConfirmEffect];
}


@end
