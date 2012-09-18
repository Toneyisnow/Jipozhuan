//
//  ChapterEnd.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-31.
//  Copyright 2011 ms. All rights reserved.
//

#import "ChapterEnd.h"
#import "GameConfig.h"
#import "FadeoutAction.h"
#import "TransitionEndController.h"

@implementation ChapterEnd

-(id) initWithGame:(id<ScreenContainer>)g {
	
	self = [super initWithGame:g];
	
	finishingTime = 3.0;
	
	statisticsTitle = @"恭喜通关";
	return self;
}

-(void) initBackgroundController:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {
	
	backgroundController = [[TransitionEndController alloc] initWithLayer:layer1 Backdrop:layer2];
}

-(void) composeFinishStatistics {
	
	finishedTick = chapterTick;
	
	// Show
	AnimatedCharacter *title = [[AnimatedCharacter alloc] initWithChar:statisticsTitle Size:85];
	[title setColor:[Color R:0 G:0 B:0]];
	[title setPositionX:(GAME_SCREEN_WIDTH/2) Y:(GAME_SCREEN_HEIGHT/2)];
	Curve *curve = [[Curve alloc] init];
	FadeoutAction *action1 = [FadeoutAction actionWithRate:0.8];
	[curve addAction:action1 Time:6.0];
	[curve setTimeoutTime:8.0];
	[title setDefaultCurve:curve];
	[game addCharacter:title];
	
	AnimatedCharacter *subtitle = [[AnimatedCharacter alloc] initWithChar:@"更多关卡  敬请期待" Size:40];
	[subtitle setColor:[Color R:0 G:0 B:0]];
	[subtitle setPositionX:(GAME_SCREEN_WIDTH/2) Y:(GAME_SCREEN_HEIGHT/4)];
	Curve *curve2 = [[Curve alloc] init];
	FadeoutAction *action21 = [FadeoutAction actionWithRate:0.8];
	[curve addAction:action21 Time:6.0];
	[curve setTimeoutTime:8.0];
	[subtitle setDefaultCurve:curve2];
	[game addCharacter:subtitle];
	
	
}


@end
