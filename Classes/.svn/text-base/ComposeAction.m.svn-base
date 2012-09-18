//
//  ComposeAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import "ComposeAction.h"
#import "Enemy.h"

@implementation ComposeAction

-(id) initWithItem:(EnemyClarification)def Type:(int)type {

	self = [super init];
	item = [EnemyDefinition enemyWithClarification:def Type:type];
	return self;
}

+(id) actionWithItem:(EnemyClarification)def Type:(int)type {
	
	return [[self alloc] initWithItem:def Type:type];
}

-(void) execute:(Character *)character {

	Enemy *craft = (Enemy *)character;
	[craft addComposedItem:item];
}

@end
