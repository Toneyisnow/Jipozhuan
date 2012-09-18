//
//  ChapterFour.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import "ChapterTwo.h"
#import "EnemyBuilderTwo.h"
#import "BackgroundTwoController.h"
#import "TransitionTwoController.h"
#import "GameConfig.h"

@implementation ChapterTwo

-(id) initWithGame:(id<ScreenContainer>)g {
	
	self = [super initWithGame:g];
	
	enemyBuilder = [[EnemyBuilderTwo alloc] init];
	
	[self defineEnemies];
	chapterIndex = 2;
	
	chapterTitle = @"第二幕  丛林";
	statisticsTitle = @"第二幕  突破";
	return self;
}

-(void) initBackgroundController:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {
	
	backgroundController = [[TransitionTwoController alloc] initWithLayer:layer1 Backdrop:layer2];
	BackgroundController *mainController = [[BackgroundTwoController alloc] initWithLayer:layer1 Backdrop:layer2];
	[backgroundController setNext:mainController];
}

-(void) tick {

	[super tick];
	if (chapterTick == revertBackgroundTime * GAME_FPS) {
		[backgroundController setStage:1];
	}
	if (chapterTick == (revertBackgroundTime+2) * GAME_FPS) {
		[backgroundController setStage:2];
	}
}

-(void) defineEnemies {
	
	float definedTime = 0;
	
	definedTime += 11.0;
	//[linkedEnemies addItem:EnemyDefinition2_Chong3Boss Type:1 AtTime:definedTime];		
	//definedTime += 3.0;
	
	for (int i = 0; i < 10; i ++, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition2_Die Type:1 AtTime:definedTime];		
	}
	definedTime += 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	for (int i = 0; i < 10; i ++, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition2_Die Type:2 AtTime:definedTime];		
	}
	
	definedTime += 1.0;
	for (int i = 0; i < 10; i ++, definedTime += 0.15) {
		[linkedEnemies addItem:EnemyDefinition2_Yi Type:1 AtTime:definedTime];		
	}
	definedTime += 0.5;
	for (int i = 0; i < 10; i ++, definedTime += 0.15) {
		[linkedEnemies addItem:EnemyDefinition2_Yi Type:2 AtTime:definedTime];		
	}
	definedTime += 0.5;
	for (int i = 0; i < 10; i ++, definedTime += 0.15) {
		[linkedEnemies addItem:EnemyDefinition2_Yi Type:3 AtTime:definedTime];		
	}
	definedTime	+= 0.5;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	
	definedTime += 3.0;
	[linkedEnemies addItem:EnemyDefinition2_Meng Type:1 AtTime:definedTime];
	
	definedTime	+= 3.0;
	[linkedEnemies addItem:EnemyDefinition2_Zhu Type:1 AtTime:definedTime];
	
	definedTime	+= 2.0;
	[linkedEnemies addItem:EnemyDefinition2_Zhu Type:1 AtTime:definedTime];
	
	definedTime	+= 3.0;
	for (int i = 30; i >= 0; i --, definedTime += 0.3) {
		[linkedEnemies addItem:EnemyDefinition2_Feng Type:1 AtTime:definedTime];
	}
	
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:2 AtTime:definedTime];
	
	definedTime	+= 2.0;
	for (int i = 15; i >= 0; i --, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition2_Rui Type:i AtTime:definedTime];		
	}
	[linkedEnemies addItem:EnemyDefinition2_Wen Type:1 AtTime:definedTime];
	definedTime	+= 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime	+= 2.5;
	for (int i = 3; i >= 0; i --, definedTime += 1.5) {
		[linkedEnemies addItem:EnemyDefinition2_Xi Type:1 AtTime:definedTime];
	}
	
	definedTime	+= 3.0;
	for (int i = 3; i >= 0; i --, definedTime += 2.0) {
		[linkedEnemies addItem:EnemyDefinition2_Wen Type:1 AtTime:definedTime];
	}
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime	+= 3.0;
	for (int i = 30; i >= 0; i --, definedTime += 0.2) {
		if (i % 2 ==0) {
			[linkedEnemies addItem:EnemyDefinition2_Wu Type:1 AtTime:definedTime];
		} else {
			[linkedEnemies addItem:EnemyDefinition2_Gong Type:i AtTime:definedTime];
		}
	}
	
	definedTime += 5.0;
	for (int i = 0; i < 10; i ++, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition2_E Type:1 AtTime:definedTime];		
	}
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	for (int i = 0; i < 10; i ++, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition2_E Type:2 AtTime:definedTime];		
	}
	
	definedTime	+= 3.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.2) {
		[linkedEnemies addItem:EnemyDefinition2_Zhi Type:i AtTime:definedTime];		
	}
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	definedTime	+= 2.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.2) {
		[linkedEnemies addItem:EnemyDefinition2_Zhi Type:i AtTime:definedTime];		
	}
	
	definedTime += 5.0;
	[linkedEnemies addItem:EnemyDefinition2_Wo Type:1 AtTime:definedTime];		
	definedTime += 1.0;
	[linkedEnemies addItem:EnemyDefinition2_Wo Type:1 AtTime:definedTime];		
	
	
	for (int i = 30; i >= 0; i --, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition2_Wa Type:1 AtTime:definedTime];
	}
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	for (int i = 30; i >= 0; i --, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition2_Huang Type:i AtTime:definedTime];		
	}
	
	definedTime	+= 3.0;
	for (int i = 2; i >= 0; i --, definedTime += 2.0) {
		[linkedEnemies addItem:EnemyDefinition2_Xie Type:i AtTime:definedTime];		
	}
	
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	NSLog(@"EnemyDefinition2_Chong start time:%f", definedTime);
	revertBackgroundTime = definedTime + 6.0;
	
	bossTime = definedTime + 6.0;
	
	definedTime	+= 10.0;
	for (int i = 10; i >= 0; i--, definedTime += 0.25) {
		[linkedEnemies addItem:EnemyDefinition2_Chong Type:1 AtTime:definedTime];
	}
	
	definedTime	+= 0.8;
	[linkedEnemies addItem:EnemyDefinition2_Chong3Boss Type:1 AtTime:definedTime];		
	
	
	definedTime	+= 3.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	for (int k = 0; k < 20; k++) {
		
		definedTime	+= 10.0;
		for (int i = 0; i < 10; i ++, definedTime += 0.5) {
			[linkedEnemies addItem:EnemyDefinition2_Die Type:1 AtTime:definedTime];		
		}
		definedTime += 5.0;
		[linkedEnemies addItem:EnemyDefinition2_Wo Type:1 AtTime:definedTime];		
		
		for (int i = 15; i >= 0; i --, definedTime += 0.5) {
			[linkedEnemies addItem:EnemyDefinition2_Wa Type:1 AtTime:definedTime];
		}
		definedTime += 5.0;
		
		if (gameLevel > 0) {
			definedTime	+= 2.0;
			for (int i = 10; i >= 0; i --, definedTime += 0.2) {
				[linkedEnemies addItem:EnemyDefinition2_Zhi Type:i AtTime:definedTime];		
			}
		}
		[linkedEnemies addItem:EnemyDefinition2_Wen Type:1 AtTime:definedTime];
		definedTime += 3.0;
		[linkedEnemies addItem:EnemyDefinition2_Meng Type:1 AtTime:definedTime];
		
		[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	}
	
	
	finishingTime = definedTime;
}

@end
