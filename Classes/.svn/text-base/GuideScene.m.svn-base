//
//  GuideScene.m
//  Jipozhuan
//
//  Created by sui toney on 11-6-4.
//  Copyright 2011 ms. All rights reserved.
//

#import "GuideScene.h"
#import "MainGameScene.h"
#import "LocalString.h"

@implementation GuideScene

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GuideScene *layer = [GuideScene node];
	//[layer setLevel:lev];
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
		
		self.isTouchEnabled = YES;
		
		CCSprite *sprite = [CCSprite spriteWithFile:[LocalString IntroFileName]];
		//CCSprite *sprite = [CCSprite spriteWithFile:@"Introzh.png"];
		sprite.position = ccp(240, 160);
		
		[self addChild:sprite];
	}
	return self;
}

- (void) ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	
	NSLog(@"Clicked");
	
	[self onContinue];
}

-(void) onContinue
{
	CCScene *scene = [MainGameScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
}


@end
