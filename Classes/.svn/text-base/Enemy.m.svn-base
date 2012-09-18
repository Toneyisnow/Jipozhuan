//
//  Enemy.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-17.
//  Copyright 2011 ms. All rights reserved.
//

#import "Enemy.h"
#import "EnemyBullet.h"
#import "EnemyBulletBuilder.h"
#import "EnemyBuilder.h"
#import "GameStatistics.h"
#import "WillExplodeAction.h"

@implementation Enemy

-(id) initWithChar:(NSString *)ch Size:(float)size {

	return [self initWithChar:ch Size:size Anchor:CGPointMake(0.5, 0.5)];
}

-(id) initWithChar:(NSString *)ch Size:(float)size Anchor:(CGPoint)anchor {

	self = [super initWithChar:ch Size:size Anchor:anchor];
	shape->collision_type = ShapeTypeEnemy;
	
	composedEnemyDefinitions = [[NSMutableArray alloc] init];
	onHitAction = nil;
	otherTriggeredAction = nil;
	
	beep = 0;
	
	enemyStatus = 0;
	
	shouldBeKilled = FALSE;
	
	// Default Power
	power = 50;
	
	// Set default values for game statistics
	enemyHeadCount = 1;
	enemyScore = 100;
	
	_hasRelatedEnemy = FALSE;
	
	return self;
}

-(void) setShooting:(BOOL)val {

	[super setShooting:val];
	beep = 0;
}

-(void) onExplode {

	NSLog(@"Enemy exploded.");
	if (enemyStatus != 0) {
		return;
	}
	
	enemyStatus = 1;
	solid = FALSE;
	shooting = FALSE;
	
	[onHitAction release];
	onHitAction = nil;
	[otherTriggeredAction release];
	otherTriggeredAction = nil;
	
	// Reset self status
	ccLabel.scaleY = ccLabel.scaleX = 1;
	
	// Record score
	[GameStatistics instance].scoreGained += [self getEnemyScore];
	[GameStatistics instance].countGained += [self getEnemyHeadCount];
	
	currentCurve = explodeCurve;
	
	// Related Enemies
	[relatedEnemy1 setOtherTriggeredAction:[WillExplodeAction actionWithWaitTime:0.15]];
	[relatedEnemy2 setOtherTriggeredAction:[WillExplodeAction actionWithWaitTime:0.15]];
	
	NSLog(@"Enemy Explode finished");
}

-(void) onCollision:(int) bypower {
	
	@synchronized (self) {
		
		if (onHitAction != nil) {
			[onHitAction execute:self];
			[onHitAction release];
			onHitAction = nil;
		}
		
		if(!invincible && [self isCenterInScreen]) {
			health -= bypower;
		}
	
		if (health <= 0) {
			[self onExplode];
		}
	}
}

-(void) takeTick:(int)tick {
	
	if (otherTriggeredAction != nil) {
		[otherTriggeredAction execute:self];
	}
	if (shouldBeKilled) {
		[self onExplode];
		shouldBeKilled = FALSE;
		return;
	}
	
	composedEnemyDefinitions = [[NSMutableArray alloc] init];
	[super takeTick:tick];
}

-(void) addComposedEnemyDefinition:(EnemyDefinition *)item {

	[composedEnemyDefinitions addObject:item];
}

-(void) composeCharacterToGame: (id<ScreenContainer>) game {

	if (shooting && beep % 72 == 0) {
		//EnemyBullet *bullet = [EnemyBulletBuilder 
		//					   singleEnemyBulletX:[self getPosition].x 
		//										Y:[self getPosition].y];
		//EnemyBullet *bullet = [EnemyBulletBuilder 
		//					   singleEnemyBullet:[JPInteger new:1]];
		
		//[game addCharacter:bullet];
	}
	
	/*
	for (int i = [composedEnemyDefinitions count] - 1; i >= 0; i--) {
		EnemyDefinition *def = [composedEnemyDefinitions objectAtIndex: i];
		
		AnimatedCharacter *ch = [EnemyBuilder build:def];
		[ch setPositionX:[self getPosition].x Y:[self getPosition].y];
		[game addCharacter:ch];
		
		[def release];
		[composedEnemyDefinitions removeObject:def];
		//NSLog(@"Added to screen");
	}*/
	
	[super composeCharacterToGame:game];
}

-(void) setHitAction:(AbstractAction *)action {

	onHitAction = action;
}

-(void) setOtherTriggeredAction:(AbstractAction *)action {

	otherTriggeredAction = action;
}

-(void) setEnemyHeadCount:(int)val {

	enemyHeadCount = val;
}

-(int) getEnemyHeadCount {

	return enemyHeadCount;
}

-(void) setEnemyScore:(int)val {

	enemyScore = val;
}

-(int) getEnemyScore {

	return enemyScore;
}

-(void) setHasRelatedEnemy:(BOOL)val {

	_hasRelatedEnemy = val;
}

-(BOOL) hasRelatedEnemy {

	return _hasRelatedEnemy;
}

-(void) setRelatedEnemy1:(Enemy *)enemy {

	relatedEnemy1 = enemy;
}

-(void) setRelatedEnemy2:(Enemy *)enemy {

	relatedEnemy2 = enemy;
}

-(void) setShouldbeKilled:(BOOL)val {

	NSLog(@"Set should be killed for enemy %@", [self getCharacter]);
	shouldBeKilled = val;
}


@end
