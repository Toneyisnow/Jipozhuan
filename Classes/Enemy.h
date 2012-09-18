//
//  Enemy.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-17.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AirCraft.h"
#import "EnemyDefinition.h"
#import "AbstractAction.h"

@interface Enemy : AirCraft {

	NSMutableArray *composedEnemyDefinitions;
	
	AbstractAction *onHitAction;
	AbstractAction *otherTriggeredAction;
	
	int enemyHeadCount;
	int enemyScore;
	
	BOOL _hasRelatedEnemy;
	Enemy *relatedEnemy1;
	Enemy *relatedEnemy2;
	
	BOOL shouldBeKilled;
	
	int enemyStatus;		// 0: Normal  1: Exploding
}

-(void) addComposedEnemyDefinition:(EnemyDefinition *)item;

-(void) setHitAction:(AbstractAction *)action;
-(void) setOtherTriggeredAction:(AbstractAction *)action;

-(void) setEnemyHeadCount:(int)val;
-(int) getEnemyHeadCount;
-(void) setEnemyScore:(int)val;
-(int) getEnemyScore;

-(void) setHasRelatedEnemy:(BOOL)val;
-(BOOL) hasRelatedEnemy;
-(void) setRelatedEnemy1:(Enemy *)enemy;
-(void) setRelatedEnemy2:(Enemy *)enemy;

-(void) setShouldbeKilled:(BOOL)val;


@end
