//
//  ComposeAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import "ComposeEnemyAction.h"
#import "Enemy.h"
#import "EnemyBuilder.h"
#import "GameConfig.h"

@implementation ComposeEnemyAction

-(id) initWithItem:(EnemyClarification)def Type:(int)type Builder:(EnemyBuilder *)builder PSetter:(PositionSetter *)setter {

	self = [super init];
	item = [EnemyDefinition enemyWithClarification:def Type:type];
	enemyBuilder = builder;
	pSetter = setter;
	return self;
}

+(id) actionWithItem:(EnemyClarification)def Type:(int)type Builder:(EnemyBuilder *)builder {
	return [self actionWithItem:def Type:type Builder:builder PSetter:nil];
}

+(id) actionWithItem:(EnemyClarification)def Type:(int)type Builder:(EnemyBuilder *)builder PSetter:(PositionSetter *)setter {
	
	return [[self alloc] initWithItem:def Type:type Builder:builder PSetter:setter];
}

-(void) execute:(Character *)character {

	Enemy *craft = (Enemy *)character;
	
	CGPoint pos = [craft getPosition];
	
	// Fix Bug: If the enemy is out of scope, this action will be escaped.
	if (pos.x < 0 || pos.x > GAME_SCREEN_WIDTH ||
		pos.y < 0 || pos.y > GAME_SCREEN_HEIGHT) {
		return;
	}
	
	AnimatedCharacter *ch = [enemyBuilder build:item];
	if (pSetter != nil) {
		[pSetter setPosition:ch Accordiance:craft];
	}
	
	[craft addComposedItem:ch];
}

@end
