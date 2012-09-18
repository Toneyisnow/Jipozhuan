//
//  ChapterThree.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import "ChapterThree.h"
#import "EnemyBuilderThree.h"
#import "BackgroundThreeController.h"
#import "TransitionThreeController.h"
#import "GameConfig.h"

@implementation ChapterThree

-(id) initWithGame:(id<ScreenContainer>)g {
	
	self = [super initWithGame:g];
	
	enemyBuilder = [[EnemyBuilderThree alloc] init];
	[self defineEnemies];
	chapterIndex = 3;
	
	chapterTitle = @"第三幕  草原";
	statisticsTitle = @"第三幕  突破";
	return self;
}

-(void) defineEnemies {
	
	float definedTime = 0;
	
	definedTime += 10.0;
	//definedTime += 3.0;
	
	for (int i = 12; i >= 0; i --, definedTime += 0.2) {
		[linkedEnemies addItem:EnemyDefinition3_Ban Type:0 AtTime:definedTime];
		[linkedEnemies addItem:EnemyDefinition3_Ban Type:1 AtTime:definedTime];
	}
	
	definedTime	+= 3.0;
	for (int i = 0 ; i < 8; i ++, definedTime += 0.3) {
		[linkedEnemies addItem:EnemyDefinition3_Hu2 Type:1 AtTime:definedTime];
		[linkedEnemies addItem:EnemyDefinition3_Li Type:1 AtTime:definedTime];
	}
	
	
	definedTime	+= 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime	+= 2.5;
	for (int i = 0 ; i < 5; i ++, definedTime += 1.0) {
		[linkedEnemies addItem:EnemyDefinition3_Niu Type:1 AtTime:definedTime];
	}
	
	definedTime += 2.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime	+= 2.5;
	for (int i = 0 ; i < 5; i ++, definedTime += 1.0) {
		[linkedEnemies addItem:EnemyDefinition3_Niu Type:1 AtTime:definedTime];
	}
	
	definedTime	+= 4.0;
	[linkedEnemies addItem:EnemyDefinition3_Chai Type:1 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition3_Chai Type:2 AtTime:definedTime];
	
	definedTime	+= 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:2 AtTime:definedTime];
	
	definedTime	+= 3.0;
	for (int i = 0 ; i < 8; i ++, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition3_Hu Type:1 AtTime:definedTime];
	}
	
	definedTime	+= 3.0;
	[linkedEnemies addItem:EnemyDefinition3_You Type:1 AtTime:definedTime];
	
	definedTime	+= 3.0;
	for (int i = 0 ; i < 8; i ++, definedTime += 0.3) {
		[linkedEnemies addItem:EnemyDefinition3_Hu2 Type:1 AtTime:definedTime];
		[linkedEnemies addItem:EnemyDefinition3_Li Type:1 AtTime:definedTime];
	}
	
	definedTime	+= 3.0;
	[linkedEnemies addItem:EnemyDefinition3_Xiong Type:1 AtTime:definedTime];
	
	definedTime	+= 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime	+= 7.0;
	for (int i = 0 ; i < 8; i ++, definedTime += 0.5) {
		[linkedEnemies addItem:EnemyDefinition3_Bao Type:1 AtTime:definedTime];
	}
	
	definedTime	+= 3.0;
	[linkedEnemies addItem:EnemyDefinition3_Ta Type:1 AtTime:definedTime];
	definedTime	+= 3.0;
	[linkedEnemies addItem:EnemyDefinition3_Ta Type:1 AtTime:definedTime];
	
	definedTime	+= 3.0;
	[linkedEnemies addItem:EnemyDefinition3_Xiong Type:1 AtTime:definedTime];
	
	definedTime	+= 1.0;
	[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
	
	definedTime	+= 8.0;
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:1 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:2 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:4 AtTime:definedTime];
	definedTime	+= 2.5;
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:1 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:3 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:4 AtTime:definedTime];
	definedTime	+= 2.5;
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:2 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:3 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:4 AtTime:definedTime];
	definedTime	+= 2.5;
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:1 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:2 AtTime:definedTime];
	[linkedEnemies addItem:EnemyDefinition3_Mao Type:3 AtTime:definedTime];
	
	
	bossTime = definedTime + 6.0;
	definedTime	+= 9.0;
	[linkedEnemies addItem:EnemyDefinition3_Shi Type:1 AtTime:definedTime];
	
	for (int k = 0; k < 20; k++) {
		
		definedTime	+= 14.0;
		for (int i = 0; i < 5; i++, definedTime += 1.0) {
			[linkedEnemies addItem:EnemyDefinition3_Niu Type:1 AtTime:definedTime];
		}
		definedTime	+= 8.0;
		[linkedEnemies addItem:EnemyDefinition3_Chai Type:1 AtTime:definedTime];
		[linkedEnemies addItem:EnemyDefinition3_Chai Type:2 AtTime:definedTime];
		
		definedTime	+= 3.0;
		[linkedEnemies addItem:EnemyDefinition3_Xiong Type:1 AtTime:definedTime];
		
		if (gameLevel == 0) {
			definedTime	+= 1.0;
			[linkedEnemies addItem:EnemyDefinition0_Luan Type:1 AtTime:definedTime];
			
		}
		definedTime	+= 5.0;
		[linkedEnemies addItem:EnemyDefinition3_You Type:1 AtTime:definedTime];
	}
	
	finishingTime = definedTime;
}

-(void) initBackgroundController:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {
	
	backgroundController = [[TransitionThreeController alloc] initWithLayer:layer1 Backdrop:layer2];
	BackgroundController *mainController = [[BackgroundThreeController alloc] initWithLayer:layer1 Backdrop:layer2];
	[backgroundController setNext:mainController];
}



@end
