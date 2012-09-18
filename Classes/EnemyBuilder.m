//
//  EnemyStore.m
//  Jipozhuan
//
//  Created by sui toney on 10-12-6.
//  Copyright 2010 ms. All rights reserved.
//

#import "Common.h"
#import "GameConfig.h"
#import "GameStatistics.h"
#import "EnemyBuilder.h"
#import "EnemyBuilderOne.h"
#import "EnemyBuilderTwo.h"
#import "CommonBuilder.h"
#import "EnemyBulletBuilder.h"

#import "Supply.h"
#import "EnemyBullet.h"
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

@implementation EnemyBuilder

-(id) init {

	self = [super init];
	gameLevel = ([GameStatistics instance] != nil) ? [GameStatistics instance].level : 0;
	
	return self;
}

-(SolidCharacter *) build:(EnemyDefinition *) definition {

	return [self build:definition.clarification Type:definition.subtype];
}

-(SolidCharacter *) build:(EnemyClarification)clarification Type:(int)type {
	
	// This should be overwritten by subclass
	return nil;
}

-(float) getTopEdge:(Enemy *)enemy {

	return GAME_SCREEN_HEIGHT + [enemy getSize].height / 2;
}

-(float) getBottomEdge:(Enemy *)enemy {
	
	return -[enemy getSize].height / 2;
}

-(float) getLeftEdge:(Enemy *)enemy {

	return -[enemy getSize].width / 2;
}

-(float) getRightEdge:(Enemy *)enemy {
	
	return GAME_SCREEN_WIDTH + [enemy getSize].width / 2;
}

-(float) getLastInitializePositionY {
	
	return lastInitializePositionY;
}

-(void) setLastInitializePositionY:(float)val {
	
	lastInitializePositionY = val;
}

-(Enemy *) LuanEnemy:(int)type {
	
	Enemy *enemy = [[Enemy alloc] initWithChar:@"卵" Size:35];
	[enemy setColor:[Color R:127 G:127 B:0]];
	[enemy setPositionX:[CommonBuilder getRightEdge: enemy] Y:[Common getRandomFrom:20 To:50]];
	[enemy setSpeedX:-50 Y:0];
	
	Curve *curve = [[Curve alloc] init];
	SwingAction *action0 = [SwingAction actionWithAxis:1 Central:120 Rate:0.05];
	[curve addAction:action0 Time:0];
	[enemy setDefaultCurve:curve];
	
	Curve *deathCurve = [[Curve alloc] init];
	
	
	ComposeEnemyAction *action1;
	if (type == 1) {
		action1 = [ComposeEnemyAction actionWithItem:SupplyDefinition_Bullet Type:1 Builder:self];
	}
	else if (type ==2) {
		action1 = [ComposeEnemyAction actionWithItem:SupplyDefinition_Friend Type:1 Builder:self];
	}
	
	[deathCurve addAction:action1 Time:0];
	[deathCurve setTimeoutTime:0.05];
	[enemy setExplodeCurve:deathCurve];
	
	return enemy;
}

-(Supply *) BulletSupply:(int)type {
	
	Supply *supply = [[Supply alloc] initWithChar:@"锐" Size:22];
	[supply setSpeedX:-100 Y:0];
	
	Curve *curve = [[Curve alloc] init];
	ColorfulAction *action = [ColorfulAction actionWithRate:20];
	[curve addAction:action Tick:0];
	[supply setDefaultCurve:curve];
	
	return supply;
}

-(Supply *) FriendSupply:(int)type {
	
	Supply *supply = [[Supply alloc] initWithChar:@"翼" Size:22];
	[supply setSupplyType:SupplyTypeFriend];
	[supply setSpeedX:-100 Y:0];
	
	Curve *curve = [[Curve alloc] init];
	ColorfulAction *action = [ColorfulAction actionWithRate:20];
	[curve addAction:action Tick:0];
	[supply setDefaultCurve:curve];
	
	return supply;
}

-(CGPoint) getTraceSpeedX:(float)x Y:(float)y Base:(float)base {
	
	Hero *hero = [Hero getCurrentHero];
	float vx = [hero getPosition].x - x;
	float vy = [hero getPosition].y - y;
	
	float total = abs(vx) + abs(vy);
	float dx = base * vx / total;
	float dy = base * vy / total;
	
	return CGPointMake(dx, dy);
}

@end
