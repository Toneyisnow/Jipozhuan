//
//  EnemyBuilderOne.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-10.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enemy.h"
#import "EnemyBuilder.h"
#import "EnemyBullet.h"
#import "BossEnemy.h"

@interface EnemyBuilderOne : EnemyBuilder {

}

-(Enemy *) RuoEnemy:(int)type;
-(Enemy *) DiEnemy:(int)type;
-(Enemy *) YingEnemy:(int)type;
-(Enemy *) BiaoLiEnemy:(int)type;
-(Enemy *) SuEnemy:(int)type;
-(Enemy *) QinEnemy:(int)type;
-(Enemy *) QinziEnemy:(int)type;
-(Enemy *) DaEnemy:(int)type;
-(Enemy *) ZhongEnemy:(int)type;
-(Enemy *) XiaoEnemy:(int)type;
-(Enemy *) GongEnemy:(int)type;
-(Enemy *) ShouEnemy:(int)type;
-(Enemy *) XiEnemy:(int)type;
-(Enemy *) TouEnemy:(int)type;
-(Enemy *) TongEnemy:(int)type;
-(Enemy *) WeiEnemy:(int)type;
-(Enemy *) ZhuEnemy:(int)type;
-(Enemy *) CongEnemy:(int)type;

-(Enemy *) zhuiEnemy:(int)type;

-(EnemyBullet *) singleEnemyBullet:(int)type;
-(EnemyBullet *) roundEnemyBullet:(int)type;
//-(EnemyBullet *) chasingEnemyBullet:(int)type;

-(Curve *) simpleDeathCurve;
-(Curve *) toutongweiCurve;
-(Curve *) zhucongCurve:(BOOL)isZhu;
-(Curve *) bossExplodeCurve;
-(Curve *) explodeBulletCurve;
-(Curve *) explodeBulletCurve:(int)level;

@end
