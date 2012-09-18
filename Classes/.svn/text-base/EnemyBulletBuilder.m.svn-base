//
//  EnemyBulletBuilder.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import "EnemyBulletBuilder.h"
#import "Hero.h"
#import "Common.h"
#import "ChaseAction.h"
#import "ChasingAction.h"

@implementation EnemyBulletBuilder

+(EnemyBullet *) singleEnemyBulletX:(float)x Y:(float)y {
	
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"弹" Size:15];
	
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	[bullet setPositionX:x Y:y];
	CGPoint dp = [self getTraceSpeedX:x Y:y Base:120];
	[bullet setSpeedX:dp.x Y:dp.y];
	
	return bullet;
}

+(EnemyBullet *) singleEnemyBullet:(JPInteger *)type {

	//NSLog(@"Composing singleEnemyBullet.");
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"弹" Size:15];
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	Curve *curve = [[Curve alloc] init];
	ChaseAction *action = [ChaseAction actionWithParam:120];
	[curve addAction:action Tick:0];
	[bullet setDefaultCurve:curve];
	
	return bullet;
}
/*
+(EnemyBullet *) singleEnemyBullet:(int)type {
	
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"弹" Size:15];
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	Curve *curve = [[Curve alloc] init];
	ChaseAction *action = [ChaseAction actionWithParam:120];
	[curve addAction:action Tick:0];
	[bullet setDefaultCurve:curve];
	
	return bullet;
}
*/

+(EnemyBullet *) roundEnemyBullet:(JPInteger *)type {

	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"弹" Size:18];
	
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	double delta = (type.value/48.0)*6.28;
	[bullet setSpeedX:sin(delta)*120 Y:cos(delta)*120];
	// 0-23
	
	return bullet;
}

+(EnemyBullet *) chasingEnemyBullet:(JPInteger *)type {
	
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"追" Size:25];
	[bullet setSpeedX:100 Y:[Common getRandomFrom:-120 To:120]];
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	Curve *curve = [[Curve alloc] init];
	ChasingAction *action = [ChasingAction actionWithParam:30 Duration:1.0];
	[curve addAction:action Time:0.5];
	[bullet setDefaultCurve:curve];
	
	return bullet;
}

+(CGPoint) getTraceSpeedX:(float)x Y:(float)y Base:(float)base {
	
	Hero *hero = [Hero getCurrentHero];
	float vx = [hero getPosition].x - x;
	float vy = [hero getPosition].y - y;
	
	vx += [Common getRandomFrom:-50 To:50];
	vy += [Common getRandomFrom:-50 To:50];
	
	float total = abs(vx) + abs(vy);
	float dx = base * vx / total;
	float dy = base * vy / total;
	
	return CGPointMake(dx, dy);
}

@end
