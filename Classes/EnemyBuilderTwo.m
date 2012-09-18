//
//  EnemyBuilderTwo.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "EnemyBuilderTwo.h"
#import "EnemyBulletBuilder.h"
#import "CommonBuilder.h"
#import "BossEnemy.h"
#import "GameConfig.h"
#import "Common.h"
#import "JPInteger.h"
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
#import "ComposingAction.h"
#import "SetSolidAction.h"
#import "ColorfulAction.h"
#import "CircleSpeedAction.h"
#import "ChasingAction.h"
#import "ChaseAction.h"
#import "ExplodeAction.h"
#import "KeepPositionAction.h"
#import "SetScaleAction.h"
#import "RevolvePositionSetter.h"

@implementation EnemyBuilderTwo

-(SolidCharacter *) build:(EnemyClarification)clarification Type:(int)type {
	
	switch (clarification) {
		case EnemyDefinition0_Luan:
			return [self LuanEnemy:type]; break;
		case EnemyDefinition2_Die:
			return [self DieEnemy:type]; break;
		case EnemyDefinition2_Wo:
			return [self WoEnemy:type]; break;
		case EnemyDefinition2_Zhu:
			return [self ZhuEnemy:type]; break;
		case EnemyDefinition2_Zhusi:
			return [self ZhusiEnemy:type]; break;
		case EnemyDefinition2_Yi:
			return [self YiEnemy:type]; break;
		case EnemyDefinition2_Zhi:
			return [self ZhiEnemy:type]; break;
		case EnemyDefinition2_E:
			return [self EEnemy:type]; break;
		case EnemyDefinition2_Huang:
			return [self HuangEnemy:type]; break;
		case EnemyDefinition2_Wen:
			return [self WenEnemy:type]; break;
		case EnemyDefinition2_Xi:
			return [self XiEnemy:type]; break;
		case EnemyDefinition2_Rui:
			return [self RuiEnemy:type]; break;
		case EnemyDefinition2_Meng:
			return [self MengEnemy:type]; break;
		case EnemyDefinition2_Wu:
			return [self WuEnemy:type]; break;
		case EnemyDefinition2_Gong:
			return [self GongEnemy:type]; break;
		case EnemyDefinition2_Xie:
			return [self XieEnemy:type]; break;
		case EnemyDefinition2_Feng:
			return [self FengEnemy:type]; break;
		case EnemyDefinition2_Wa:
			return [self WaEnemy:type]; break;
		case EnemyDefinition2_Chong:
			return [self ChongEnemy:type]; break;
		case EnemyDefinition2_Chong3:
			return [self Chong3Enemy:type]; break;
		case EnemyDefinition2_Chong3Boss:
			return [self Chong3BossEnemy:type]; break;
		case EnemyBulletDefinition_Simple:
			return [self singleEnemyBullet:type]; break;
		case EnemyBulletDefinition_Round:
			return [self roundEnemyBullet:type]; break;
		case EnemyBulletDefinition_Chasing:
			return [self AoEnemy:type]; break;
		case SupplyDefinition_Bullet:
			return [self BulletSupply:type]; break;
		case SupplyDefinition_Friend:
			return [self FriendSupply:type]; break;
			
		default:
			NSLog(@"Enemy definition is not found: %@", clarification);
			return nil;
			break;
	}
}

-(Enemy *) DieEnemy:(int)type {
	
	float posY = (type==1)?100:220;
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蝶" Size:35];
	[enemy setColor:[Color R:255 G:127 B:50]];
	[enemy setPositionX:[CommonBuilder getRightEdge:enemy] Y:posY];
	[enemy setSpeedX:-80 Y:0];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action1 = [FlapAction actionWithRate:0.35 To:0];
	SwingAction *action2 = [SwingAction actionWithAxis:1 Central:-50 Rate:0.2];
	//ComposeEnemyAction *action3 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	[curve addAction:action1 Tick:0];
	[curve addAction:action2 Tick:0];
	//[curve addAction:action3 Tick:[Common getRandomFrom:24 To:72]];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) EEnemy:(int)type {
	
	float posY = (type==1)?100:220;
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蛾" Size:35];
	[enemy setColor:[Color R:205 G:227 B:50]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:posY];
	[enemy setSpeedX:-80 Y:0];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action1 = [FlapAction actionWithRate:0.35 To:0];
	SwingAction *action2 = [SwingAction actionWithAxis:1 Central:-50 Rate:0.2];
	ComposeEnemyAction *action3 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	[curve addAction:action1 Time:0];
	[curve addAction:action2 Time:0];
	[curve addAction:action3 Time:[Common getRandomFrom:2.0 To:3.0]];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) WoEnemy:(int)type {

	Enemy *enemy = [[Enemy alloc] initWithChar:@"蜗" Size:35];
	[enemy setColor:[Color R:205 G:187 B:50]];
	[enemy setPositionX:[CommonBuilder getRightEdge:enemy] Y:[Common getRandomFrom:180 To:300]];
	[enemy setSpeedX:-80 Y:0];
	enemy.health = 100;
	[enemy setEnemyScore:300];
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action0 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	[curve addAction:action0 Time:2.0];
	for (int i = 0; i < 36; i++) {
		ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:(i*2)%48 Builder:self];
		[curve addAction:action1 Time:2.0+i/12.0];
		ComposeEnemyAction *action2 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:(i*2+24)%48 Builder:self];
		[curve addAction:action2 Time:2.0+i/12.0];
	}
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:-80 Y:0];
	[curve addAction:action1 Time:5.0];
	
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	return enemy;
}

-(Enemy *) ZhuEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蛛" Size:35];
	[enemy setColor:[Color R:205 G:187 B:50]];
	[enemy setPositionX:[CommonBuilder getRightEdge:enemy] Y:[Common getRandomFrom:180 To:300]];
	[enemy setSpeedX:-80 Y:0];
	enemy.health = 50;
	[enemy setEnemyScore:300];
	
	Curve *curve = [[Curve alloc] init];
	float actionTime = 1.4;
	SetSpeedAction *action0 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	[curve addAction:action0 Time:actionTime];
	for (int i = 0; i < 10; i++) {
		actionTime += 0.2;
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
		[curve addAction:action Time:actionTime];
	}
	actionTime += 0.3;
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:250 Y:0];
	[curve addAction:action1 Time:actionTime];
	/*
	ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Chasing Type:1 Builder:self];
	ComposeEnemyAction *action2 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Chasing Type:1 Builder:self];
	ComposeEnemyAction *action3 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Chasing Type:1 Builder:self];
	ComposeEnemyAction *action4 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Chasing Type:1 Builder:self];
	[curve addAction:action1 Time:1.5];
	[curve addAction:action2 Time:1.6];
	[curve addAction:action3 Time:1.7];
	[curve addAction:action4 Time:1.8];
	*/
	
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	return enemy;
}

-(Enemy *) XieEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蝎" Size:45];
	[enemy setColor:[Color R:205 G:187 B:50]];
	[enemy setPositionX:[CommonBuilder getRightEdge:enemy] Y:[Common getRandomFrom:180 To:300]];
	[enemy setSpeedX:-80 Y:0];
	enemy.health = 100;
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action0 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	[curve addAction:action0 Time:1.4];
	for (int i = 0; i < 10; i++) {
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Chasing Type:1 Builder:self];
		[curve addAction:action Time:1.5+(i*0.2)];
	}
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:300 Y:[Common getRandomFrom:-100 To:100]];
	[curve addAction:action1 Time:4.0];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve:3]];
	}
	return enemy;
}

-(Enemy *) ZhusiEnemy:(int)type {

	Enemy *enemy = [[Enemy alloc] initWithChar:@"丝" Size:8];
	[enemy setColor:[Color R:205 G:187 B:50]];
	[enemy setPositionX:-10	Y:[Common getRandomFrom:-5 To:5]];
	[enemy setSpeedX:0 Y:0];
	[enemy setSolid:FALSE];
	enemy.health = 50;
	
	Curve *curve = [[Curve alloc] init];
	if (type > 0) {
		PositionSetter *pSetter = [[RevolvePositionSetter alloc] initWithRadio:30 Increase:15];
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyDefinition2_Zhusi Type:type-1 Builder:self PSetter:pSetter];
		[curve addAction:action Time:0.00];
	}
	[curve setTimeoutTime:2.0];
	[enemy setDefaultCurve:curve];
	
	return enemy;
}

-(Enemy *) YiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蚁" Size:30];
	[enemy setColor:[Color R:205 G:205 B:205]];
	switch (type) {
		case 1:
			[enemy setPositionX:[self getRightEdge:enemy] Y:(GAME_SCREEN_HEIGHT/2)];
			[enemy setSpeedX:-150 Y:0];
			break;
		case 2:
			[enemy setPositionX:350	Y:[self getBottomEdge:enemy]];
			[enemy setSpeedX:-100 Y:100];
			break;
		case 3:
			[enemy setPositionX:350	Y:[self getTopEdge:enemy]];
			[enemy setSpeedX:-100 Y:-100];
			break;
		case 4:
		default:
			[enemy setPositionX:[self getLeftEdge:enemy] Y:[self getTopEdge:enemy]];
			[enemy setSpeedX:100 Y:-100];
			break;
	}
	enemy.health = 10;
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	return enemy;
}

-(Enemy *) ZhiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蛭" Size:35];
	[enemy setColor:[Color R:100 G:200 B:80]];
	[enemy setPositionX:GAME_SCREEN_WIDTH*type/10 Y:[self getTopEdge:enemy]];
	[enemy setSpeedX:-8 Y:-10];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	ChangeSpeedAction *action0 = [ChangeSpeedAction actionWithDX:0 DY:-10 TX:0 TY:0 Duration:36];
	[curve addAction:action0 Time:0];
	
	[enemy setDefaultCurve:curve];
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	return enemy;
}

-(Enemy *) HuangEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蝗" Size:35];
	[enemy setColor:[Color R:200 G:200 B:20]];
	[enemy setPositionX:[Common getRandomFrom:50 To:GAME_SCREEN_WIDTH] Y:[self getBottomEdge:enemy]];
	[enemy setSpeedX:0 Y:280];
	enemy.health = 20;
	
	Curve *curve = [[Curve alloc] init];
	
	float stopTime = [Common getRandomFrom:10 To:70]/100.0;
	SlowDownAction *action1 = [SlowDownAction actionWithRate:0.4];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:-40 Y:0];
	[curve addAction:action1 Time:stopTime];
	[curve addAction:action2 Time:stopTime+1.5];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	return enemy;
}

-(Enemy *) WenEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蚊" Size:35];
	[enemy setColor:[Color R:100 G:200 B:20]];
	[enemy setPositionX:[Common getRandomFrom:0 To:GAME_SCREEN_WIDTH/2] Y:[self getBottomEdge:enemy]];
	[enemy setSpeedX:0 Y:100];
	enemy.health = 40;
	
	Curve *curve = [[Curve alloc] init];
	SwingAction *action01 = [SwingAction actionWithAxis:0 Central:100 Rate:0.5];
	ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	SwingAction *action02 = [SwingAction actionWithAxis:0 Central:100 Rate:0.5];
	ComposeEnemyAction *action2 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	[curve addAction:action01 Time:0];
	[curve addAction:action1 Time:1.0];
	[curve addAction:action02 Time:1.1];
	[curve addAction:action2 Time:1.5];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	return enemy;
}

-(Enemy *) RuiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蚋" Size:30];
	[enemy setColor:[Color R:100 G:200 B:20]];
	[enemy setPositionX:[Common getRandomFrom:0 To:GAME_SCREEN_WIDTH/2] Y:[self getBottomEdge:enemy]];
	[enemy setSpeedX:0 Y:70];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	SwingAction *action01 = [SwingAction actionWithAxis:0 Central:80 Rate:0.5];
	[curve addAction:action01 Time:0];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	return enemy;
}

-(Enemy *) XiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蟋" Size:30];
	[enemy setColor:[Color R:100 G:200 B:20]];
	[enemy setPositionX:[self getRightEdge:enemy]+[Common getRandomFrom:0 To:50] Y:130];
	[enemy setSpeedX:-100 Y:0];
	enemy.health = 40;
	
	ChangeSpeedAction *action10 = [ChangeSpeedAction actionWithDX:0 DY:-15 TX:0 TY:0 Duration:0.8];
	SetSpeedAction *action11 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	
	SetSpeedAction *action21 = [SetSpeedAction actionWithSpeedX:-100 Y:280];
	ChangeSpeedAction *action22 = [ChangeSpeedAction actionWithDX:0 DY:-15 TX:0 TY:0 Duration:1.6];
	SetSpeedAction *action23 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	
	SetSpeedAction *action31 = [SetSpeedAction actionWithSpeedX:-100 Y:280];
	ChangeSpeedAction *action32 = [ChangeSpeedAction actionWithDX:0 DY:-15 TX:0 TY:0 Duration:1.6];
	SetSpeedAction *action33 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	
	SetSpeedAction *action41 = [SetSpeedAction actionWithSpeedX:100 Y:280];
	ChangeSpeedAction *action42 = [ChangeSpeedAction actionWithDX:0 DY:-15 TX:0 TY:0 Duration:1.6];
	SetSpeedAction *action43 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	
	SetSpeedAction *action51 = [SetSpeedAction actionWithSpeedX:-100 Y:280];
	ChangeSpeedAction *action52 = [ChangeSpeedAction actionWithDX:0 DY:-15 TX:0 TY:0 Duration:1.6];
	SetSpeedAction *action53 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	
	SetSpeedAction *action61 = [SetSpeedAction actionWithSpeedX:-100 Y:280];
	ChangeSpeedAction *action62 = [ChangeSpeedAction actionWithDX:0 DY:-15 TX:0 TY:0 Duration:3];
	
	ComposeEnemyAction *action01 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action02 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	Curve *curve = [[Curve alloc] init];
	[curve addAction:action10 Time:0.05];
	[curve addAction:action11 Time:0.8];
	[curve addAction:action21 Time:1.0];
	[curve addAction:action22 Time:1.0];
	[curve addAction:action23 Time:2.6];
	[curve addAction:action01 Time:2.8];
	[curve addAction:action31 Time:3.0];
	[curve addAction:action32 Time:3.0];
	[curve addAction:action33 Time:4.6];
	[curve addAction:action41 Time:5.0];
	[curve addAction:action42 Time:5.0];
	[curve addAction:action43 Time:6.6];
	[curve addAction:action02 Time:6.8];
	[curve addAction:action51 Time:7.0];
	[curve addAction:action52 Time:7.0];
	[curve addAction:action53 Time:8.6];
	[curve addAction:action61 Time:9.0];
	[curve addAction:action62 Time:9.0];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	return enemy;
}

-(Enemy *) MengEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"虻" Size:30];
	[enemy setColor:[Color R:227 G:164 B:100]];
	
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT*0.8];
	//[enemy setPositionX:400 Y:0];
	[enemy setSpeedX:-100 Y:-200];
	enemy.health = 50;
	
	Curve *curve = [[Curve alloc] init];
	CircleSpeedAction *action1 = [CircleSpeedAction actionWithRate:0.25 Duration:0.6];
	ComposeEnemyAction *action01 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action01b = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	CircleSpeedAction *action2 = [CircleSpeedAction actionWithRate:-0.25 Duration:0.6];
	ComposeEnemyAction *action02 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action02b = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	CircleSpeedAction *action3 = [CircleSpeedAction actionWithRate:0.25 Duration:0.6];
	[curve addAction:action1 Time:0.3];
	[curve addAction:action01 Time:0.8];
	if (gameLevel > 0) {
		[curve addAction:action01b Time:0.9];
	}
	[curve addAction:action2 Time:1.2];
	[curve addAction:action3 Time:2.1];
	[curve addAction:action02 Time:2.1];
	if (gameLevel > 0) {
		[curve addAction:action02b Time:2.2];
	}
	
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) WuEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蜈" Size:30];
	[enemy setColor:[Color R:227 G:164 B:100]];
	
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT];
	[enemy setHasRelatedEnemy:TRUE];
	[enemy setSpeedX:-120 Y:-60];
	enemy.health = 150;
	
	[enemy setDefaultCurve:[self wugongCurve]];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) GongEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蚣" Size:30];
	[enemy setColor:[Color R:187 G:164 B:100]];
	
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT];
	[enemy setHasRelatedEnemy:TRUE];
	[enemy setSpeedX:-120 Y:-60];
	enemy.health = 150;
	
	[enemy setDefaultCurve:[self wugongCurve]];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) FengEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蜂" Size:30];
	[enemy setColor:[Color R:100 G:200 B:20]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:10 To:GAME_SCREEN_HEIGHT-10]];
	[enemy setSpeedX:-150 Y:0];
	enemy.health = 15;
	
	Curve *curve = [[Curve alloc] init];
	ChasingAction *action01 = [ChasingAction actionWithParam:10 Duration:1.5];
	[curve addAction:action01 Time:0];
	[enemy setDefaultCurve:curve];
	
	[enemy setHitAction:[SetScaleAction actionWithScaleX:1.5 ScaleY:1.5]];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	return enemy;
}

-(Enemy *) WaEnemy:(int)type {
	
	float baseSpeedY = [Common getRandomFrom:100 To:300];
	float jumpDuration = 1.6;
	float stopDuration = 0.5;
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蛙" Size:40];
	[enemy setColor:[Color R:100 G:200 B:20]];
	[enemy setPositionX:[self getRightEdge:enemy]+[Common getRandomFrom:0 To:50] Y:0];
	[enemy setSpeedX:-100 Y:baseSpeedY];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	for (int i = 0; i < 5; i++) {
		ChangeSpeedAction *action1 = [ChangeSpeedAction actionWithDX:0 DY:-(baseSpeedY*2)/jumpDuration/GAME_FPS TX:0 TY:0 Duration:jumpDuration];
		SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:0 Y:0];
		SetSpeedAction *action3 = [SetSpeedAction actionWithSpeedX:-100 Y:baseSpeedY];
		[curve addAction:action1 Time:(jumpDuration+stopDuration)*i];
		[curve addAction:action2 Time:(jumpDuration+stopDuration)*i+jumpDuration];
		[curve addAction:action3 Time:(jumpDuration+stopDuration)*(i+1)];
	}
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	return enemy;
}

-(Enemy *) ChongEnemy:(int)type {
	
	float rollDuration = 1.0;
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"虫" Size:50];
	[enemy setColor:[Color R:100 G:200 B:20]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:50 To:GAME_SCREEN_HEIGHT]];
	[enemy setSpeedX:-20 Y:-60];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	for (int i = 0; i < 50; i++) {
		
		ChangeSpeedAction *actionX1 = [ChangeSpeedAction actionWithDX:-5 DY:0 TX:0 TY:0 Duration:rollDuration/2];
		ChangeSpeedAction *actionX2 = [ChangeSpeedAction actionWithDX:5 DY:0 TX:0 TY:0 Duration:rollDuration/2];
		ChangeSpeedAction *actionY1 = [ChangeSpeedAction actionWithDX:0 DY:10 TX:0 TY:0 Duration:rollDuration/2];
		ChangeSpeedAction *actionY2 = [ChangeSpeedAction actionWithDX:0 DY:-10 TX:0 TY:0 Duration:rollDuration/2];
	
		[curve addAction:actionY1 Time:rollDuration*i + 0];
		[curve addAction:actionX1 Time:rollDuration*i + rollDuration/4];
		[curve addAction:actionY2 Time:rollDuration*i + rollDuration/2];
		[curve addAction:actionX2 Time:rollDuration*i + rollDuration*3/4];
	}
	
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self explodeCurve:(int)[Common getRandomFrom:0 To:2]]];
	return enemy;
}

-(Enemy *) Chong3Enemy:(int)type {
	
	float rollStart = [Common getRandomFrom:0 To:0.2];
	float rollDuration = 1.0;
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"蟲" Size:75];
	[enemy setColor:[Color R:130 G:200 B:40]];
	[enemy setPositionX:-80 Y:80 * type];
	[enemy setSpeedX:-20 Y:-60];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	for (int i = 0; i < 50; i++) {
		
		ChangeSpeedAction *actionX1 = [ChangeSpeedAction actionWithDX:-5 DY:0 TX:0 TY:0 Duration:rollDuration/2];
		ChangeSpeedAction *actionX2 = [ChangeSpeedAction actionWithDX:5 DY:0 TX:0 TY:0 Duration:rollDuration/2];
		ChangeSpeedAction *actionY1 = [ChangeSpeedAction actionWithDX:0 DY:10 TX:0 TY:0 Duration:rollDuration/2];
		ChangeSpeedAction *actionY2 = [ChangeSpeedAction actionWithDX:0 DY:-10 TX:0 TY:0 Duration:rollDuration/2];
		
		[curve addAction:actionY1 Time:rollStart + rollDuration*i + 0];
		[curve addAction:actionX1 Time:rollStart + rollDuration*i + rollDuration/4];
		[curve addAction:actionY2 Time:rollStart + rollDuration*i + rollDuration/2];
		[curve addAction:actionX2 Time:rollStart + rollDuration*i + rollDuration*3/4];
	}
	
	[enemy setDefaultCurve:curve];
	
	//[enemy setExplodeCurve:[self simpleDeathCurve]];
	[enemy setExplodeCurve:[self explodeCurve:0]];
	return enemy;
}

-(Enemy *) Chong3BossEnemy:(int)type {
	
	float rollDuration = 1.0;
	
	BossEnemy *enemy = [[BossEnemy alloc] initWithChar:@"蟲" Size:180];
	[enemy setColor:[Color R:130 G:200 B:40]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:100 To:150]];
	[enemy setSpeedX:-20 Y:-60];
	if (gameLevel == 0) {
		enemy.health = 3000;
	} else if (gameLevel == 1) {
		enemy.health = 5000;
	}
	
	Curve *curve = [[Curve alloc] init];
	for (int i = 0; i < 200; i++) {
		
		if (i == 2) {
			SetSpeedAction *action0 = [SetSpeedAction actionWithSpeedX:0 Y:-46];
			[curve addAction:action0 Time:rollDuration*i];
		}
		
		if (i % 5 == 0) {
			for (int k = -1; k <= 1; k++) {
				ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyDefinition2_Chong3 Type:k Builder:self];
				[curve addAction:action Time:rollDuration*i];
			}
		}
		
		KeepPositionAction *action1 = [KeepPositionAction actionWithRect:CGRectMake(0, 150, GAME_SCREEN_WIDTH, 22)];
		[curve addAction:action1 Time:rollDuration*i];
	
		ChangeSpeedAction *actionY1 = [ChangeSpeedAction actionWithDX:0 DY:10 TX:0 TY:0 Duration:rollDuration/2];
		ChangeSpeedAction *actionX1 = [ChangeSpeedAction actionWithDX:-4.5 DY:0 TX:0 TY:0 Duration:rollDuration/2];
		[curve addAction:actionY1 Time:rollDuration*i];
		[curve addAction:actionX1 Time:rollDuration*i + rollDuration/4];
		
		KeepPositionAction *action2 = [KeepPositionAction actionWithRect:CGRectMake(0, 150, GAME_SCREEN_WIDTH, 22)];
		[curve addAction:action2 Time:rollDuration*i + rollDuration/2];
		
		ChangeSpeedAction *actionY2 = [ChangeSpeedAction actionWithDX:0 DY:-10 TX:0 TY:0 Duration:rollDuration/2];
		ChangeSpeedAction *actionX2 = [ChangeSpeedAction actionWithDX:4.5 DY:0 TX:0 TY:0 Duration:rollDuration/2];
		[curve addAction:actionY2 Time:rollDuration*i + rollDuration/2];
		[curve addAction:actionX2 Time:rollDuration*i + rollDuration*3/4];
	}
	[enemy setDefaultCurve:curve];
	
	//[enemy setExplodeCurve:[self simpleDeathCurve]];
	[enemy setExplodeCurve:[self bossExplodeCurve]];
	return enemy;
}

-(Enemy *) AoEnemy:(int)type {
	
	Enemy *bullet = [[Enemy alloc] initWithChar:@"螯" Size:30];
	[bullet setSpeedX:100 Y:[Common getRandomFrom:-120 To:120]];
	[bullet setColor:[Color R:55 G:255 B:20 A:1]];
	bullet.health = 15;
	[bullet setEnemyScore:10];
	
	Curve *curve = [[Curve alloc] init];
	ChasingAction *action = [ChasingAction actionWithParam:20 Duration:1.0];
	[curve addAction:action Time:0.5];
	[bullet setDefaultCurve:curve];
	[bullet setExplodeCurve:[self simpleDeathCurve]];
	
	return bullet;
}

-(EnemyBullet *) singleEnemyBullet:(int)type {
	
	//NSLog(@"Composing singleEnemyBullet.");
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"蚀" Size:15];
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	Curve *curve = [[Curve alloc] init];
	ChaseAction *action = [ChaseAction actionWithParam:120];
	[curve addAction:action Tick:0];
	[bullet setDefaultCurve:curve];
	
	return bullet;
}

-(EnemyBullet *) roundEnemyBullet:(int)type {
	
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"蚀" Size:15];
	
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	double delta = (type/48.0)*6.28;
	[bullet setSpeedX:sin(delta)*120 Y:cos(delta)*120];
	// 0-23
	
	return bullet;
}

-(Curve *) simpleDeathCurve {
	
	Curve *dcurve = [[Curve alloc] init];
	
	int ranVal =(int)[Common getRandomFrom:0 To:2];
	SetCharacterAction *daction0 = [SetCharacterAction actionWithString:((ranVal==0)?@"亡":@"腐")];
	SlowDownAction *daction1 = [SlowDownAction actionWithRate:0.4];
	SetColorAction *daction2 = [SetColorAction actionWithColor:[Color R:255 G:50 B:127]];
	FadeoutAction *daction3 = [FadeoutAction actionWithRate:0.75];
	[dcurve addAction:daction0 Time:0];
	[dcurve addAction:daction1 Time:0];
	[dcurve addAction:daction2 Time:0];
	[dcurve addAction:daction3 Time:0];
	[dcurve setTimeout:8];
	
	return dcurve;
}

-(Curve *) wugongCurve {
	
	Curve *curve = [[Curve alloc] init];
	CircleSpeedAction *action1 = [CircleSpeedAction actionWithRate:0.2 Duration:2.0];
	CircleSpeedAction *action2 = [CircleSpeedAction actionWithRate:0.2 Duration:2.0];
	CircleSpeedAction *action3 = [CircleSpeedAction actionWithRate:0.2 Duration:2.0];
	CircleSpeedAction *action4 = [CircleSpeedAction actionWithRate:0.2 Duration:2.0];
	[curve addAction:action1 Time:2.0];
	[curve addAction:action2 Time:5.0];
	[curve addAction:action3 Time:8.0];
	[curve addAction:action4 Time:11.0];
	
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
	SetCharacterAction *daction0 = [SetCharacterAction actionWithString:((ranVal==0)?@"亡":@"腐")];
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

-(Curve *) explodeCurve:(int)type {
	
	// 0: 8 bullets
	// 1: 4 bullets Zhi
	// 2: 4 bullets Xie
	
	Curve *dcurve = [[Curve alloc] init];
	
	for (int i = 0; i < 12; i++) {
		if (type == 0 || (type == 1 && i % 2 == 0) || (type == 2 && i % 2 == 1)) {
			ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:(i*4) Builder:self];
			[dcurve addAction:action Time:0];
		}
	}
	
	int ranVal =(int)[Common getRandomFrom:0 To:2];
	SetCharacterAction *daction0 = [SetCharacterAction actionWithString:((ranVal==0)?@"亡":@"腐")];
	SlowDownAction *daction1 = [SlowDownAction actionWithRate:0.4];
	SetColorAction *daction2 = [SetColorAction actionWithColor:[Color R:255 G:50 B:127]];
	FadeoutAction *daction3 = [FadeoutAction actionWithRate:0.75];
	[dcurve addAction:daction0 Time:0];
	[dcurve addAction:daction1 Time:0];
	[dcurve addAction:daction2 Time:0];
	[dcurve addAction:daction3 Time:0];
	[dcurve setTimeout:8];
	
	return dcurve;
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
