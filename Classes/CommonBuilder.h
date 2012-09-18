//
//  CommonBuilder.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-10.
//  Copyright 2011 ms. All rights reserved.
//

// This class is dreprecated

#import <Foundation/Foundation.h>
#import "Enemy.h"
#import "Supply.h"

@interface CommonBuilder : NSObject {

}

+(Enemy *) LuanEnemy:(int)type;
+(Supply *) BulletSupply:(int)type;

+(Curve *) simpleDeathCurve;
+(CGPoint) getTraceSpeedX:(float)x Y:(float)y Base:(float)base;

+(float) getLeftEdge:(Enemy *)enemy;
+(float) getRightEdge:(Enemy *)enemy;

+(float) getLastInitializePositionY;
+(void) setLastInitializePositionY:(float)val;


@end
