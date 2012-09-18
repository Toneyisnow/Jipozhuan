//
//  LinkedEnemyDefinition.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-28.
//  Copyright 2011 ms. All rights reserved.
//

#import "LinkedEnemyDefinition.h"
#import "Constants.h"

@implementation LinkedEnemyDefinition

-(id) initItem:(EnemyClarification)def Type:(int)type At:(int)tick {
	self = [super init];
	definition = [EnemyDefinition enemyWithClarification:def Type:type];
	//enemyType = type;
	itemTick = tick;
	nextItem = nil;
	return self;
}

-(id) init {
	
	self = [super init];
	definition = nil;
	nextItem = nil;
	return self;
}

-(void) addItem:(EnemyClarification)def Type:(int)type AtTime:(float)time {

	return [self addItem:def Type:type At:(int)(time * [Constants gameFPS])];
}

-(void) addItem:(EnemyClarification)def Type:(int)type At:(int)tick {
	
	if (def == EnemyDefinition_Null) {
		NSLog(@"AddItem: should not add EnemyDefinition_Null.");
		return;
	}
	
	if (definition == nil) {
		definition = [EnemyDefinition enemyWithClarification:def Type:type];
		itemTick = tick;
	} else {
		
		LinkedEnemyDefinition *link = self;
		while ([link getNext] != nil) {
			link = [link getNext];
		}
		
		LinkedEnemyDefinition *linkedItem = [[LinkedEnemyDefinition alloc] initItem:def Type:type At:tick];
		[link setNext: linkedItem];
	}
}

-(int) getTick {
	
	return itemTick;
}

-(EnemyDefinition *) getItem {
	return definition;
}

-(LinkedEnemyDefinition *) getNext {
	
	return nextItem;
}

-(void) setNext:(LinkedEnemyDefinition *)linkedItem {
	
	nextItem = linkedItem;
}

@end
