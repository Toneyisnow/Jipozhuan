//
//  EnemyBuilderFour.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-12.
//  Copyright 2011 ms. All rights reserved.
//
//

#import "Common.h"
#import "GameConfig.h"
#import "EnemyBuilderFour.h"
#import "BossEnemy.h"
#import "ComposeEnemyAction.h"
#import "SwingAction.h"
#import "ChaseAction.h"
#import "SetCharacterAction.h"
#import "SlowDownAction.h"
#import "SetColorAction.h"
#import "FadeoutAction.h"
#import "JumpAction.h"
#import "FlapAction.h"
#import "SetSpeedAction.h"
#import "ChasingAction.h"
#import "ChangeSpeedAction.h"
#import "ExplodeAction.h"

@implementation EnemyBuilderFour

-(SolidCharacter *) build:(EnemyClarification)clarification Type:(int)type {
	
	switch (clarification) {
		case EnemyDefinition0_Luan:
			return [self LuanEnemy:type]; break;
		case EnemyDefinition4_Lu:
			return [self LuEnemy:type]; break;
		case EnemyDefinition4_Ou:
			return [self OuEnemy:type]; break;
		case EnemyDefinition4_Ya:
			return [self YaEnemy:type]; break;
		case EnemyDefinition4_Yuanyang:
			return [self YuanyangEnemy:type]; break;
		case EnemyDefinition4_Yan:
			return [self YanEnemy:type]; break;
		case EnemyDefinition4_Hu:
			return [self HuEnemy:type]; break;
		case EnemyDefinition4_Ying:
			return [self YingEnemy:type]; break;
		case EnemyDefinition4_Que:
			return [self QueEnemy:type]; break;
		case EnemyDefinition4_Zhen:
			return [self ZhenEnemy:type]; break;
		case EnemyDefinition4_Zhendu:
			return [self ZhenduEnemy:type]; break;
		case EnemyDefinition4_Yuan2:
			return [self Yuan2Enemy:type]; break;
		case EnemyDefinition4_Sun:
			return [self SunEnemy:type]; break;
		case EnemyDefinition4_Huang:
			return [self HuangEnemy:type]; break;
		case EnemyDefinition4_HuangYu:
			return [self HuangYuEnemy:type]; break;
		case EnemyDefinition4_Feng:
			return [self FengEnemy:type]; break;
		case EnemyBulletDefinition_Simple:
			return [self singleEnemyBullet:type]; break;
		case EnemyBulletDefinition_Round:
			return [self roundEnemyBullet:type]; break;
		case EnemyBulletDefinition_BossSpecial:
			return [self linEnemyBullet:type]; break;
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

-(Enemy *) QueEnemy:(int)type {
	
	float posY = (type==1)?100:220;
	Enemy *enemy = [[Enemy alloc] initWithChar:@"鹊" Size:35];
	[enemy setColor:[Color R:25 G:27 B:50]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:posY];
	[enemy setSpeedX:-80 Y:0];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	SwingAction *action1 = [SwingAction actionWithAxis:1 Central:-50 Rate:0.2];
	FlapAction *action2 = [FlapAction actionWithRate:0.15 To:0.7];
	ComposeEnemyAction *action3 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	[curve addAction:action1 Time:0];
	[curve addAction:action2 Time:0];
	[curve addAction:action3 Time:[Common getRandomFrom:1.0 To:4.0]];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) LuEnemy:(int)type {
	
	
	float posY = (type==1)?100+[Common getRandomFrom:-20 To:20]:GAME_SCREEN_HEIGHT-100+[Common getRandomFrom:-20 To:20];
	Enemy *enemy = [[Enemy alloc] initWithChar:@"鹭" Size:40];
	[enemy setColor:[Color R:205 G:227 B:200]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:posY];
	[enemy setSpeedX:-100 Y:0];
	enemy.health = 10;
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action2 = [FlapAction actionWithRate:0.15 To:0.7];
	ComposeEnemyAction *action3 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action4 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	[curve addAction:action2 Time:0];
	[curve addAction:action3 Time:[Common getRandomFrom:1.0 To:3.0]];
	if (gameLevel > 0) {
		[curve addAction:action4 Time:[Common getRandomFrom:4.0 To:5.0]];
	}
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) OuEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"鸥" Size:35];
	[enemy setColor:[Color R:205 G:227 B:80]];
	[enemy setPositionX:[Common getRandomFrom:GAME_SCREEN_WIDTH/2 To:GAME_SCREEN_WIDTH] Y:[self getTopEdge:enemy]];
	[enemy setSpeedX:-100 Y:-240];
	enemy.health = 20;
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.2 To:0.8];
	SlowDownAction *action01 = [SlowDownAction actionWithRate:0.8];
	float speedX = [Common getRandomFrom:-200 To:-100];
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:speedX Y:300+speedX];
	[curve addAction:action0 Time:0];
	[curve addAction:action01 Time:0.9];
	[curve addAction:action1 Time:2.0];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) YaEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"鸦" Size:35];
	[enemy setColor:[Color R:5 G:27 B:20]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:GAME_SCREEN_HEIGHT*0.3 To:GAME_SCREEN_HEIGHT*0.9]];
	[enemy setSpeedX:-120 Y:0];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.2 To:0.8];
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	ChasingAction *action2 = [ChasingAction actionWithParam:20 Duration:1.0];
	[curve addAction:action0 Time:0];
	[curve addAction:action1 Time:[Common getRandomFrom:0.8 To:1.1]];
	[curve addAction:action2 Time:2.5];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) YuanyangEnemy:(int)type {
	
	int seed = [Common getRandomFrom:0 To:100];
	
	Enemy *enemy = [[Enemy alloc] initWithChar:((seed%2==0)?@"鸳":@"鸯") Size:seed%30+30];
	[enemy setColor:(seed%2==0)?[Color R:205 G:227 B:30]:[Color R:255 G:227 B:50]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT*0.15];
	[enemy setSpeedX:-80 Y:0];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.1 To:0.8];
	[curve addAction:action0 Time:0];
	float sumInterval = 0;
	for (int i = 1; i <= 3; i++) {
		float interval = [Common getRandomFrom:1.5 To:5.0];
		sumInterval += interval;
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
		[curve addAction:action Time:sumInterval];
	}
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) YanEnemy:(int)type {
	
	float centralY = 200;
	Enemy *enemy = [[Enemy alloc] initWithChar:@"雁" Size:35];
	[enemy setColor:[Color R:205 G:227 B:30]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:centralY+type*20];
	[enemy setSpeedX:-120 Y:0];
	enemy.health = 20;
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.1 To:0.8];
	[curve addAction:action0 Time:0];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	return enemy;
}

-(Enemy *) SunEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"隼" Size:35];
	[enemy setColor:[Color R:205 G:227 B:30]];
	[enemy setPositionX:[self getLeftEdge:enemy] Y:[Common getRandomFrom:30 To:GAME_SCREEN_HEIGHT-30]];
	[enemy setSpeedX:150 Y:0];
	enemy.health = 20;
	[enemy setEnemyScore:200];
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.1 To:0.8];
	[curve addAction:action0 Time:0];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	return enemy;
}

-(Enemy *) HuEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"鹄" Size:35];
	[enemy setColor:[Color R:205 G:227 B:30]];
	[enemy setPositionX:[Common getRandomFrom:GAME_SCREEN_WIDTH*0.8 To:GAME_SCREEN_WIDTH] Y:[self getTopEdge:enemy]];
	[enemy setSpeedX:-40 Y:-100];
	enemy.health = 80;
	[enemy setEnemyScore:400];
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.1 To:0.8];
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	[curve addAction:action0 Time:0];
	[curve addAction:action1 Time:1.5];
	float actionTime = 1.5;
	for (int k = 0; k < 2; k++) {
		for (int i = 0; i < 9; i++) {
			ComposeEnemyAction *action21 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:1+i Builder:self];
			ComposeEnemyAction *action22 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:23-i Builder:self];
			actionTime += 0.1;
			[curve addAction:action21 Time:actionTime];
			[curve addAction:action22 Time:actionTime];
		}
		actionTime += 0.3;
		for (int i = 0; i < 9; i++) {
			ComposeEnemyAction *action21 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:11-i Builder:self];
			ComposeEnemyAction *action22 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:13+i Builder:self];
			actionTime += 0.1;
			[curve addAction:action21 Time:actionTime];
			[curve addAction:action22 Time:actionTime];
		}
		actionTime += 0.3;
	}
	
	SetSpeedAction *action3 = [SetSpeedAction actionWithSpeedX:-200 Y:120];
	[curve addAction:action3 Time:actionTime];
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) YingEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"鹰" Size:75];
	[enemy setColor:[Color R:25 G:127 B:200]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT*0.5];
	[enemy setSpeedX:-120 Y:0];
	enemy.health = 300;
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.1 To:0.8];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	SwingAction *action3 = [SwingAction actionWithAxis:1 Central:60 Rate:0.4];
	[curve addAction:action0 Time:0];
	[curve addAction:action2 Time:1.5];
	[curve addAction:action3 Time:1.5];
	
	float time = 2.0;
	for (int i = 0; i < 10; i++) {
		for (int j = 0; j < 10; j++) {
			ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:18 Builder:self];
			time += 0.2;
			[curve addAction:action Time:time];
		}
		time += 2.0;
	}
	SetSpeedAction *action4 = [SetSpeedAction actionWithSpeedX:200 Y:100];
	[curve addAction:action4 Time:time];
	
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve:3]];
	}
	
	return enemy;
}

-(Enemy *) ZhenEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"鸩" Size:35];
	[enemy setColor:[Color R:205 G:227 B:50]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:GAME_SCREEN_HEIGHT*0.3 To:GAME_SCREEN_HEIGHT*0.9]];
	[enemy setSpeedX:-120 Y:0];
	enemy.health = 40;
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.2 To:0.8];
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:-150 Y:0];
	[curve addAction:action0 Time:0];
	[curve addAction:action1 Time:[Common getRandomFrom:0.6 To:1.0]];
	[curve addAction:action2 Time:2.0];
	[enemy setDefaultCurve:curve];
	
	Curve *dcurve = [[Curve alloc] init];
	for (int i = 0; i < 4; i++) {
		ComposeEnemyAction *daction = [ComposeEnemyAction actionWithItem:EnemyDefinition4_Zhendu Type:1 Builder:self];
		[dcurve addAction:daction Time:0];
	}
	FadeoutAction *daction2 = [FadeoutAction actionWithRate:0.4];
	[dcurve addAction:daction2 Time:0];
	[dcurve setTimeoutTime:0.5];
	
	[enemy setExplodeCurve:dcurve];
	
	return enemy;
}

-(Enemy *) ZhenduEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"毒" Size:25];
	[enemy setColor:[Color R:10 G:227 B:50]];
	[enemy setPositionX:0 Y:0];
	[enemy setSpeedX:120 Y:[Common getRandomFrom:-100 To:100]];
	
	if (gameLevel > 0) {
		enemy.health = 20;
	} else {
		enemy.health = 10;
	}
	
	Curve *curve = [[Curve alloc] init];
	ChasingAction *action = [ChasingAction actionWithParam:20 Duration:1.0];
	[curve addAction:action Time:0];
	[enemy setDefaultCurve:curve];
	
	Curve *dcurve = [[Curve alloc] init];
	FadeoutAction *daction = [FadeoutAction actionWithRate:0.4];
	[dcurve addAction:daction Time:0];
	[dcurve setTimeoutTime:0.3];
	[enemy setExplodeCurve:dcurve];
	
	return enemy;
}

-(Enemy *) Yuan2Enemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"鸢" Size:35];
	[enemy setColor:[Color R:205 G:207 B:50]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:GAME_SCREEN_HEIGHT*0.3 To:GAME_SCREEN_HEIGHT*0.9]];
	[enemy setSpeedX:-120 Y:[Common getRandomFrom:-100 To:100]];
	enemy.health = 50;
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.2 To:0.8];
	SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:-200 Y:[Common getRandomFrom:-100 To:100]];
	[curve addAction:action0 Time:0];
	[curve addAction:action1 Time:[Common getRandomFrom:0.8 To:1.1]];
	[curve addAction:action2 Time:1.5];
	
	
	float actionTime = 1.5;
	for (int i = 0; i < 2; i++) {
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
		actionTime += [Common getRandomFrom:0.2 To:1.6];
		[curve addAction:action Time:actionTime];
	}
	
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) HuangEnemy:(int)type {
	
	Enemy *enemy = [[BossEnemy alloc] initWithChar:@"凰" Size:160];
	[enemy setColor:[Color R:205 G:27 B:100]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT*0.25];
	[enemy setSpeedX:-80 Y:0];
	if (gameLevel == 0) {
		enemy.health = 3000;
	} else if (gameLevel == 1) {
		enemy.health = 5000;
	}
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.1 To:0.8];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	SwingAction *action3 = [SwingAction actionWithAxis:1 Central:80 Rate:0.2];
	[curve addAction:action0 Time:0];
	[curve addAction:action2 Time:1.5];
	[curve addAction:action3 Time:1.5];
	
	float actionTime = 2.0;
	
	for (int k = 0; k < 15; k++) {
		for (int i = 0; i < 20; i++) {
			ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyDefinition4_HuangYu Type:1 Builder:self];
			actionTime += 0.1;
			[curve addAction:action Time:actionTime];
		}
		actionTime += 1.0;
		for (int i = 0; i < 5; i++) {
			actionTime += 2.0;
			ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:9 Builder:self];
			[curve addAction:action Time:actionTime+[Common getRandomFrom:0.5 To:1.5]];
		}
		actionTime += 5.0;
		for (int i = 0; i < 5; i++) {
			actionTime += 0.5;
			for (int j = 0; j < 6; j++) {
				ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_BossSpecial Type:j Builder:self];
				[curve addAction:action Time:actionTime];
			}
		}
		actionTime += 5.0;
	}
	[enemy setDefaultCurve:curve];
	[enemy setExplodeCurve:[self bossExplodeCurve]];
	
	return enemy;
}

-(Enemy *) HuangYuEnemy:(int)type {

	Enemy *enemy = [[Enemy alloc] initWithChar:@"羽" Size:40];
	[enemy setColor:[Color R:255 G:230 B:230]];
	[enemy setPositionX:0 Y:0];
	[enemy setSpeedX:-150 Y:[Common getRandomFrom:-150 To:150]];
	enemy.health = 10;
	[enemy setEnemyScore:10];
	
	Curve *curve = [[Curve alloc] init];
	FlapAction *action0 = [FlapAction actionWithRate:0.2 To:0.8];
	[curve addAction:action0 Time:0];
	[enemy setDefaultCurve:curve];
	
	Curve *dcurve = [[Curve alloc] init];
	FadeoutAction *daction = [FadeoutAction actionWithRate:0.4];
	[dcurve addAction:daction Time:0];
	[dcurve setTimeoutTime:0.3];
	[enemy setExplodeCurve:dcurve];
	
	return enemy;
}

-(Enemy *) FengEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"风" Size:45];
	[enemy setColor:[Color R:150 G:190 B:180]];
	[enemy setPositionX:[Common getRandomFrom:GAME_SCREEN_WIDTH-100 To:GAME_SCREEN_WIDTH+100] Y:[self getTopEdge:enemy]];
	[enemy setSpeedX:-120 Y:-100];
	enemy.health = 10;
	[enemy setPower:2];
	[enemy setEnemyScore:2];
	
	Curve *curve = [[Curve alloc] init];
	ChangeSpeedAction *action = [ChangeSpeedAction actionWithDX:-5 DY:0 TX:0 TY:0 Duration:2.0];
	[curve addAction:action Time:0.5];
	[enemy setDefaultCurve:curve];
	
	Curve *dcurve = [[Curve alloc] init];
	FadeoutAction *daction = [FadeoutAction actionWithRate:0.4];
	[dcurve addAction:daction Time:0];
	[dcurve setTimeoutTime:0.3];
	[enemy setExplodeCurve:dcurve];
	
	return enemy;
}

-(EnemyBullet *) singleEnemyBullet:(int)type {
	
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"啾" Size:15];
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	if (type == 9) {
		[bullet setSpeedX:-30 Y:0];
	}
	
	Curve *curve = [[Curve alloc] init];
	if (type != 9) {
		ChaseAction *action = [ChaseAction actionWithParam:120];
		[curve addAction:action Tick:0];
	}
	[bullet setDefaultCurve:curve];
	
	return bullet;
}

-(EnemyBullet *) roundEnemyBullet:(int)type {
	
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"啾" Size:18];
	
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	double delta = ((type%24)/24.0)*6.28;
	[bullet setSpeedX:sin(delta)*120 Y:cos(delta)*120];
	// 0-23
	
	return bullet;
}

-(EnemyBullet *) linEnemyBullet:(int)type {
	
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"麟" Size:25];
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	[bullet setSpeedX:-10 Y:0];
	[bullet setOpacity:255*(8-type)/8.0];
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action0 = [SetSpeedAction actionWithSpeedX:-100 Y:0];
	ChangeSpeedAction *action1 = [ChangeSpeedAction actionWithDX:-8 DY:0 TX:0 TY:0 Duration:3.0];
	[curve addAction:action0 Time:0.1*type];
	[curve addAction:action1 Time:0.1*type];
	
	[bullet setDefaultCurve:curve];
	
	return bullet;
}

-(Curve *) simpleDeathCurve {
	
	Curve *dcurve = [[Curve alloc] init];
	
	int ranVal =(int)[Common getRandomFrom:0 To:2];
	SetCharacterAction *daction0 = [SetCharacterAction actionWithString:((ranVal==0)?@"殒":@"落")];
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

-(Curve *) explodeBulletCurve {
	
	return [self explodeBulletCurve:0];
}

-(Curve *) explodeBulletCurve:(int)level {
	
	Curve *curve = [[Curve alloc] init];
	int seed = [Common getRandomFrom:0 To:12];
	
	int count = 4 + level * 2;
	for (int i = 0; i < count; i++) {
		ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:(i*24/count+seed) Builder:self];
		[curve addAction:action1 Time:0];
	}
	int ranVal =(int)[Common getRandomFrom:0 To:2];
	SetCharacterAction *daction0 = [SetCharacterAction actionWithString:((ranVal==0)?@"殒":@"落")];
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
