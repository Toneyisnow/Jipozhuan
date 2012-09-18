//
//  ChapterOne.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import "ChapterOne.h"
#import "EnemyBuilderOne.h"
#import "TransitionOneController.h"
#import "BackgroundOneController.h"


@implementation ChapterOne

-(id) initWithGame:(id<ScreenContainer>)g {
	
	self = [super initWithGame:g];
	
	enemyBuilder = [[EnemyBuilderOne alloc] init];
	[self defineEnemies];
	
	chapterIndex = 1;
	chapterTitle = @"第一幕  城市";
	statisticsTitle = @"第一幕  突破";
	return self;
}

-(void) initBackgroundController:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {
	
	backgroundController = [[TransitionOneController alloc] initWithLayer:layer1 Backdrop:layer2];
	BackgroundController *mainController = [[BackgroundOneController alloc] initWithLayer:layer1 Backdrop:layer2];
	[backgroundController setNext:mainController];
}

-(void) defineEnemies {
	
	float definedTime = 0;
	
	definedTime += 2.0;
	
	/*
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	*/
	
	int count = 12;
	float interval = 0.8;
	if (gameLevel == 1) {
		count = 16;
		interval = 0.6;
	}
	for (int i = 0; i < count; i ++) {
		[linkedEnemies addItem:EnemyDefinition1_Ruo Type:2 AtTime:definedTime];
		[linkedEnemies addItem:EnemyDefinition1_Ruo Type:1 AtTime:definedTime];
		definedTime += interval;
	}
	
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	for (int i = 0; i < 5; i ++) {
		[linkedEnemies addItem:EnemyDefinition1_Di Type:1 AtTime:definedTime];
		definedTime += 0.5;
	}
	
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition1_Qin Type:1 AtTime:definedTime];
	definedTime += 0.3;
	for (int i = 0; i < 10; i ++, definedTime += 0.3) {
		[linkedEnemies addItem:EnemyDefinition1_Qinzi Type:1 AtTime:definedTime];
	}
	
	definedTime += 3.0;
	[linkedEnemies addItem:EnemyDefinition1_Ying Type:1 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition1_Ying Type:2 AtTime:definedTime];
	
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime += 5.0;
	for (int i = 0; i < 5; i++) {
		[linkedEnemies addItem:EnemyDefinition1_BiaoLi Type:1 AtTime:definedTime];
		if (i == 2 || i == 4) {
			[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
		}
		definedTime += 1.5;
	}
	
	definedTime += 5.0;
	[linkedEnemies addItem:EnemyDefinition1_Shou Type:1 AtTime:definedTime];
	definedTime += 0.8;
	[linkedEnemies addItem:EnemyDefinition1_Gong Type:1 AtTime:definedTime];
	definedTime += 5.0;
	
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:2 AtTime:definedTime];
	
	[linkedEnemies addItem:EnemyDefinition1_Shou Type:1 AtTime:definedTime];
	definedTime += 0.8;
	[linkedEnemies addItem:EnemyDefinition1_Gong Type:1 AtTime:definedTime];
	
	definedTime += 5.0;
	[linkedEnemies addItem:EnemyDefinition1_Shou Type:1 AtTime:definedTime];
	definedTime += 0.8;
	[linkedEnemies addItem:EnemyDefinition1_Gong Type:1 AtTime:definedTime];
	definedTime += 2.0;
	
	definedTime += 5.0;
	for (int i = 0; i < 50; i++) {
		[linkedEnemies addItem:EnemyDefinition1_Su Type:1 AtTime:definedTime];
		definedTime += 0.25; 
	}
	
	definedTime += 2.0;
	if (gameLevel == 1) {
		count = 16;
		interval = 0.6;
	}
	for (int i = 0; i < count; i ++) {
		[linkedEnemies addItem:EnemyDefinition1_Ruo Type:2 AtTime:definedTime];
		[linkedEnemies addItem:EnemyDefinition1_Ruo Type:1 AtTime:definedTime];
		definedTime += interval;
	}
	
	definedTime += 5.0;
	for (int i = 0; i < 5; i ++) {
		[linkedEnemies addItem:EnemyDefinition1_Xi Type:1 AtTime:definedTime];
		definedTime += 1.5;
	}
	
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime += 3.0;
	for (int i = 0; i < 5; i++) {
		[linkedEnemies addItem:EnemyDefinition1_Da Type:1 AtTime:definedTime];
		definedTime += 2.0; 
	}
	
	definedTime += 2.0;
	for (int i = 0; i < 5; i++) {
		[linkedEnemies addItem:EnemyDefinition1_Da Type:1 AtTime:definedTime];
		definedTime += 2.0;
	}
	
	definedTime += 2.0;
	if (gameLevel == 0) {
		[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	}
	
	[linkedEnemies addItem:EnemyDefinition1_Tou Type:1 AtTime:definedTime];
	definedTime += 0.2;
	for (int i = 0; i < 10; i ++, definedTime += 0.2) {
		[linkedEnemies addItem:EnemyDefinition1_Tong Type:1 AtTime:definedTime];
	}
	[linkedEnemies addItem:EnemyDefinition1_Wei Type:1 AtTime:definedTime];
	
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime += 2.0;
	for (int i = 0; i < 5; i ++) {
		[linkedEnemies addItem:EnemyDefinition1_Xi Type:1 AtTime:definedTime];
		definedTime += 1.5;
	}
	
	definedTime += 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	
	bossTime = definedTime + 4.0;
	definedTime += 8.0;
	
	[linkedEnemies addItem:EnemyDefinition1_Cong Type:1 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition1_Zhu Type:1 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition1_Cong Type:2 AtTime:definedTime];
	
	for (int k = 0; k < 20; k++) {
		
		definedTime += 10.0;
		
		if(gameLevel == 0) {
			for (int i = 0; i < 5; i ++) {
				[linkedEnemies addItem:EnemyDefinition1_Xi Type:1 AtTime:definedTime];
				definedTime += 1.5;
			}
		}
		
		definedTime += 1.0;
		[linkedEnemies addItem:EnemyDefinition1_Shou Type:1 AtTime:definedTime];
		definedTime += 0.8;
		[linkedEnemies addItem:EnemyDefinition1_Gong Type:1 AtTime:definedTime];
		definedTime += 2.0;
		
		for (int i = 0; i < 5; i ++) {
			[linkedEnemies addItem:EnemyDefinition1_Di Type:1 AtTime:definedTime];
			definedTime += 0.5;
		}
		
		definedTime += 2.0;
		if(gameLevel == 0) {
			[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
		}
	}
	
	finishingTime = definedTime;
}

@end
