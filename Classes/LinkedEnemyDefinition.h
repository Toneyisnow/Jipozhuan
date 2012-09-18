//
//  LinkedEnemyDefinition.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-28.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemyBuilder.h"

@interface LinkedEnemyDefinition : NSObject
{
	int itemTick;
	EnemyDefinition *definition;
	//int enemyType;
	LinkedEnemyDefinition *nextItem;
}

-(id) initItem:(EnemyClarification)def Type:(int)type At:(int)tick;
-(void) setNext:(LinkedEnemyDefinition *)linkedItem;
-(EnemyDefinition *)getItem;
//-(int) getEnemyType;
-(LinkedEnemyDefinition *)getNext;
-(int) getTick;

-(void) addItem:(EnemyClarification)def Type:(int)type At:(int)tick;
-(void) addItem:(EnemyClarification)def Type:(int)type AtTime:(float)time;


@end
