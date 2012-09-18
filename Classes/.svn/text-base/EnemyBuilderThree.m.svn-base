//
//  EnemyBuilderThree.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "Common.h"
#import "GameConfig.h"
#import "EnemyBuilderThree.h"
#import "BossEnemy.h"
#import "ComposeEnemyAction.h"
#import "SwingAction.h"
#import "ChaseAction.h"
#import "SetCharacterAction.h"
#import "SlowDownAction.h"
#import "SetColorAction.h"
#import "FadeoutAction.h"
#import "JumpAction.h"
#import "ChangeSpeedAction.h"
#import "SetSpeedAction.h"
#import "ChaseAction.h"
#import "ExplodeAction.h"

@implementation EnemyBuilderThree

-(SolidCharacter *) build:(EnemyClarification)clarification Type:(int)type {
	
	switch (clarification) {
		case EnemyDefinition0_Luan:
			return [self LuanEnemy:type]; break;
		case EnemyDefinition3_Ban:
			return [self BanEnemy:type]; break;
		case EnemyDefinition3_Xiang:
			return [self XiangEnemy:type]; break;
		case EnemyDefinition3_Tun:
			return [self TunEnemy:type]; break;
		case EnemyDefinition3_Ta:
			return [self TaEnemy:type]; break;
		case EnemyDefinition3_Bao:
			return [self BaoEnemy:type]; break;
		case EnemyDefinition3_Niu:
			return [self NiuEnemy:type]; break;
		case EnemyDefinition3_Hu:
			return [self HuEnemy:type]; break;
		case EnemyDefinition3_Xiong:
			return [self XiongEnemy:type]; break;
		case EnemyDefinition3_You:
			return [self YouEnemy:type]; break;
		case EnemyDefinition3_YouChou:
			return [self YouChouEnemy:type]; break;
		case EnemyDefinition3_Hu2:
			return [self Hu2Enemy:type]; break;
		case EnemyDefinition3_Li:
			return [self LiEnemy:type]; break;
		case EnemyDefinition3_Mao:
			return [self MaoEnemy:type]; break;
		case EnemyDefinition3_Shi:
			return [self ShiEnemy:type]; break;
		case EnemyDefinition3_Lie:
			return [self LieEnemy:type]; break;
		case EnemyDefinition3_Chai:
			return [self ChaiEnemy:type]; break;
		case EnemyDefinition3_ShiMao:
			return [self ShiMaoEnemy:type]; break;
		case EnemyBulletDefinition_Simple:
			return [self singleEnemyBullet:type]; break;
		case EnemyBulletDefinition_Round:
			return [self roundEnemyBullet:type]; break;
		case EnemyBulletDefinition_BossSpecial:
			return [self houEnemyBullet:type]; break;
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

-(Enemy *) TunEnemy:(int)type {
	
	float posY = (type==1)?60:GAME_SCREEN_HEIGHT-30;
	Enemy *enemy = [[Enemy alloc] initWithChar:@"豚" Size:35];
	[enemy setColor:[Color R:205 G:227 B:50]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:posY];
	[enemy setSpeedX:-140 Y:0];
	enemy.health = 30;
	[enemy setSolid:FALSE];
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	ChangeSpeedAction *action21 = [ChangeSpeedAction actionWithDX:0 DY:(type==1)?3:-3 TX:0 TY:0 Duration:24];
	[curve addAction:action1 Time:0];
	[curve addAction:action21 Time:1.0];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) BanEnemy:(int)type {
	
	//int ran = (int)[Common getRandomFrom:0 To:1.99];
	Enemy *enemy = [[Enemy alloc] initWithChar:@"斑" Size:35 Anchor:[self animalAnchorPoint]];
	[enemy setColor:(type == 1 ? [Color R:20 G:20 B:20] : [Color R:200 G:200 B:200])];
	
	float posY;
	if (type ==0) {
		posY = [Common getRandomFrom:0 To:GAME_SCREEN_HEIGHT];
		[self setLastInitializePositionY:posY];
	}
	else {
		posY = [self getLastInitializePositionY]-5;
	}
	[enemy setPositionX:[self getRightEdge:enemy] Y:posY];
	[enemy setSpeedX:-130 Y:0];
	enemy.health = 30;
	[enemy setSolid:FALSE];
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	[curve addAction:action1 Time:0];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) XiangEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"象" Size:[Common getRandomFrom:60 To:120]];
	[enemy setColor:[Color R:205 G:227 B:120]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:50 To:GAME_SCREEN_HEIGHT-20]];
	[enemy setSpeedX:-130 Y:0];
	enemy.health = 30;
	[enemy setSolid:FALSE];
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	[curve addAction:action1 Time:0];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) BaoEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"豹" Size:40 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:205 G:177 B:120]];
	[enemy setPositionX:[self getLeftEdge:enemy] Y:[Common getRandomFrom:50 To:GAME_SCREEN_HEIGHT-20]];
	[enemy setSpeedX:130 Y:0];
	enemy.health = 40;
	[enemy setSolid:FALSE];
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	ComposeEnemyAction *action2 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action2b = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action3 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	ComposeEnemyAction *action3b = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	[curve addAction:action1 Time:0];
	[curve addAction:action2 Time:1.0];
	if (gameLevel > 0) {
		[curve addAction:action2b Time:1.1];
	}
	[curve addAction:action3 Time:2.0];
	if (gameLevel > 0) {
		[curve addAction:action3b Time:2.1];
	}
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve:1]];
	}
	
	return enemy;
}

-(Enemy *) TaEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"獭" Size:45 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:140 G:227 B:50]];
	[enemy setPositionX:GAME_SCREEN_WIDTH*0.3 Y:[self getBottomEdge:enemy]];
	[enemy setSpeedX:0 Y:100];
	enemy.health = 30;
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action0 = [JumpAction actionWithRate:0.04];
	SwingAction *action01 = [SwingAction actionWithAxis:0 Central:80 Rate:0.5];
	[curve addAction:action0 Time:0];
	[curve addAction:action01 Time:0];
	SwingAction *action02 = [SwingAction actionWithAxis:0 Central:80 Rate:0.5];
	[curve addAction:action02 Time:1.1];
	
	for (int i = 1; i <= 24; i++) {
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:i*2 Builder:self];
		[curve addAction:action Time:1.4];
	}
	for (int i = 1; i <= 24; i++) {
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:i*2 Builder:self];
		[curve addAction:action Time:1.45];
	}
	for (int i = 1; i <= 24; i++) {
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:i*2 Builder:self];
		[curve addAction:action Time:2.5];
	}
	for (int i = 1; i <= 24; i++) {
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:i*2 Builder:self];
		[curve addAction:action Time:2.55];
	}
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) NiuEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"牛" Size:40 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:225 G:207 B:30]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:[Common getRandomFrom:50 To:GAME_SCREEN_HEIGHT-20]];
	[enemy setSpeedX:-130 Y:[Common getRandomFrom:-30 To:30]];
	enemy.health = 50;
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	SetSpeedAction *action11 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	ChaseAction *action12 = [ChaseAction actionWithParam:(gameLevel==0) ? 250 : 300];
	[curve addAction:action1 Time:0];
	[curve addAction:action11 Time:1.0];
	[curve addAction:action12 Time:2.0];
	for (int i = 0; i < 5; i ++) {
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
		[curve addAction:action Time:2.0 + i*0.4];
	}
	
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve:1]];
	}
	
	return enemy;
}

-(Enemy *) HuEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"虎" Size:40 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:205 G:177 B:120]];
	float posY = [Common getRandomFrom:50 To:GAME_SCREEN_HEIGHT-20];
	[enemy setPositionX:[self getRightEdge:enemy] Y:posY];
	[enemy setSpeedX:-130 Y:(GAME_SCREEN_HEIGHT-posY)/10];
	enemy.health = 60;
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.035];
	[curve addAction:action1 Time:0];
	for (int i = 0; i < 3; i ++) {
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
		[curve addAction:action Time:1.0 + i*0.2];
	}
	
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve:1]];
	}
	
	return enemy;
}

-(Enemy *) XiongEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"熊" Size:60 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:255 G:187 B:40]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:100];
	[enemy setSpeedX:-130 Y:0];
	enemy.health = 130;
	
	float startSwingTime = 1.0;
	float swingTime = 3.0;
	float swingCount = 4;
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.025];
	[curve addAction:action1 Time:0];
	
	for (int k = 0; k < swingCount; k++) {
		SetSpeedAction *action0 = [SetSpeedAction actionWithSpeedX:0 Y:50];
		SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:0 Y:-50];
		[curve addAction:action0 Time:startSwingTime + swingTime * k];
		[curve addAction:action2 Time:startSwingTime + swingTime * k + swingTime/2];
	
		for (int i = 10; i <= 26; i ++) {
			ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:i*2 Builder:self];
			[curve addAction:action Time:startSwingTime + swingTime * k + swingTime*3/4];
		}
	}
	SetSpeedAction *action99 = [SetSpeedAction actionWithSpeedX:150 Y:100];
	[curve addAction:action99 Time:startSwingTime + swingTime * swingCount];
	 
	[enemy setDefaultCurve:curve];
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve:3]];
	}
	
	return enemy;
}

-(Enemy *) YouEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"鼬" Size:35 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:205 G:177 B:120]];
	[enemy setPositionX:[self getLeftEdge:enemy] Y:50];
	[enemy setSpeedX:130 Y:0];
	enemy.health = 60;
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	SwingAction *action2 = [SwingAction actionWithAxis:1 Central:100 Rate:0.2];
	[curve addAction:action1 Time:0];
	[curve addAction:action2 Time:0];
	
	for (int i = 0; i < 10; i ++) {
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyDefinition3_YouChou Type:1 Builder:self];
		[curve addAction:action Time:1.5+0.25*i];
	}
	
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) MaoEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"牦" Size:75 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:205 G:177 B:120]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT*type/4-20];
	[enemy setSpeedX:-100 Y:0];
	enemy.health = 6000;
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.035];
	ComposeEnemyAction *action2 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Simple Type:1 Builder:self];
	[curve addAction:action1 Time:0];
	if (gameLevel > 0) {
		[curve addAction:action2 Time:[Common getRandomFrom:1.0 To:4.0]];
	}
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) ChaiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"豺" Size:40 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:205 G:177 B:120]];
	float posY = (type == 1)? 50 : (GAME_SCREEN_HEIGHT - 20);
	[enemy setPositionX:[self getRightEdge:enemy] Y:posY];
	[enemy setSpeedX:-130 Y:0];
	enemy.health = 60;
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	[curve addAction:action1 Time:0];
	for (int i = 2; i <= 14; i ++) {
		int bulletType= 0;
		if (type == 1) {
			bulletType = 36 + i * 2;
		} else {
			bulletType = 36 - i * 2;
		}
		
		ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:bulletType Builder:self];
		[curve addAction:action Time:1.0+0.1*i];
	}
	
	[enemy setDefaultCurve:curve];
	
	if (gameLevel == 0) {
		[enemy setExplodeCurve:[self simpleDeathCurve]];
	} else if (gameLevel == 1) {
		[enemy setExplodeCurve:[self explodeBulletCurve]];
	}
	
	return enemy;
}

-(Enemy *) YouChouEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"臭" Size:50];
	[enemy setColor:[Color R:105 G:177 B:250]];
	[enemy setPositionX:0 Y:0];
	[enemy setOpacity:150];
	[enemy setSpeedX:-150 Y:0];
	enemy.health = 20;
	
	Curve *curve = [[Curve alloc] init];
	FadeoutAction *action = [FadeoutAction actionWithRate:1.2];
	[curve addAction:action Time:0];
	[enemy setDefaultCurve:curve];
	
	Curve *dcurve = [[Curve alloc] init];
	FadeoutAction *action1 = [FadeoutAction actionWithRate:0.7];
	[dcurve addAction:action1 Time:0];
	[enemy setExplodeCurve:dcurve];
	
	return enemy;
}

-(Enemy *) Hu2Enemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"狐" Size:30 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:255 G:177 B:70]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT];
	[enemy setSpeedX:-130 Y:-100];
	enemy.health = 20;
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:-130 Y:100];
	[curve addAction:action1 Time:0];
	[curve addAction:action2 Time:1.5];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) LiEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"狸" Size:30 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:205 G:177 B:70]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:0];
	[enemy setSpeedX:-130 Y:100];
	enemy.health = 20;
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:-130 Y:-100];
	[curve addAction:action1 Time:0];
	[curve addAction:action2 Time:1.5];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) ShiEnemy:(int)type {
	
	//BossEnemy *enemy = [[BossEnemy alloc] initWithChar:@"主" Size:180];
	BossEnemy *enemy = [[BossEnemy alloc] initWithChar:@"狮" Size:150 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:205 G:177 B:120]];
	[enemy setColor:[Color R:255 G:64 B:10]];
	
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT/2];
	[enemy setSpeedX:-80 Y:0];
	if (gameLevel == 0) {
		enemy.health = 3000;
	} else if (gameLevel == 1) {
		enemy.health = 5000;
	}
	
	/*
	float wavSingleTime = 2.8;
	float wavStartTime = 1.5;
	*/
	
	Curve *curve = [[Curve alloc] init];
	
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	SwingAction *action3 = [SwingAction actionWithAxis:1 Central:50 Rate:0.2];
	[curve addAction:action1 Time:0];
	[curve addAction:action2 Time:1.5];
	[curve addAction:action3 Time:1.5];
	
	float actionTime = 5.0;
	for (int m = 0; m < 15; m++) {
		
		for (int k = 0; k < 2; k ++) {
			for (int i = 0; i < 5; i++) {
				actionTime += 0.2;
				ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyDefinition3_Lie Type:i Builder:self];
				[curve addAction:action Time:actionTime];
				if (i > 0) {
					ComposeEnemyAction *actionL = [ComposeEnemyAction actionWithItem:EnemyDefinition3_Lie Type:-i Builder:self];
					[curve addAction:actionL Time:actionTime];
				}	
			}
		}
		actionTime += 6.0;
		for (int i = 0; i < 15; i++) {
			actionTime += 0.2;
			ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyDefinition3_ShiMao Type:i Builder:self];
			[curve addAction:action1 Time:actionTime];
			ComposeEnemyAction *action2 = [ComposeEnemyAction actionWithItem:EnemyDefinition3_ShiMao Type:-i Builder:self];
			[curve addAction:action2 Time:actionTime];
		}
		actionTime += 8.0;
		for (int i = 12; i < 24; i++) {
			actionTime += 0.1;
			ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_BossSpecial Type:i Builder:self];
			[curve addAction:action1 Time:actionTime];
		}
		actionTime += 6.0;
	}
	
	/*
	SetSpeedAction *action = [SetSpeedAction actionWithSpeedX:0 Y:50];
	[curve addAction:action Time:wavStartTime];
	
	for (int i = 0; i < 20; i ++) {
		
		float thisWavTime = wavStartTime + wavSingleTime * 0.5 + i * wavSingleTime * 2;
		SetSpeedAction *action1 = [SetSpeedAction actionWithSpeedX:0 Y:-30];
		[curve addAction:action1 Time:thisWavTime];
		
		if (i % 3 == 0) {
			float actionTime = 0;
			for (int k = 0; k < 2; k ++) {
			for (int i = 0; i < 5; i++) {
				actionTime += 0.2;
				ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyDefinition3_Lie Type:i Builder:self];
				[curve addAction:action Time:actionTime];
				if (i > 0) {
					ComposeEnemyAction *actionL = [ComposeEnemyAction actionWithItem:EnemyDefinition3_Lie Type:-i Builder:self];
					[curve addAction:actionL Time:actionTime];
				}	
			}
			}
		}
		
		
		SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:0 Y:30];
		[curve addAction:action2 Time:thisWavTime + wavSingleTime];
		
	}
	*/
	
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self bossExplodeCurve]];
	
	return enemy;
}

-(Enemy *) Shi2Enemy:(int)type {
	
	//BossEnemy *enemy = [[BossEnemy alloc] initWithChar:@"狮" Size:150 Anchor:[self animalAnchorPoint]];
	BossEnemy *enemy = [[BossEnemy alloc] initWithChar:@"狮" Size:150];
	[enemy setColor:[Color R:205 G:177 B:120]];
	[enemy setPositionX:[self getRightEdge:enemy] Y:GAME_SCREEN_HEIGHT/2];
	[enemy setSpeedX:-70 Y:0];
	if (gameLevel == 0) {
		enemy.health = 300;
	} else if (gameLevel == 1) {
		enemy.health = 5000;
	}
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	SetSpeedAction *action2 = [SetSpeedAction actionWithSpeedX:0 Y:0];
	//SwingAction *action3 = [SwingAction actionWithAxis:1 Central:50 Rate:0.2];
	[curve addAction:action1 Time:0];
	[curve addAction:action2 Time:1.5];
	//[curve addAction:action3 Time:1.5];
	
	float actionTime = 5.0;
	for (int m = 0; m < 20; m++) {
		
		for (int k = 0; k < 2; k ++) {
		for (int i = 0; i < 5; i++) {
			actionTime += 0.2;
			ComposeEnemyAction *action = [ComposeEnemyAction actionWithItem:EnemyDefinition3_Lie Type:i Builder:self];
			[curve addAction:action Time:actionTime];
			if (i > 0) {
				ComposeEnemyAction *actionL = [ComposeEnemyAction actionWithItem:EnemyDefinition3_Lie Type:-i Builder:self];
				[curve addAction:actionL Time:actionTime];
			}	
		}
		}
		actionTime += 6.0;
		for (int i = 0; i < 15; i++) {
			actionTime += 0.2;
			ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyDefinition3_ShiMao Type:i Builder:self];
			[curve addAction:action1 Time:actionTime];
			ComposeEnemyAction *action2 = [ComposeEnemyAction actionWithItem:EnemyDefinition3_ShiMao Type:-i Builder:self];
			[curve addAction:action2 Time:actionTime];
		}
		actionTime += 8.0;
		for (int i = 12; i < 24; i++) {
			actionTime += 0.1;
			ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_BossSpecial Type:i Builder:self];
			[curve addAction:action1 Time:actionTime];
		}
		actionTime += 6.0;
	}
	
	[enemy setDefaultCurve:curve];
	[enemy setExplodeCurve:[self bossExplodeCurve]];
	return enemy;
}

-(Enemy *) LieEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"鬣" Size:40 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:65 G:177 B:180]];
	[enemy setPositionX:30 Y:GAME_SCREEN_HEIGHT * type/9.0];
	[enemy setSpeedX:-200 Y:0];
	enemy.health = 20;
	
	Curve *curve = [[Curve alloc] init];
	JumpAction *action1 = [JumpAction actionWithRate:0.04];
	[curve addAction:action1 Time:0];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(Enemy *) ShiMaoEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"毛" Size:30 Anchor:[self animalAnchorPoint]];
	[enemy setColor:[Color R:200 G:255 B:20]];
	[enemy setPositionX:0 Y:0];
	[enemy setSpeedX:-180+abs(type)*5 Y:type*30];
	enemy.health = 10;
	
	Curve *curve = [[Curve alloc] init];
	SwingAction *action1 = [SwingAction actionWithAxis:1 Central:10 Rate:0.5];
	[curve addAction:action1 Time:0];
	[enemy setDefaultCurve:curve];
	
	[enemy setExplodeCurve:[self simpleDeathCurve]];
	
	return enemy;
}

-(EnemyBullet *) singleEnemyBullet:(int)type {

	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"吠" Size:15];
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	Curve *curve = [[Curve alloc] init];
	ChaseAction *action = [ChaseAction actionWithParam:120];
	[curve addAction:action Tick:0];
	[bullet setDefaultCurve:curve];
	
	return bullet;
}

-(EnemyBullet *) roundEnemyBullet:(int)type {
	
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"吠" Size:18];
	
	[bullet setColor:[Color R:255 G:0 B:50 A:1]];
	
	double delta = ((type%48)/48.0)*6.28;
	[bullet setSpeedX:sin(delta)*120 Y:cos(delta)*120];
	// 0-23
	
	return bullet;
}

-(EnemyBullet *) houEnemyBullet:(int)type {
	
	EnemyBullet *bullet = [[EnemyBullet alloc] initWithChar:@"吼" Size:25];
	
	[bullet setColor:[Color R:255 G:0 B:150 A:1]];
	
	double delta = ((type%24)/24.0)*6.28;
	[bullet setSpeedX:sin(delta)*180 Y:cos(delta)*180];
	
	return bullet;
}

-(CGPoint) animalAnchorPoint {

	return CGPointMake(0.5, 0.85);
}

-(Curve *) simpleDeathCurve {
	
	Curve *dcurve = [[Curve alloc] init];
	
	int ranVal =(int)[Common getRandomFrom:0 To:2];
	SetCharacterAction *daction0 = [SetCharacterAction actionWithString:((ranVal==0)?@"殪":@"残")];
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
		ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:EnemyBulletDefinition_Round Type:(i*48/count+seed) Builder:self];
		[curve addAction:action1 Time:0];
	}
	int ranVal =(int)[Common getRandomFrom:0 To:2];
	SetCharacterAction *daction0 = [SetCharacterAction actionWithString:((ranVal==0)?@"殪":@"残")];
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
