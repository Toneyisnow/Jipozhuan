//
//  EnemyBuilderOne.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "BossEnemy.h"
#import "EnemyBuilderOne.h"
#import "EnemyBulletBuilder.h"
//#import "CommonBuilder.h"
#import "GameConfig.h"
#import "Common.h"
#import "AbstractAction.h"
#import "SetSpeedAction.h"
#import "ChangeSpeedAction.h"
#import "SetCharacterAction.h"
#import "FadeoutAction.h"
#import "SetColorAction.h"
#import "SlowDownAction.h"
#import "FlapAction.h"
#import "SwingAction.h"
#import "SetShootingAction.h"
#import "SwitchToAction.h"
#import "ComposeEnemyAction.h"
#import "SetSolidAction.h"
#import "ColorfulAction.h"
#import "ComposingAction.h"
#import "HelixSpeedAction.h"
#import "CircleSpeedAction.h"
#import "ExplodeAction.h"
#import "ChaseAction.h"
#import "ChasingAction.h"

@implementation EnemyBuilderOne

-(SolidCharacter *) build:(EnemyClarification)clarification Type:(int)type {
	
	switch (clarification) {
		case EnemyDefinition0_Luan:
			return [self LuanEnemy:type]; break;
		case EnemyDefinition1_Ruo:
			return [self RuoEnemy:type]; break;
		case EnemyDefinition1_Di:
			return [self DiEnemy:type]; break;
		case EnemyDefinition1_Ying:
			return [self YingEnemy:type]; break;
		case EnemyDefinition1_BiaoLi:
			return [self BiaoLiEnemy:type]; break;
		case EnemyDefinition1_Su:
			return [self SuEnemy:type]; break;
		case EnemyDefinition1_Qin:
			return [self QinEnemy:type]; break;
		case EnemyDefinition1_Qinzi:
			return [self QinziEnemy:type]; break;
		case EnemyDefinition1_Da:
			return [self DaEnemy:type]; break;
		case EnemyDefinition1_Zhong:
			return [self ZhongEnemy:type]; break;
		case EnemyDefinition1_Xiao:
			return [self XiaoEnemy:type]; break;
		case EnemyDefinition1_Gong:
			return [self GongEnemy:type]; break;
		case EnemyDefinition1_Shou:
			return [self ShouEnemy:type]; break;
		case EnemyDefinition1_Xi:
			return [self XiEnemy:type]; break;
		case EnemyDefinition1_Tou:
			return [self TouEnemy:type]; break;
		case EnemyDefinition1_Tong:
			return [self TongEnemy:type]; break;
		case EnemyDefinition1_Wei:
			return [self WeiEnemy:type]; break;
		case EnemyDefinition1_Zhu:
			return [self ZhuEnemy:type]; break;
		case EnemyDefinition1_Cong:
			return [self CongEnemy:type]; break;
		case SupplyDefinition_Bullet:
			return [self BulletSupply:type]; break;
		case SupplyDefinition_Friend:
			return [self FriendSupply:type]; break;
		case EnemyBulletDefinition_Simple:
			return [self singleEnemyBullet:type]; break;
		case EnemyBulletDefinition_Chasing:
			return [self zhuiEnemy:type]; break;
		case EnemyBulletDefinition_Round:
			return [self roundEnemyBullet:type]; break;
			
		default:
			NSLog(@"Enemy definition is not found: %@", clarification);
			return nil;
			break;
	}
}

-(Enemy *) RuoEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"弱" Size:35];
	[enemy setColor:[Color R:255 G:255 B:0]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:((type==1)?120:GAME_SCREEN_HEIGHT-120)];
	[enemy setSpeedX:-100 Y:0];
	
	if (gameLevel == 0) {
		enemy.health = 10;
	} else if (gameLevel == 1) {
		enemy.health = 10;
	}
	
	Curve *curve = [[Curve alloc] init];
	
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:-55 Y:((type==1)?-55:55)];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:-80 Y:0];
	[curve addAction:action1 Time:1.5];
	if (gameLevel == 1) {
		ComposeEnemyAction *actionX = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
		[curve addAction:actionX Time:[Common getRandomFrom:1.6 To:2.2]];
	}
	[curve addAction:action2 Time:2.3];
	
	if (gameLevel == 1) {
		ComposeEnemyAction *actionX = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
		[curve addAction:actionX Time:[Common getRandomFrom:3.1 To:5.0]];
	}
	SetSpeedAction *action3 = [SetSpeedAction actionWithSpeedX:0 Y:((type==1)?-80:80)];
	SetSpeedAction *action4 = [SetSpeedAction actionWithSpeedX:80 Y:0];
	[curve addAction:action3 Time:3.8];
	[curve addAction:action4 Time:4.2];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) YingEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"硬" Size:45];
	[enemy setColor:[Color R:70 G:70 B:50]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:((type==1)?80:GAME_SCREEN_HEIGHT-80)];
	[enemy setSpeedX:(gameLevel==0)?-60:-80 Y:0];
	enemy.health = 180;
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:-60 Y:0];
	
	[curve addAction:action1 Tick:50];
	[curve addAction:action2 Tick:70];
	[enemy setDefaultCurve:curve];
	
	[enemy setHitAction:[SetColorAction actionWithColor:[Color R:0 G:0 B:0]]];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve:3]];
	}
	
	return enemy;
}

-(Enemy *) DiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"敌" Size:40];
	[enemy setColor:[Color R:255 G:255 B:50]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:50 To:260]];
	float speedY = (GAME_SCREEN_HEIGHT/2 - [enemy getPosition].y)/8;
	[enemy setSpeedX:-100+speedY Y:-speedY];
	
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action10 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	ComposeEnemyAction *action11 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	SetSpeedAction *action20 = [SetSpeedAction actionWithSpeedX:100-speedY Y:-speedY];
	
	[curve addAction:action10 Tick:48];
	[curve addAction:action11 Tick:48];
	[curve addAction:action20 Tick:80];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) BiaoLiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"表" Size:35];
	[enemy setColor:[Color R:27 G:27 B:80]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:20 To:GAME_SCREEN_HEIGHT - 20]];
	[enemy setSpeedX:-80 Y:0];
	[enemy setSolid:FALSE];
	enemy.health = 20;
	
	float rate = (gameLevel == 0)? 0.3 : 0.45;
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action110 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	SwitchToAction *action111 = [SwitchToAction actionWithChar:@"里" Rate:rate];
	ComposeEnemyAction *action112a = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action112b = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action112c = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	SetSolidAction *action113 = [SetSolidAction actionWithSolid:TRUE Invincible:FALSE];
	
	SwitchToAction *action120 = [SwitchToAction actionWithChar:@"表" Rate:rate];
	SetSpeedAction *action122 = [SetSpeedAction actionWithSpeedX:80 Y:0];
	SetSolidAction *action123 = [SetSolidAction actionWithSolid:FALSE Invincible:FALSE];
	
	SetSpeedAction *action210 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	SwitchToAction *action211 = [SwitchToAction actionWithChar:@"里" Rate:rate];
	ComposeEnemyAction *action212a = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action212b = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action212c = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	SetSolidAction *action213 = [SetSolidAction actionWithSolid:TRUE Invincible:FALSE];
	
	SwitchToAction *action220 = [SwitchToAction actionWithChar:@"表" Rate:rate];
	SetSpeedAction *action222 = [SetSpeedAction actionWithSpeedX:80 Y:0];
	SetSolidAction *action223 = [SetSolidAction actionWithSolid:FALSE Invincible:FALSE];
	
	[curve addAction:action110 Tick:60];
	[curve addAction:action111 Tick:60];
	[curve addAction:action112a Tick:63];
	if (gameLevel > 0) {
		[curve addAction:action112b Tick:63];
		[curve addAction:action112c Tick:63];
	}
	[curve addAction:action113 Tick:63];
	[curve addAction:action120 Tick:72];
	[curve addAction:action122 Tick:78];
	[curve addAction:action123 Tick:78];
	
	[curve addAction:action210 Tick:120];
	[curve addAction:action211 Tick:120];
	[curve addAction:action212a Tick:123];
	if (gameLevel > 0) {
		[curve addAction:action212b Tick:123];
		[curve addAction:action212c Tick:123];
	}
	[curve addAction:action213 Tick:123];
	[curve addAction:action220 Tick:132];
	[curve addAction:action222 Tick:138];
	[curve addAction:action223 Tick:138];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) SuEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"束" Size:35];
	[enemy setColor:[Color R:127 G:55 B:127]];
	
	float posX = [self getRightEdge:enemy];
	float posY = [Common getRandomFrom:30 To:GAME_SCREEN_HEIGHT - 30];
	
	[enemy setPositionX:posX Y:posY];
	CGPoint dp = [self getTraceSpeedX:posX Y:posY Base:400];
	[enemy setSpeedX:dp.x Y:dp.y];
	
	enemy.health = 20;
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) QinEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"亲" Size:35];
	[enemy setColor:[Color R:50 G:80 B:50]];
	
	float posX = [self getRightEdge:enemy];
	float posY = [Common getRandomFrom:100 To:GAME_SCREEN_HEIGHT - 30];
	[self setLastInitializePositionY:posY];
	[enemy setPositionX:posX Y:posY];
	[enemy setSpeedX:-70 Y:-50];
	
	if (gameLevel == 0) {
		enemy.health = 100;
	} else if (gameLevel == 1) {
		enemy.health = 150;
	}
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action11 = [SetSpeedAction actionWithSpeedX:-70 Y:50];
	[curve addAction:action11 Time:2.5];
	SetSpeedAction *action21 = [SetSpeedAction actionWithSpeedX:70 Y:50];
	[curve addAction:action21 Time:5.0];
	if (gameLevel == 1) {
		ComposeEnemyAction *actionX = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
		[curve addAction:actionX Time:[Common getRandomFrom:5 To:7]];
	}
	
	SetSpeedAction *action31 = [SetSpeedAction actionWithSpeedX:70 Y:-50];
	[curve addAction:action31 Time:7.5];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	return enemy;
}

-(Enemy *) QinziEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"子" Size:35];
	[enemy setColor:[Color R:50 G:80 B:50]];
	[enemy setOpacity:150];
	float posX = [self getRightEdge:enemy];
	float posY = [self getLastInitializePositionY];
	[enemy setPositionX:posX Y:posY];
	[enemy setSpeedX:-70 Y:-50];
	
	enemy.health = 15;
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action11 = [SetSpeedAction actionWithSpeedX:-70 Y:50];
	[curve addAction:action11 Time:2.5];
	
	if (gameLevel == 1 && [Common getRandomFrom:0 To:10] < 3) {
		ComposeEnemyAction *actionX = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
		[curve addAction:actionX Time:[Common getRandomFrom:3 To:5]];
	}
	
	SetSpeedAction *action21 = [SetSpeedAction actionWithSpeedX:70 Y:50];
	SetSpeedAction *action31 = [SetSpeedAction actionWithSpeedX:70 Y:-50];
	[curve addAction:action21 Time:5];
	[curve addAction:action31 Time:7.5];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	return enemy;
}

-(Enemy *) DaEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"大" Size:110];
	[enemy setColor:[Color R:255 G:255 B:0]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:50 To:(GAME_SCREEN_HEIGHT - 100)]];
	[enemy setSpeedX:-140 Y:20];
	enemy.health = 40;
	[enemy setEnemyScore:200];	
	[enemy setEnemyHeadCount:3];
	Curve *deathCurve = [[Curve alloc] init];
	ComposeEnemyAction *action11 = [ComposeEnemyAction actionWithItem:EnemyDefinition1_Zhong Type:1 Builder:self];
	ComposeEnemyAction *action12 = [ComposeEnemyAction actionWithItem:EnemyDefinition1_Zhong Type:2 Builder:self];
	ComposeEnemyAction *action21 = [ComposeEnemyAction actionWithItem:EnemyDefinition1_Xiao Type:1 Builder:self];
	ComposeEnemyAction *action22 = [ComposeEnemyAction actionWithItem:EnemyDefinition1_Xiao Type:2 Builder:self];
	[deathCurve addAction:action11 Tick:0];
	[deathCurve addAction:action12 Tick:0];
	[deathCurve addAction:action21 Tick:0];
	[deathCurve addAction:action22 Tick:0];
	[deathCurve setTimeout:1];
	[enemy setExplodeCurve:deathCurve];
	
	return enemy;
}	

-(Enemy *) ZhongEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"中" Size:70];
	[enemy setColor:[Color R:200 G:200 B:0]];
	//[enemy setPositionX:[self getRightEdge:enemy] Y:200];
	[enemy setPositionX:0 Y:0];
	switch (type) {
		case 1:
			[enemy setSpeedX:-30 Y:80];break;
		case 2:
			[enemy setSpeedX:30 Y:80];break;
			
		default:
			break;
	}
	enemy.health = 20;
	
	Curve *curve = [[Curve alloc] init];
	ChangeSpeedAction *action = [ChangeSpeedAction actionWithDX:0 DY:-5 TX:0 TY:-200 Duration:240];
	[curve addAction:action Tick:0];
	[enemy setDefaultCurve:curve];
	
	Curve *deathCurve = [[Curve alloc] init];
	ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyDefinition1_Xiao Type:1 Builder:self];
	ComposeEnemyAction *action2 = [ComposeEnemyAction actionWithItem:EnemyDefinition1_Xiao Type:2 Builder:self];
	[deathCurve addAction:action1 Tick:0];
	[deathCurve addAction:action2 Tick:0];
	[deathCurve setTimeout:1];
	[enemy setExplodeCurve:deathCurve];
	
	return enemy;
}

-(Enemy *) XiaoEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"小" Size:40];
	[enemy setColor:[Color R:127 G:127 B:0]];
	//[enemy setPositionX:[self getRightEdge:enemy] Y:200];
	[enemy setPositionX:0 Y:0];
	[enemy setEnemyScore:50];
	
	switch (type) {
		case 1:
			[enemy setSpeedX:-50 Y:60];break;
		case 2:
			[enemy setSpeedX:50 Y:60];break;
			
		default:
			break;
	}
	enemy.health = 10;
	
	Curve *curve = [[Curve alloc] init];
	ChangeSpeedAction *action = [ChangeSpeedAction actionWithDX:0 DY:-3 TX:0 TY:-500 Duration:240];
	[curve addAction:action Tick:0];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) ShouEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"守" Size:60];
	[enemy setColor:[Color R:27 G:27 B:50]];
	
	float posY = [Common getRandomFrom:150 To:220];
	[self setLastInitializePositionY:posY];
	[enemy setPositionX:[self getRightEdge:enemy] Y:posY];
	[enemy setSpeedX:-100 Y:0];
	enemy.health = 250;
	[enemy setEnemyScore:200];
	
	Curve *curve = [[Curve alloc] init];
	
	float actionTime = 1.0;
	
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:0 Y:-100];
	[curve addAction:action1 Time:actionTime];
	
	actionTime += 0.5;
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:0 Y:100];
	[curve addAction:action2 Time:actionTime];
	
	for (int i = 0; i < 5; i ++) {
		actionTime += 1.0;
		SetSpeedAction *action3 = [SetSpeedAction actionWithSpeedX:0 Y:-100];
		[curve addAction:action3 Time:actionTime];
		
		actionTime += 1.0;
		SetSpeedAction *action4 = [SetSpeedAction actionWithSpeedX:0 Y:100];
		[curve addAction:action4 Time:actionTime];
	}
	actionTime += 1.0;
	SetSpeedAction *action6 = [SetSpeedAction actionWithSpeedX:200 Y:0];
	[curve addAction:action6 Time:actionTime];
	
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve:4]];
	}
	
	return enemy;
}

-(Enemy *) GongEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"攻" Size:40];
	[enemy setColor:[Color R:27 G:27 B:50]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[self getLastInitializePositionY]];
	[enemy setSpeedX:-100 Y:0];
	enemy.health = 50;
	
	Curve *curve = [[Curve alloc] init];
	
	float actionTime = 0.7;
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:0 Y:-100];
	[curve addAction:action1 Time:actionTime];
	
	actionTime += 0.5;
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:0 Y:100];
	[curve addAction:action2 Time:actionTime];
	
	for (int i = 0; i < 5; i ++) {
		
		actionTime += 1.0;
		SetSpeedAction *action3 = [SetSpeedAction actionWithSpeedX:0 Y:-100];
		[curve addAction:action3 Time:actionTime];
		
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
		[curve addAction:action Time:actionTime+0.3];
		
		actionTime += 1.0;
		SetSpeedAction *action4 = [SetSpeedAction actionWithSpeedX:0 Y:100];
		[curve addAction:action4 Time:actionTime];
	}
	actionTime += 1.0;
	SetSpeedAction *action6 = [SetSpeedAction actionWithSpeedX:200 Y:0];
	[curve addAction:action6 Time:actionTime];
	
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) XiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"袭" Size:35];
	[enemy setColor:[Color R:55 G:57 B:150]];
	
	[enemy setPositionX:[self getLeftEdge:enemy] Y:[Common getRandomFrom:50 To:280]];
	[enemy setSpeedX:100 Y:0];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	ComposeEnemyAction *action10 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action11 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:[Common getRandomFrom:50 To:150] Y:[Common getRandomFrom:-100 To:100]];
	SetSpeedAction *action3 = [SetSpeedAction actionWithSpeedX:[Common getRandomFrom:-150 To:-50] Y:[Common getRandomFrom:-100 To:100]];
	ComposeEnemyAction *action30 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	[curve addAction:action1 Time:1.0];
	[curve addAction:action10 Time:1.5];
	[curve addAction:action11 Time:1.5];
	[curve addAction:action2 Time:2.0];
	[curve addAction:action3 Time:2.5];
	[curve addAction:action30 Time:3.0];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) TouEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"头" Size:30];
	[enemy setColor:[Color R:255 G:127 B:200]];
	
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT-100];
	[enemy setSpeedX:-120 Y:-60];
	enemy.health = 100;
	
	[enemy setDefaultCurve:[self toutongweiCurve]];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) TongEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"酮" Size:30];
	[enemy setColor:[Color R:127 G:64 B:100]];
	
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT-100];
	[enemy setSpeedX:-120 Y:-60];
	[enemy setHasRelatedEnemy:TRUE];
	enemy.health = 30;
	
	[enemy setHitAction:[SetColorAction actionWithColor:[Color R:20 G:20 B:20]]];
	[enemy setDefaultCurve:[self toutongweiCurve]];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) WeiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"尾" Size:30];
	[enemy setColor:[Color R:127 G:64 B:100]];
	
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT-100];
	[enemy setSpeedX:-120 Y:-60];
	enemy.health = 100;
	
	[enemy setDefaultCurve:[self toutongweiCurve]];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve:4]];
	}
	
	return enemy;
}

-(Enemy *) ZhuEnemy:(int)type {
	
	BossEnemy *enemy = [[BossEnemy alloc] initWithChar:@"主" Size:180];
	[enemy setColor:[Color R:255 G:64 B:10]];
	
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT/2];
	[enemy setSpeedX:-80 Y:0];
	if (gameLevel == 0) {
		enemy.health = 3000;
	} else if (gameLevel == 1) {
		enemy.health = 5000;
	}
	
	[enemy setDefaultCurve:[self zhucongCurve:TRUE]];
	
	[enemy setExplodeCurve:[self bossExplodeCurve]];
	
	return enemy;
}

-(Enemy *) CongEnemy:(int)type {

	Enemy *enemy = [[Enemy alloc] initWithChar:@"从" Size:60];
	[enemy setColor:[Color R:127 G:34 B:5]];
	
	[enemy setPositionX:[self getRightEdge:enemy]+150 Y:(type==1?GAME_SCREEN_HEIGHT/2+50:GAME_SCREEN_HEIGHT/2-50)];
	[enemy setSpeedX:-80 Y:0];
	enemy.health = 500;
	
	[enemy setDefaultCurve:[self zhucongCurve:FALSE]];
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;	
}

-(EnemyBullet *) singleEnemyBullet:(int)type {
	
	//NSLog(@"Composing singleEnemyBullet.");
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"弹" Size:15];
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	Curve *curve = [[Curve alloc] init];
	ChaseAction *action = [ChaseAction actionWithParam:120];
	[curve addAction:action Tick:0];
	[bullet setDefaultCurve:curve];
	
	return bullet;
}

-(EnemyBullet *) roundEnemyBullet:(int)type {
	
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"弹" Size:15];
	
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	double delta = (type/48.0)*6.28;
	[bullet setSpeedX:sin(delta)*120 Y:cos(delta)*120];
	// 0-23
	
	return bullet;
}

-(Enemy *) zhuiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"追" Size:25];
	[enemy setSpeedX:100 Y:[Common getRandomFrom:-120 To:120]];
	[enemy setColor:[Color R:255 G:0 B:50 A:1]];
	enemy.health = 10;
	
	Curve *curve = [[Curve alloc] init];
	ChasingAction *action = [ChasingAction actionWithParam:20 Duration:1.0];
	[curve addAction:action Time:0.5];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Curve *) simpleDeathCurve {
	
	Curve *dcurve = [[Curve alloc] init];
	
	int ranVal =(int)[Common getRandomFrom:0 To:2];
	SetCharacterAction *daction0 = [SetCharacterAction actionWithString:((ranVal==0)?@"灭":@"破")];
	SlowDownAction *daction1 = [SlowDownAction actionWithRate:0.4];
	SetColorAction *daction2 = [SetColorAction actionWithColor:[Color R:255 G:50 B:127]];
	FadeoutAction *daction3 = [FadeoutAction actionWithRate:0.75];
	[dcurve addAction:daction0 Tick:0];
	[dcurve addAction:daction1 Tick:1];
	[dcurve addAction:daction2 Tick:2];
	[dcurve addAction:daction3 Tick:3];
	[dcurve setTimeout:8];
	
	return dcurve;
}

-(Curve *) toutongweiCurve {
	
	Curve *curve = [[Curve alloc] init];
	CircleSpeedAction *action = [CircleSpeedAction actionWithRate:0.2 Duration:1.5];
	[curve addAction:action Time:1.5];
	
	return curve;
}
													 
-(Curve *) zhucongCurve:(BOOL)isZhu {
	
	float wavSingleTime = 2.8;
	float wavStartTime = 2.2;
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action = [SetSpeedAction actionWithSpeedX:0 Y:50];
	[curve addAction:action Time:wavStartTime];
	
	for (int i = 0; i < 30; i ++) {
		
		float thisWavTime = wavStartTime + wavSingleTime * 0.5 + i * wavSingleTime * 2;
		SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:0 Y:-30];
		[curve addAction:action1 Time:thisWavTime];
		
		if (isZhu && i % 3 == 0) {
			
			for (int k = 0; k < 4; k++) {
				for (int j = 0; j < 4; j++) {
					ComposeEnemyAction *action0 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:(j+36-k*2) Builder:self];
					[curve addAction:action0 Time:thisWavTime + j*0.05 + k*0.7];
				}
			}
		}
		
		if (!isZhu && i % 3 == 2) {
			
			for (int k = 0; k < 5; k++) {
				for (int j = 0; j < 2; j++) {
					ComposeEnemyAction *action0 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:(j<3?(37-j):(33+j)) Builder:self];
					[curve addAction:action0 Time:thisWavTime + j*0.05 + k*0.5];
				}				
			}
		}
		
		SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:0 Y:30];
		[curve addAction:action2 Time:thisWavTime + wavSingleTime];
		
		if (isZhu && i % 3 == 1) {
			
			for (int j = 0; j < 10; j++) {
				ComposeEnemyAction *action0 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Chasing Type:1 Builder:self];
				[curve addAction:action0 Time:thisWavTime + wavSingleTime + j*0.05];
			}
		}
	}
	return curve;
}

-(Curve *) explodeBulletCurve {

	return [self explodeBulletCurve:0];
}
	
-(Curve *) explodeBulletCurve:(int)level {
	
	Curve *curve = [[Curve alloc] init];
	int seed = [Common getRandomFrom:0 To:12];
	
	int count = 4 + level * 2;
	for (int i = 0; i < count; i++) {
		ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:(i*48/count+seed) Builder:self];
		[curve addAction:action1 Time:0];
	}
	int ranVal =(int)[Common getRandomFrom:0 To:2];
	SetCharacterAction *daction0 = [SetCharacterAction actionWithString:((ranVal==0)?@"灭":@"破")];
	SlowDownAction *daction1 = [SlowDownAction actionWithRate:0.4];
	SetColorAction *daction2 = [SetColorAction actionWithColor:[Color R:255 G:50 B:127]];
	FadeoutAction *daction3 = [FadeoutAction actionWithRate:0.75];
	[curve addAction:daction0 Time:0.1];
	[curve addAction:daction1 Time:0.1];
	[curve addAction:daction2 Time:0.1];
	[curve addAction:daction3 Time:0.1];
	
	[curve setTimeoutTime:2.0];
	return curve;
}

-(Curve *) bossExplodeCurve {
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action0 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	ExplodeAction *action = [ExplodeAction actionWithString:@"破" Size:35];
	FadeoutAction *action1 = [FadeoutAction actionWithRate:0.8];
	[curve addAction:action0 Time:0];
	[curve addAction:action Time:0];
	[curve addAction:action1 Time:2.0];
	[curve setTimeoutTime:4.0];
	return curve;
}

@end
