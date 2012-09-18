//
//  ChapterFour.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import "ChapterFour.h"
#import "EnemyBuilderFour.h"
#import "BackgroundFourController.h"
#import "TransitionFourController.h"

@implementation ChapterFour

-(id) initWithGame:(id<ScreenContainer>)g {
	
	self = [super initWithGame:g];
	
	enemyBuilder = [[EnemyBuilderFour alloc] init];
	
	[self defineEnemies];
	
	chapterIndex = 4;
	
	chapterTitle = @"第四幕  水面";
	statisticsTitle = @"第四幕  突破";
	return self;
}

-(void) initBackgroundController:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {
	
	backgroundController = [[TransitionFourController alloc] initWithLayer:layer1 Backdrop:layer2];
	BackgroundController *mainController = [[BackgroundFourController alloc] initWithLayer:layer1 Backdrop:layer2];
	[backgroundController setNext:mainController];
}

-(void) defineEnemies {
	
	float definedTime = 0;
	
	definedTime += 10.0;
	//definedTime += 2.0;
	
	for (int i = 10; i >= 0; i --, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition4_Lu Type:0 AtTime:definedTime];		
	}
	
	
	definedTime	+= 1.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition4_Lu Type:1 AtTime:definedTime];		
	}
	
	definedTime	+= 3.0;
	for (int i = 0; i < 6; i++, definedTime += 0.15) {
		[linkedEnemies addItem:EnemyDefinition4_Yan Type:i AtTime:definedTime];		
		if (i > 0) {
			[linkedEnemies addItem:EnemyDefinition4_Yan Type:-i AtTime:definedTime];
		}
	}
	for (int i = 0; i < 6; i++, definedTime += 0.15) {
		[linkedEnemies addItem:EnemyDefinition4_Yan Type:i AtTime:definedTime];		
		if (i > 0) {
			[linkedEnemies addItem:EnemyDefinition4_Yan Type:-i AtTime:definedTime];
		}
	}
	
	definedTime	+= 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime	+= 1.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.6) {
		[linkedEnemies addItem:EnemyDefinition4_Yuanyang Type:1 AtTime:definedTime];		
	}
	
	definedTime	+= 5.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.6) {
		[linkedEnemies addItem:EnemyDefinition4_Zhen Type:1 AtTime:definedTime];		
	}
	
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:2 AtTime:definedTime];
	
	definedTime	+= 2.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition4_Que Type:0 AtTime:definedTime];		
	}
	
	definedTime	+= 3.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.3) {
		[linkedEnemies addItem:EnemyDefinition4_Ou Type:1 AtTime:definedTime];		
	}
	
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime	+= 3.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.3) {
		[linkedEnemies addItem:EnemyDefinition4_Ou Type:1 AtTime:definedTime];		
	}
	
	definedTime	+= 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime	+= 4.0;
	for (int i = 20; i >= 0; i --, definedTime += 0.6) {
		[linkedEnemies addItem:EnemyDefinition4_Yuan2 Type:1 AtTime:definedTime];		
	}
	
	definedTime	+= 5.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.3) {
		[linkedEnemies addItem:EnemyDefinition4_Ya Type:1 AtTime:definedTime];		
	}
	
	definedTime	+= 5.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.3) {
		[linkedEnemies addItem:EnemyDefinition4_Ya Type:1 AtTime:definedTime];		
	}
	
	definedTime	+= 5.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.6) {
		[linkedEnemies addItem:EnemyDefinition4_Sun Type:1 AtTime:definedTime];		
	}
	
	definedTime	+= 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime	+= 5.0;
	[linkedEnemies addItem:EnemyDefinition4_Hu Type:1 AtTime:definedTime];		
	
	definedTime	+= 5.0;
	[linkedEnemies addItem:EnemyDefinition4_Ying Type:1 AtTime:definedTime];		
	
	definedTime	+= 3.0;
	for (int i = 10; i >= 0; i --, definedTime += 0.3) {
		[linkedEnemies addItem:EnemyDefinition4_Ya Type:1 AtTime:definedTime];		
	}
	
	definedTime	+= 2.0;
	for (int i = 20; i >= 0; i --, definedTime += 0.6) {
		[linkedEnemies addItem:EnemyDefinition4_Yuan2 Type:1 AtTime:definedTime];		
	}
	
	definedTime	+= 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	
	bossTime = definedTime + 7.0;
	
	definedTime	+= 10.0;
	[linkedEnemies addItem:EnemyDefinition4_Huang Type:1 AtTime:definedTime];		
	
	for (int k = 0; k < 15; k++) {
		
		definedTime	+= 8.0;
		for (int i = 30; i >= 0; i --, definedTime += 0.1) {
			[linkedEnemies addItem:EnemyDefinition4_Feng Type:1 AtTime:definedTime];		
		}
		
		definedTime	+= 10.0;
		for (int i = 10; i >= 0; i --, definedTime += 0.3) {
			[linkedEnemies addItem:EnemyDefinition4_Ya Type:1 AtTime:definedTime];		
		}
		
		definedTime	+= 8.0;
		if (gameLevel > 0) {
			for (int i = 10; i >= 0; i --, definedTime += 0.6) {
				[linkedEnemies addItem:EnemyDefinition4_Zhen Type:1 AtTime:definedTime];		
			}
		}
		definedTime	+= 1.0;
		for (int i = 10; i >= 0; i --, definedTime += 0.6) {
			[linkedEnemies addItem:EnemyDefinition4_Yuanyang Type:1 AtTime:definedTime];		
		}
		
		if (gameLevel > 0) {
			definedTime	+= 5.0;
			for (int i = 10; i >= 0; i --, definedTime += 0.6) {
				[linkedEnemies addItem:EnemyDefinition4_Sun Type:1 AtTime:definedTime];		
			}
		}
		
		definedTime += 5.0;
	}
	
	finishingTime = definedTime;
}


@end
