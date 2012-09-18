//
//  EnemyBulletBuilder.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemyBullet.h"
#import "JPInteger.h"

@interface EnemyBulletBuilder : NSObject {

}

+(EnemyBullet *) singleEnemyBulletX:(float)x Y:(float)y;
+(EnemyBullet *) singleEnemyBullet:(JPInteger *)type;
//+(EnemyBullet *) singleEnemyBullet:(int)type;
+(EnemyBullet *) roundEnemyBullet:(JPInteger *)type;
+(EnemyBullet *) chasingEnemyBullet:(JPInteger *)type;

// This is deprecated, should use ChaseAction instead
+(CGPoint) getTraceSpeedX:(float)x Y:(float)y Base:(float)base;

@end
