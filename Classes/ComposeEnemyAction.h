//
//  ComposeAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"
#import "EnemyDefinition.h"
#import "EnemyBuilder.h"
#import "PositionSetter.h"

@interface ComposeEnemyAction : AbstractAction {

	EnemyDefinition *item;
	EnemyBuilder *enemyBuilder;
	//int enemyType;
	PositionSetter *pSetter;
}

+(id) actionWithItem:(EnemyClarification)def Type:(int)type Builder:(EnemyBuilder *)builder PSetter:(PositionSetter *)setter;
+(id) actionWithItem:(EnemyClarification)def Type:(int)type Builder:(EnemyBuilder *)builder;

@end
