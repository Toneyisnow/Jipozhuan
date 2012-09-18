//
//  Chapter.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScreenContainer.h"
#import "Background.h"
#import "LinkedEnemyDefinition.h"
#import "EnemyBuilder.h"
#import "BackgroundController.h"

@interface Chapter : NSObject {

	int chapterIndex;
	
	int chapterTick;
	//int preAnimationTick;
	LinkedEnemyDefinition *linkedEnemies;
	
	NSString *chapterTitle;
	NSString *statisticsTitle;
	
	id<ScreenContainer> game;
	
	//Background *background;	// This is deprecated
	BackgroundController *backgroundController;	// This will be initialized by subclass
	
	BOOL isPlaying;
	BOOL bossRetreated;
	
	EnemyBuilder *enemyBuilder;
	
	int finishedTick;
	float finishingTime;
	float statisticsShowTime;
	
	float bossTime;
	
	int gameLevel;
	
	// Used to set related enemies
	Enemy *previousEnemy;
}

-(id) initWithGame:(id<ScreenContainer>)g;

-(void) defineEnemies;

//-(void) setBackground:(Background *)background;
-(void) initBackgroundController:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2;

//-(void) initializeBackground;

-(void) composeChapterTitle;
-(void) composeFinishStatistics;

-(void) tick;
-(void) tickChapter;
-(void) startChapter;

-(void) setChapterIndex:(int) index;

-(void) setFinishNow;
-(BOOL) isFinished;
-(BOOL) shouldBeClosed;
-(BOOL) bossRetreated;

@end
