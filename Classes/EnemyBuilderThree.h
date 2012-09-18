//
//  EnemyBuilderThree.h
//  Jipozhuan
//
//  Created by sui toney on 11-3-10.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enemy.h"
#import "EnemyBuilder.h"
#import "EnemyBullet.h"

@interface EnemyBuilderThree : EnemyBuilder {
	
}

-(Enemy *) BanEnemy:(int)type;
-(Enemy *) TunEnemy:(int)type;
-(Enemy *) XiangEnemy:(int)type;
-(Enemy *) BaoEnemy:(int)type;
-(Enemy *) TaEnemy:(int)type;
-(Enemy *) NiuEnemy:(int)type;
-(Enemy *) HuEnemy:(int)type;
-(Enemy *) XiongEnemy:(int)type;
-(Enemy *) YouEnemy:(int)type;
-(Enemy *) YouChouEnemy:(int)type;
-(Enemy *) Hu2Enemy:(int)type;
-(Enemy *) LiEnemy:(int)type;
-(Enemy *) MaoEnemy:(int)type;
-(Enemy *) ChaiEnemy:(int)type;
-(Enemy *) ShiEnemy:(int)type;
-(Enemy *) LieEnemy:(int)type;
-(Enemy *) ShiMaoEnemy:(int)type;

-(EnemyBullet *) singleEnemyBullet:(int)type;
-(EnemyBullet *) roundEnemyBullet:(int)type;
-(EnemyBullet *) houEnemyBullet:(int)type;

-(CGPoint) animalAnchorPoint;

-(Curve *) simpleDeathCurve;
-(Curve *) explodeBulletCurve;
-(Curve *) explodeBulletCurve:(int)level;
-(Curve *) bossExplodeCurve;

@end
