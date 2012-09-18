//
//  HelloWorldLayer.m
//  CocosTest
//
//  Created by sui toney on 11-1-8.
//  Copyright ms 2011. All rights reserved.
//

// Import the interfaces
#import "HomePageScene.h"
#import "SelectModeScene.h"
#import "SettingsScene.h"
#import "TrophyScene.h"
#import "Common.h"
#import "GameState.h"
#import "AudioEngine.h"
#import "LocalString.h"

static CCScene *instance;

// HelloWorld implementation
@implementation HomePageScene


+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	
	if(instance == nil) {
		
		instance = [CCScene node];
		HomePageScene *layer = [HomePageScene node];
		[instance addChild: layer];
	}	
	// return the scene
	return instance;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		/*
		CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"击" fontName:@"Marker Felt" fontSize:80];
		CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"破" fontName:@"Marker Felt" fontSize:80];
		CCLabelTTF *label3 = [CCLabelTTF labelWithString:@"传" fontName:@"Marker Felt" fontSize:80];
		label1.position =  ccp(size.width/2-100 , size.height * 0.7);
		label1.color = ccc3(250, 20, 0);
		label2.position =  ccp(size.width/2 , size.height * 0.7);
		label2.color = ccc3(230, 50, 0);
		label3.position =  ccp(size.width/2+100 , size.height * 0.7);
		label3.color = ccc3(210, 80, 0);
		*/
		CCSprite *sprite = [CCSprite spriteWithFile:@"MainPage.png"];
		sprite.position = ccp(240, 160);
		
		
		[CCMenuItemFont setFontSize:35];
		
		CCMenuItemFont *item1 = [CCMenuItemFont itemFromString: [LocalString MainPageStart] target:self selector:@selector(onStart)];
		CCMenuItemFont *item2 = [CCMenuItemFont itemFromString: [LocalString MainPageTrohpy] target:self selector:@selector(onTrophy)];
		CCMenuItemFont *item3 = [CCMenuItemFont itemFromString: [LocalString MainPageSettings] target:self selector:@selector(onSettings)];
		
		CCMenu *menu = [CCMenu menuWithItems: item1, item2, item3, nil];
		[menu alignItemsVerticallyWithPadding:10];
		menu.position = ccp(size.width/2, size.height /4);
		
		[self addChild:sprite];
		[self addChild: menu];
		
		
		NSLog(@"Random: %f", [Common getRandomFrom:0.0 To:10]);
				
	}
	return self;
}

-(void) draw {
	
	
}

-(void) onStart {
	
	CCScene *scene = [SelectModeScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	[instance release];
	instance = nil;
	
	/*
	[GameState loadGameStateFromFile];
	GameState *state = [GameState gameState];
	
	if (state.level0_ji) {
		NSLog(@"Level0_ji");
	}
	else {
		NSLog(@"Level0_No");
	}

	state.level0_ji = 1;
	[GameState saveGameStateToFile];
	*/
	
	[AudioEngine clickButtonConfirmEffect];
}

-(void) onSettings {
	
	CCScene *scene = [SettingsScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	[AudioEngine clickButtonConfirmEffect];
}

-(void) onTrophy {

	CCScene *scene = [TrophyScene scene:0];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];

	[AudioEngine clickButtonConfirmEffect];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end

