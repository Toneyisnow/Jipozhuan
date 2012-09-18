//
//  Chapter.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import "Chapter.h"
#import "EnemyBuilder.h"
#import "FadeoutAction.h"
#import "Curve.h"
#import "GameConfig.h"
#import "Constants.h"
#import "GameStatistics.h"
#import "BossEnemy.h"
#import "AudioEngine.h"

@implementation Chapter

-(id) initWithGame:(id<ScreenContainer>)g {

	self = [super init];
	game = g;
	chapterTick = 0;
	//preAnimationTick = 0;
	finishedTick = 0;
	//displayingPreAnimation = TRUE;
	
	gameLevel = ([GameStatistics instance] != nil) ? [GameStatistics instance].level : 0;
	
	isPlaying = TRUE;
	finishingTime = 0x7FFFFFFF;
	bossTime = 0x7FFFFFFF;
	statisticsShowTime = 5.0;
	
	linkedEnemies = [[LinkedEnemyDefinition alloc] init];
	previousEnemy = nil;
	bossRetreated = FALSE;
	
	return self;
}

-(void) initBackgroundController:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {

	// This should be implemented by subclass
}

-(void) tick {
	
	[backgroundController tick];
	if ([backgroundController hasFinished] && [backgroundController getNext] != nil) {
		// Switch to next controller
		BackgroundController *nextController = [backgroundController getNext];
		[backgroundController release];
		backgroundController = nextController;
		
		[backgroundController start];
		[self composeChapterTitle];
	}
	
	[self tickChapter];
}

-(void) startChapter {
	
	//displayingPreAnimation = FALSE;
	
	//[self initializeBackground];
	//[background drawBackdrop];
	isPlaying = TRUE;
	[backgroundController start];
}

-(void) tickChapter {
	
	chapterTick ++;
	if ([self isFinished]) {
		[self composeFinishStatistics];
		isPlaying = FALSE;
	}
	if (!isPlaying) {
		return;
	}
	while (linkedEnemies != nil && [linkedEnemies getTick] == chapterTick) {
		
		EnemyDefinition *definition = [linkedEnemies getItem];
		if(definition != nil && definition.clarification != EnemyDefinition_Null) {
			SolidCharacter *solid = [enemyBuilder build:definition.clarification Type:definition.subtype];
			[game addCharacter:solid];
			
			if ([solid isKindOfClass:[Enemy class]]) {
				Enemy *enemy = (Enemy *)solid;
				[GameStatistics instance].scoreTotal += [enemy getEnemyScore]*[enemy getEnemyHeadCount];
				[GameStatistics instance].countTotal += [enemy getEnemyHeadCount];
				
				// Set Related Enemies
				if ([enemy hasRelatedEnemy]) {
					[enemy setRelatedEnemy1:previousEnemy];
				}
				if (previousEnemy != nil && [previousEnemy hasRelatedEnemy]) {
					[previousEnemy setRelatedEnemy2:enemy];
				}
				previousEnemy = enemy;
				
				if ([enemy isMemberOfClass:[BossEnemy class]]) {
					BossEnemy *boss = (BossEnemy *)enemy;
					[boss setChapter:self];
				}
			}
		}
		
		LinkedEnemyDefinition *old = linkedEnemies;
		linkedEnemies = [old getNext];
		[old release];
	
	}
	
	// Play Boss Music
	if (chapterTick == (int)bossTime * [Constants gameFPS]) {
		NSLog(@"Play Boss Music");
		[AudioEngine playBossMusic:chapterIndex];
	}
	
	//NSLog(@"Tick chapter finished.");
	
}

-(void) defineEnemies {
	// abstract
}

-(void) composeChapterTitle {
	
	AnimatedCharacter *title = [[AnimatedCharacter alloc] initWithChar:chapterTitle Size:45];
	[title setColor:[Color R:0 G:0 B:0]];
	[title setPositionX:(GAME_SCREEN_WIDTH/2) Y:(GAME_SCREEN_HEIGHT/2)];
	[title setOpacity:20];
	
	Curve *curve = [[Curve alloc] init];
	FadeoutAction *action1 = [FadeoutAction actionWithRate:1.3];
	FadeoutAction *action2 = [FadeoutAction actionWithRate:0.8];
	[curve addAction:action1 Time:0.0];
	[curve addAction:action2 Time:3.0];
	[curve setTimeoutTime:5.0];
	[title setDefaultCurve:curve];
	
	[game addCharacter:title];
}

-(void) composeFinishStatistics {

	finishedTick = chapterTick;
	
	// Show
	AnimatedCharacter *title = [[AnimatedCharacter alloc] initWithChar:statisticsTitle Size:45];
	[title setColor:[Color R:0 G:0 B:0]];
	[title setPositionX:(GAME_SCREEN_WIDTH/2) Y:(GAME_SCREEN_HEIGHT*0.75)];
	Curve *curve = [[Curve alloc] init];
	FadeoutAction *action1 = [FadeoutAction actionWithRate:0.8];
	[curve addAction:action1 Time:6.0];
	[curve setTimeoutTime:8.0];
	[title setDefaultCurve:curve];
	[game addCharacter:title];
	
	GameStatistics *statistics = [GameStatistics instance];
	
	NSString *scoreString = [NSString stringWithFormat:@"分数:  %d / %d", statistics.scoreGained, statistics.scoreTotal];
	AnimatedCharacter *score = [[AnimatedCharacter alloc] initWithChar:scoreString Size:30];
	[score setColor:[Color R:0 G:0 B:0]];
	[score setPositionX:(GAME_SCREEN_WIDTH/2) Y:(GAME_SCREEN_HEIGHT/2)];
	Curve *curve2 = [[Curve alloc] init];
	FadeoutAction *action2 = [FadeoutAction actionWithRate:0.8];
	[curve2 addAction:action2 Time:6.0];
	[curve2 setTimeoutTime:8.0];
	[score setDefaultCurve:curve2];
	[game addCharacter:score];
	
	NSString *countString = [NSString stringWithFormat:@"击敌率:  %d%%", (int)((float)statistics.scoreGained/statistics.scoreTotal*100)];
	AnimatedCharacter *count = [[AnimatedCharacter alloc] initWithChar:countString Size:30];
	[count setColor:[Color R:0 G:0 B:0]];
	[count setPositionX:(GAME_SCREEN_WIDTH/2) Y:(GAME_SCREEN_HEIGHT/3)];
	Curve *curve3 = [[Curve alloc] init];
	FadeoutAction *action3 = [FadeoutAction actionWithRate:0.8];
	[curve3 addAction:action3 Time:6.0];
	[curve3 setTimeoutTime:8.0];
	[count setDefaultCurve:curve3];
	[game addCharacter:count];
	
	[AudioEngine playBackgroundMusic:(chapterIndex + 1)];
}

-(void) setFinishNow {

	NSLog(@"Set Finish Now.");
	isPlaying = FALSE;
	finishingTime = (float)chapterTick / [Constants gameFPS] + 5.0;

	bossRetreated = TRUE;
	
	[AudioEngine fadeOutMusic];
}

-(BOOL) isFinished {

	return (chapterTick == (int)(finishingTime * [Constants gameFPS]));
}

-(BOOL) shouldBeClosed {

	return (finishedTick > 0) && (chapterTick > finishedTick + (int)(statisticsShowTime * [Constants gameFPS]));
}

-(BOOL) bossRetreated {

	if (bossRetreated) {
		bossRetreated = FALSE;
		return TRUE;
	}
	return FALSE;
}

-(void) setChapterIndex:(int) index {

	chapterIndex = index;
}

-(void) release {

	[enemyBuilder release];
	[backgroundController release];
	
	[super release];
}

@end
