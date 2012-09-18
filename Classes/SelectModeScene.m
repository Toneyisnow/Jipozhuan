//
//  ModeSelectionScene.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-14.
//  Copyright 2011 ms. All rights reserved.
//

#import "SelectModeScene.h"
#import "HomePageScene.h"
#import "GuideScene.h"
#import "GameStatistics.h"
#import "GameState.h"
#import "AudioEngine.h"
#import "LocalString.h"

@implementation SelectModeScene

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SelectModeScene *layer = [SelectModeScene node];
	
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
		
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		CCLabelTTF *label = [CCLabelTTF labelWithString:[LocalString SelectModeMenu] fontName:@"Marker Felt" fontSize:45];
		label.position =  ccp( size.width/2 , size.height * 3/4 );
		label.color = ccc3(255, 255, 255);
		
		[CCMenuItemFont setFontSize:35];
		CCMenuItemFont *item1 = [CCMenuItemFont itemFromString: [LocalString SelectModeEasy] target:self selector:@selector(onEasy)];
		CCMenuItemFont *item2 = [CCMenuItemFont itemFromString: [LocalString SelectModeHard] target:self selector:@selector(onMedium)];
		//CCMenuItemFont *item3 = [CCMenuItemFont itemFromString: @"困难" target:self selector:@selector(onHard)];
		
		CCMenu *menu = [CCMenu menuWithItems: item1, item2, nil];
		[menu alignItemsVerticallyWithPadding:10];
		menu.position = ccp(size.width/2, size.height /4);
		
		[CCMenuItemFont setFontSize:20];
		CCMenuItemFont *item4 = [CCMenuItemFont itemFromString: [LocalString CommonBack] target:self selector:@selector(onBack)];
		CCMenu *back = [CCMenu menuWithItems: item4, nil];
		back.position = ccp(size.width - 50, 15);
		
		[self addChild:label];
		[self addChild: menu];
		[self addChild: back];
		
	}
	return self;
}

-(void) onBack {

	CCScene *scene = [HomePageScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	[AudioEngine clickButtonCancelEffect];
}

-(void) onEasy {
	
	// Initial the statistics
	[GameStatistics newInstance];
	[GameStatistics instance].level = 0;
	
	//[GameState newState];
	//[GameState saveGameStateToFile];
	
	CCScene *scene = [GuideScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	
	[AudioEngine clickButtonConfirmEffect];
}

-(void) onMedium {

	// Initial the statistics
	[GameStatistics newInstance];
	[GameStatistics instance].level = 1;
	
	CCScene *scene = [GuideScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	[AudioEngine clickButtonConfirmEffect];
}

-(void) onHard {
	CCScene *scene = [GuideScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	[AudioEngine clickButtonConfirmEffect];
}

@end
