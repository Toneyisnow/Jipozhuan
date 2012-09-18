//
//  EnemyStore.h
//  Jipozhuan
//
//  Created by sui toney on 10-12-6.
//  Copyright 2010 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemyDefinition.h"
#import "Enemy.h"
#import "Supply.h"

@interface EnemyBuilder : NSObject {
	
	float lastInitializePositionY;
	int gameLevel;	// 0: Easy	1: Medium	2: Hard
}

-(SolidCharacter *) build:(EnemyDefinition *) definition;
-(SolidCharacter *) build:(EnemyClarification)clarification Type:(int)type;

-(Enemy *) LuanEnemy:(int)type;
-(Supply *) BulletSupply:(int)type;
-(Supply *) FriendSupply:(int)type;

// This is deprecated, should use ChaseAction instead
-(CGPoint) getTraceSpeedX:(float)x Y:(float)y Base:(float)base;

-(float) getTopEdge:(Enemy *)enemy;
-(float) getBottomEdge:(Enemy *)enemy;
-(float) getLeftEdge:(Enemy *)enemy;
-(float) getRightEdge:(Enemy *)enemy;

-(float) getLastInitializePositionY;
-(void) setLastInitializePositionY:(float)val;

@end

