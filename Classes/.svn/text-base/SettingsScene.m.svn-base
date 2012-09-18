//
//  SettingsScene.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-14.
//  Copyright 2011 ms. All rights reserved.
//

#import "SettingsScene.h"
#import "HomePageScene.h"
#import "AudioEngine.h"
#import "GameSetting.h"
#import "LocalString.h"

@implementation SettingsScene

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SettingsScene *layer = [SettingsScene node];
	
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
		
		NSLog(@"Init Setting Scene.");
		[GameSetting loadGameSettingFromFile];
		
		
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		CCLabelTTF *label = [CCLabelTTF labelWithString:[LocalString SettingsMenu] fontName:@"Marker Felt" fontSize:60];
		label.position =  ccp( size.width/2 , size.height * 3/4 );
		label.color = ccc3(255, 255, 255);
		
		[CCMenuItemFont setFontSize:35];
		
		NSString *musicString;
		NSString *soundString;
		GameSetting *setting = [GameSetting gameSetting];
		if (setting.playMusic == 1) {
			musicString = [LocalString SettingsMusicOn];
		}else {
			musicString = [LocalString SettingsMusicOff];
		}
		if (setting.playSound == 1) {
			soundString = [LocalString SettingsSoundOn];
		}else {
			soundString = [LocalString SettingsSoundOff];
		}
				
		item1 = [CCMenuItemFont itemFromString: musicString target:self selector:@selector(onSwitchMusic)];
		item2 = [CCMenuItemFont itemFromString: soundString target:self selector:@selector(onSwitchSound)];
		
		[item1 retain];
		[item2 retain];
		
		menu = [CCMenu menuWithItems: item1, item2, nil];
		[menu alignItemsVertically];
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

-(void) onSwitchMusic {
	
	GameSetting *setting = [GameSetting gameSetting];
	setting.playMusic = 1 - setting.playMusic;
	[GameSetting saveGameSettingToFile];
	
	NSString *musicString;
	if (setting.playMusic == 1) {
		musicString = [LocalString SettingsMusicOn];
	}else {
		musicString = [LocalString SettingsMusicOff];
	}
	
	[item1 setString:musicString];
}

-(void) onSwitchSound {
	
	GameSetting *setting = [GameSetting gameSetting];
	setting.playSound = 1 - setting.playSound;
	[GameSetting saveGameSettingToFile];
	
	[AudioEngine loadAudioFlags];
	
	NSString *soundString;
	if (setting.playSound == 1) {
		soundString = [LocalString SettingsSoundOn];
	}else {
		soundString = [LocalString SettingsSoundOff];
	}
	
	[item2 setString:soundString];
	
}

-(void) onBack {
	
	CCScene *scene = [HomePageScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	[AudioEngine clickButtonCancelEffect];
}

@end
