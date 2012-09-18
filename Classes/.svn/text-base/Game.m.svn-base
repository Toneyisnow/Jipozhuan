//
//  Game.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-17.
//  Copyright 2011 ms. All rights reserved.
//

#import "Game.h"
#import "Constants.h"
#import "cocos2d.h"
#import "GameConfig.h"

#import "EnemyBuilder.h"
#import "EnemyBullet.h"
#import "Curve.h"

#import "MainGameScene.h"
#import "HomePageScene.h"
#import "TrophyScene.h"
#import "GameState.h"
#import "GameStatistics.h"

#import "ChapterOne.h"
#import "ChapterTwo.h"
#import "ChapterThree.h"
#import "ChapterFour.h"
#import "ChapterEnd.h"

#import "AudioEngine.h"

@interface Game()

-(void) initHero;

-(void) updateScreenObjects;
-(void) updateHeroStatus;

-(void) enterChapter:(int)chapterNum;

-(void) dispose;
@end

@implementation Game

-(id) initWithScene:(MainGameScene *)scene {

	self = [super init];
	gameScene = scene;
	gameScreen = gameScene.mainGameLayer;
	
	//backgroundLayer = back;
	//background = [[Background alloc] initWithScreen:gameScene.backgroundLayer BackDrop:gameScene.backdropLayer];
	
	foreground = [[Foreground alloc] initWithScreen:gameScene.foregroundLayer AlertLayer:gameScene.alertLayer Game:self];
	[gameScene.alertLayer setTarget:self];
	
	gameStatus = GameStatusIdle;
	[gameScreen setCurrentGame:self];
	gameChapter = nil;
	screenObjects = [[NSMutableArray alloc] init];
	
	currentChapter = 1;
	
	return self;
}

-(void) tick {

	if(gameStatus != GameStatusPlaying && gameStatus != GameStatusGameOver) {
		return;
	}
	
	if (gameStatus == GameStatusGameOver) {
		if (gameTick - lastImportantTick >= 2.0 * GAME_FPS) {
			[AudioEngine fadeOutMusic];
		}if (gameTick - lastImportantTick >= 4.0 * GAME_FPS) {
			[self gameEnd];
		}
	}
	
	//NSLog(@"GameTick: %d", gameTick);
	
	//////// Update Hero status
	[self updateHeroStatus];
	//NSLog(@"Updated hero status");
	
	//////// Update Screen objects
	[self updateScreenObjects];
	//NSLog(@"Updated screen objects");
	
	//////// Add enemies according to scenario definition
	[gameChapter tick];
	if ([gameChapter bossRetreated]) {
		[self defeatAllEnemy];
	}
	
	if ([hero shockOffAllEnemyBullets]) {
		[foreground setLeftShockwave:[hero getShockWaveCount]];
		[foreground showLeftShockwave];
	}
	
	if ([gameChapter shouldBeClosed]) {
		
		int level = [GameStatistics instance]==nil? 0 : [GameStatistics instance].level;
		if(level == 0) {
			leftHeroCount += 3;
		} else if (level == 1) {
			leftHeroCount += 2;
		}
		[foreground setLeftHero:leftHeroCount];
		[foreground showLeftHeroes];
		
		[self enterChapter:++currentChapter];
	}
	
	[gameScreen recycle];
	//NSLog(@"Game Cycle Finished.");
	
	// Play Music
	[AudioEngine tick];
	
	// Prepare for next tick
	gameTick ++;
}

-(void) addCharacter: (AnimatedCharacter *) ach {

	//NSLog(@"Added character to screen: %@", [ach getCharacter]);
	[screenObjects addObject:ach];
	[ach addToScene:gameScreen];
}

-(void) removeCharacter: (AnimatedCharacter *) ach {
	
	[screenObjects removeObject:ach];
	[ach removeFromCurrentScene];
}

-(void) updateScreenObjects {

	if(screenObjects == nil) {
		return;
	}
	
	//BOOL bosRetreated = [gameChapter bossRetreated];
	for( int i = [screenObjects	count]-1;i >= 0; i--) {
		AnimatedCharacter *ach = [screenObjects objectAtIndex:i];
		if (ach == nil) {
			[screenObjects removeObject:ach];
			continue;
		}
		
		/*
		 if (bosRetreated && [ach isMemberOfClass:[Enemy class]]) {
			Enemy *enemy = (Enemy *)ach;
			[enemy setShouldbeKilled:TRUE];
		}
		*/
		
		//NSLog(@"take tick...");
		[ach takeTick:gameTick];
		
		if ([ach conformsToProtocol:@protocol(CharacterComposer)]) {
			AirCraft *composer = (AirCraft *)ach;
			[composer composeCharacterToGame: self];
		}
		
		if ([gameScreen isOutOfScreen:ach.ccLabel] || [ach shouldBeDisposed]) {
			[self removeCharacter:ach];
			continue;
		}
		
		if ([hero shockOffAllEnemyBullets] && [ach isKindOfClass:[EnemyBullet class]]) {
			[self removeCharacter:ach];
			continue;
		}
		
		if (hero == NULL && [ach isKindOfClass:[Friend class]]) {
			[self removeCharacter:ach];
		}
		
		/*
		if ([gameChapter bossRetreated] && [ach isMemberOfClass:[Enemy class]]) {
			NSLog(@"Set the enemy %@ to be killed.", [ach getCharacter]);
			//Enemy *enemy = (Enemy *)ach;
			//[enemy setShouldbeKilled:TRUE];
			[self removeCharacter:ach];
			continue;
		}
		 */
	}
}

-(void) defeatAllEnemy {

	NSLog(@"Defeat All Enemy.");
	for( int i = [screenObjects	count]-1;i >= 0; i--) {
		AnimatedCharacter *ach = [screenObjects objectAtIndex:i];
		if (ach == nil) {
			continue;
		}
		
		if ([ach isMemberOfClass:[Enemy class]]) {
			NSLog(@"Enemy: %@", [ach getCharacter]);
			
			Enemy *enemy = (Enemy *)ach;
			[enemy setShouldbeKilled:TRUE];
		}
	}
	NSLog(@"Finished Defeat All Enemy.");
}

-(void) updateHeroStatus {

	if (hero == nil && gameStatus == GameStatusPlaying) {
		
		if (gameTick >= lastImportantTick + GAME_FPS/2) {
			
			// Compose a new Hero
			[self initHero];
			lastImportantTick = gameTick;
		}
		return;
	}
	
	if ([hero shouldBeDisposed]) {
		
		@synchronized(hero) {
			[hero removeFromCurrentScene];
			[hero release];
			hero = nil;
			[Hero setCurrentHero: nil];
			lastImportantTick = gameTick;
			
			if ([GameStatistics instance] != nil) {
				[GameStatistics instance].heroPerfect = FALSE;
			}
		}
		return;
	}
	
	[hero keepInRect];
	[hero takeTick:gameTick];
	[hero composeCharacterToGame:self];
}

-(void) initHero {
	
	if(hero != nil) {
		return;
	}
	
	if (leftHeroCount > 0) {
	
		leftHeroCount --;
		[foreground setLeftHero:leftHeroCount];
		[foreground showLeftHeroes];
	
		
		hero = [[Hero alloc]init];
		[Hero setCurrentHero:hero];
		[hero addToScene:gameScreen];
		[hero setShooting:TRUE];
		
		[foreground setLeftShockwave:[hero getShockWaveCount]];
		[foreground showLeftShockwave];
		
		NSLog(@"Hero initialized.");
	} else {
		[self gameOver];
	}
}

//-(void) enterChapter:(Chapter *)chapter {
-(void) enterChapter:(int)chapterNum {

	if (gameChapter != nil) {
		[gameChapter release];
		gameChapter = nil;
	}
	
	switch (chapterNum) {
		case 1:
			gameChapter = [[ChapterOne alloc] initWithGame:self];
			break;
		case 2:
			gameChapter = [[ChapterTwo alloc] initWithGame:self];
			break;
		case 3:
			gameChapter = [[ChapterThree alloc] initWithGame:self];
			break;
		case 4:
			gameChapter = [[ChapterFour alloc] initWithGame:self];
			break;
		case 5:
			gameChapter = [[ChapterEnd alloc] initWithGame:self];
			break;
		case 6:
			[self gameFinish];
			break;
		default:
			gameChapter = [[ChapterOne alloc] initWithGame:self];
			break;
	}
	//[gameChapter composeChapterTitle];
	
	// Add Background
	//[gameChapter setBackground:background];	// deprecated
	[gameChapter initBackgroundController:gameScene.backgroundLayer Backdrop:gameScene.backdropLayer];
	//[gameChapter initializeBackground];
	[gameChapter startChapter];
}

-(void) gameStart {
	
	NSLog(@"Initialize started.");
	gameStatus = GameStatusPlaying;
	
	// Add Hero
	int level = [GameStatistics instance]==nil? 0 : [GameStatistics instance].level;
	if(level == 0) {
		leftHeroCount = 10;
	} else if (level == 1) {
		leftHeroCount = 8;
	}
	//heroPerfect = TRUE;
	[foreground setLeftHero:leftHeroCount];
	[self initHero];
	
	// Add Foreground
 	[foreground onShow];
	
	// Set Chapter
	[self enterChapter:currentChapter];
	
	lastImportantTick = gameTick = 0;
	
	// Play Music
	[AudioEngine loadAudioFlags];
	[AudioEngine playBackgroundMusic:1];
	
	NSLog(@"Initialize finished.");
	
	[gameScene schedule:@selector(tick:) interval:(1.0 / [Constants gameFPS])];
}

-(void) gamePause {

	//if (gameStatus != GameStatusPlaying) {
	//	return;
	//}
	
	NSLog(@"Pausing Game.");
	//gameStatus = GameStatusPaused;
	
	[[CCDirector sharedDirector] pause];

	// Show Alert Layer
	[foreground showAlert];
	
	NSLog(@"Game Paused.");
}

-(void) gameResume {
	
	NSLog(@"Resuming Game.");
	[[CCDirector sharedDirector] resume];

	//gameStatus = GameStatusPlaying;
}

-(void) gameFinish {

	// This means the game has been successfully finished, should save record.
	
	[GameState loadGameStateFromFile];
	
	GameState *state = [GameState gameState];
	GameStatistics *statistics = [GameStatistics instance];
	
	NSLog(@"Level: %d", [GameState gameState].level0_ji);
	if ([GameState gameState] == NULL) {
		NSLog(@"State is nil");
	}
	// if (state != NULL && statistics != NULL) {
		
		NSLog(@"Saving Game...");
		// Ji
		if(statistics.level == 0) {
			state.level0_ji = 1;
		} else if (statistics.level == 1) {
			state.level1_ji = 1;
		}
		
		// Jian
		float passRate = (float)statistics.scoreGained / statistics.scoreTotal;
		if(passRate >= 0.7) {
			if(statistics.level == 0) {
				state.level0_jian = 1;
			} else if (statistics.level == 1) {
				state.level1_jian = 1;
			}
		}
		
		// Quan
		if(statistics.heroPerfect) {
			if(statistics.level == 0) {
				state.level0_quan = 1;
			} else if (statistics.level == 1) {
				state.level1_quan = 1;
			}
		}
		
		// Qing
		if (!statistics.shockwavUsed) {
			if(statistics.level == 0) {
				state.level0_qing = 1;
			} else if (statistics.level == 1) {
				state.level1_qing = 1;
			}
		}
		[GameState saveGameStateToFile];
	// }
	
	// Dispose Game and return to Trophy screen
	[self dispose];
	
	
	CCScene *scene = [TrophyScene scene:(statistics!=nil?statistics.level:0)];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:3.0 scene:scene]];
}

-(void) gameOver {
	
	AnimatedCharacter *message = [[AnimatedCharacter alloc] initWithChar:@"游戏结束" Size:80];
	[message setColor:[Color R:0 G:0 B:0]];
	[message setPositionX:(GAME_SCREEN_WIDTH/2) Y:(GAME_SCREEN_HEIGHT/2)];
	
	[foreground showAlert:message];
	gameStatus = GameStatusGameOver;
	lastImportantTick = gameTick;
}

-(void) gameEnd {

	NSLog(@"Ending Game.");
	
	// Stop Music
	[AudioEngine stopAllMusic];
	
	[self dispose];
	
	CCScene *scene = [HomePageScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:3.0 scene:scene]];
}

// Hero is dead
-(void) gameDie {
}

// Release all objects from game
-(void) dispose {
	
	gameStatus = GameStatusFinished;
	
	[GameStatistics clearInstance];
	[[CCDirector sharedDirector] resume];
	
	//CCScene *scene = [HomePageScene scene];
	//[[CCDirector sharedDirector] pollScene: [CCTransitionFade transitionWithDuration:1.5 scene:scene]];
	//[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.5 scene:scene]];
	
	[CCDirector sharedDirector].notificationNode = nil;
	[MainGameScene releaseDistance];	
}

-(void) gameSave {

	// [GameState saveGameStateToFile];
}

-(void) gameLoad {

	// [GameState loadGameStateFromFile];
}

-(void) visit {
}

@end
