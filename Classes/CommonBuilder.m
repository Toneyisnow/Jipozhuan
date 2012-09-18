//
//  CommonBuilder.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "CommonBuilder.h"
#import "GameConfig.h"
#import "Common.h"
#import "Hero.h"

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



static float lastInitializePositionY;

@implementation CommonBuilder

+(float) getRightEdge:(Enemy *)enemy {
	
	return GAME_SCREEN_WIDTH + [enemy getSize].width / 2;
}

+(float) getLastInitializePositionY {

	return lastInitializePositionY;
}

+(void) setLastInitializePositionY:(float)val {

	lastInitializePositionY = val;
}

+(Enemy *) LuanEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"卵" Size:35];
	[enemy setColor:[Color R:127 G:127 B:0]];
	[enemy setPositionX:[CommonBuilder getRightEdge: enemy] Y:[Common getRandomFrom:100 To:250]];
	[enemy setSpeedX:-100 Y:0];
	
	//Curve *deathCurve = [[Curve alloc] init];
	//ComposeEnemyAction *action1 = [ComposeEnemyAction actionWithItem:SupplyDefinition_Bullet Type:1];
	//[deathCurve addAction:action1 Tick:0];
	//[deathCurve setTimeout:1];
	//[enemy setExplodeCurve:deathCurve];
	
	return enemy;
}

+(Supply *) BulletSupply:(int)type {
	
	Supply *supply = [[Supply alloc] initWithChar:@"锐" Size:15];
	[supply setSpeedX:-100 Y:0];
	
	Curve *curve = [[Curve alloc] init];
	ColorfulAction *action = [ColorfulAction actionWithRate:20];
	[curve addAction:action Tick:0];
	[supply setDefaultCurve:curve];
	
	return supply;
}

+(Curve *) simpleDeathCurve {
	
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

+(CGPoint) getTraceSpeedX:(float)x Y:(float)y Base:(float)base {
	
	Hero *hero = [Hero getCurrentHero];
	float vx = [hero getPosition].x - x;
	float vy = [hero getPosition].y - y;
	
	float total = abs(vx) + abs(vy);
	float dx = base * vx / total;
	float dy = base * vy / total;
	
	return CGPointMake(dx, dy);
	
}

+(float) getLeftEdge:(Enemy *)enemy {
	return 0;
}

@end
