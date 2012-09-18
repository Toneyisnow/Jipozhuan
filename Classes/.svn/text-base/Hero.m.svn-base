//
//  Hero.m
//  Jipozhuan
//
//  Created by sui toney on 10-11-28.
//  Copyright 2010 ms. All rights reserved.
//

#import "Hero.h"
#import "Bullet.h"
#import "BulletBuilder.h"
#import "Constants.h"
#import "Color.h"
#import "GameConfig.h"
#import "FadeoutAction.h"
#import "SlowDownAction.h"
#import "Common.h"
#import "GameStatistics.h"
//#import "SpriteChar.h"

static Hero *currentHero;

@interface Hero()

-(AnimatedCharacter *) generateDyingChar;
-(AnimatedCharacter *) generateExplodeChar; 

@end


@implementation Hero

-(id) init {
	
	self = [super initWithChar:@"击" Size:35];
	//ccLabel.set
	
	shape->collision_type = ShapeTypeHero;
	
	[self setPositionX:20.0 Y:160.0];
	//[self setColor:[Color R:255 G:0 B:0]];
	[self setColor:[Color R:255 G:20 B:20]];
	[self setOpacity:100];
	solid = FALSE;
	invincible = TRUE;
	
	//bullets = [[NSMutableArray alloc] init];
	
	flyAreaX = GAME_SCREEN_WIDTH;
	flyAreaY = GAME_SCREEN_HEIGHT;
	
	initializeCompleted = FALSE;
	initializeTick = 0;
	isExploding = FALSE;
	explodingStartTick = 0;
	
	isShockWaving = 0;
	shockWavingTotalTick = 48;
	
	if([GameStatistics instance] != nil && [GameStatistics instance].level > 0) {
		health = 50;
		shockwavCount = 2;
	} else {
		health = 100;
		shockwavCount = 3;
	}

	bulletLevel = 0;
	status = 0;
	
	generateFriend = FALSE;
	// destroyFriend = FALSE;
	friendCount = 0;
	
	//composedBullets = [[NSMutableArray alloc] init];
	//friendList = [[NSMutableArray alloc] init];
	runningActions = [[NSMutableArray alloc] init];
	
	NSLog(@"Hero inited.");
	return self;
}

+(Hero *) getCurrentHero {
	return currentHero;
}

+(void) setCurrentHero:(Hero *)h {
	currentHero = h;
}

-(void) completeInit {
	
	solid = TRUE;
	invincible = FALSE;
	
	[self setOpacity:255];
	initializeCompleted = TRUE;
}

-(void) composeCharacterToGame: (id<ScreenContainer>) game {

	if (isExploding) {
		
		ccLabel.opacity *= 0.85;
		if(beep % 3 == 1) {
			AnimatedCharacter *explode1 = [self generateExplodeChar];
			[game addCharacter:explode1];

			AnimatedCharacter *explode2 = [self generateExplodeChar];
			[game addCharacter:explode2];
			
			AnimatedCharacter *explode3 = [self generateExplodeChar];
			[game addCharacter:explode3];
		}
		return;
	}
	
	if (shooting) {
		
		int interval = [BulletBuilder intervalForLevel:bulletLevel];
		if (beep % interval == 0) {
			
			NSMutableArray *bullets = [BulletBuilder composeBullets:bulletLevel];
			for (int i=0; i < [bullets count]; i++) {
				Bullet *b = [bullets objectAtIndex:i];
				[b setPositionX:[self getEndPosition].x Y:[self getPosition].y];
				[game addCharacter:b];
			}
		}
	}
	
	if (generateFriend && friendCount == 0) {
		
		Friend *f1 = [[Friend alloc] initWithType:1];
		Friend *f2 = [[Friend alloc] initWithType:2];
		
		[game addCharacter:f1];
		[game addCharacter:f2];
				
		friendCount = 2;
		
		generateFriend = FALSE;
	}
	
	/*
	if (destroyFriend && [friendList count] > 0) {
		
		// Remove the friends
		for (int i = 0; i < [friendList count]; i++) {
			Friend *f = [friendList objectAtIndex:i];
			
			NSLog(@"Remove Friend");
			[f removeFromCurrentScene];
			[f release];
		}
		[friendList removeAllObjects];
		
		destroyFriend = FALSE;
	}
	
	for (int i = 0; i < [friendList count]; i++) {
		Friend *f = [friendList objectAtIndex:i];
		[f composeCharacterToGame:game];
	}
	*/
	
	[super composeCharacterToGame:game];
}

-(void) setSpeedX:(float)dx Y:(float)dy {
	
	// NSLog(@"Hero X:%d Y:%d", [self getPosition].x, [self getPosition].y);
	[super setSpeedX:dx Y:dy];
	[self keepInRect];
}

-(void) keepInRect {

	float dx = (body->v).x;
	float dy = (body->v).y;
	float deltaX = 0, deltaY = 0;
	
	if((dx > 0 && [self getEndPosition].x <= flyAreaX) || (dx < 0 && [self getStartPosition].x >0))
	{
		deltaX = dx;
	}
	if((dy > 0 && [self getEndPosition].y <= flyAreaY) || (dy < 0 && [self getStartPosition].y >0))
	{
		deltaY = dy;
	}	
	
	[super setSpeedX:deltaX Y:deltaY];
}

-(void) onExplode {
	
	[self setShooting:FALSE];
	// [self setSpeedX:0 Y:0];
	
	// destroyFriend = TRUE;
	
	solid = FALSE;
	isExploding = TRUE;
	beep = 0;
	
}

-(void) onDispose {

	[self setDisposeFlag];
}

-(void) onCollision:(int) bypower {
	
	if (invincible) {
		return;
	}
	
	health -= bypower;
	if (health <= 0) {
		[self onExplode];
	}
}

-(void) onSupply:(SupplyType)type {

	if (type == SupplyTypeBullet) {
		bulletLevel += 1;
		if (bulletLevel > 4) {
			bulletLevel = 4;
		}
	}
	if (type == SupplyTypeFriend) {
		generateFriend = TRUE;
	}
}

-(void) onShockWave {
	
	if(shockwavCount > 0) {
		
		shockwavCount --;
		if ([GameStatistics instance] != nil) {
			[GameStatistics instance].shockwavUsed = TRUE;
		}
		
		
		NSLog(@"Hero Shock wave!");
		isShockWaving = shockWavingTotalTick;
	}
}

-(BOOL) isValid {

	return !isExploding;
}

// Hero itself doesn't have any power
-(int) getPower {
	return 0;
}

-(BOOL) shockOffAllEnemyBullets {
	return (isShockWaving > 0);
}

-(void) takeTick:(int)tick {
	
	composedItemList = [[NSMutableArray alloc] init];
	//composedBullets = [[NSMutableArray alloc] init];
	beep ++;
	if (!initializeCompleted) {
		
		if (initializeTick == 0) {
			initializeTick = tick;
		}
		if (tick - initializeTick >= 72) {
			
			// Set hero to solid
			[self completeInit];
			return;
		}
		
		// Flash
		if (tick % 2 == 0) {
			[self setOpacity:(255 - self.ccLabel.opacity)];
		}
		return;
	}
	
	if (isExploding) {
		if (explodingStartTick == 0) {
			explodingStartTick = tick;
		}
		
		CGPoint v = [self getSpeed];
		//NSLog(@"Hero Speed: %f %f", v.x, v.y);
		[self setSpeedX:v.x*0.8 Y:v.y*0.8];
		
		if (tick - explodingStartTick >= 60) {
			[self onDispose];
		}
	}
	
	if (isShockWaving > shockWavingTotalTick - 3) {
		
		for (int i = 0; i < 36; i++) {
				[composedItemList addObject:[BulletBuilder shockWaveBullet:(i+isShockWaving*36)]];
		}
	}
	
	if (isShockWaving > 0) {
		isShockWaving --;
	}

	/*
	if (destroyFriend) {
		
		// Remove the friends
		for (int i = 0; i < [friendList count]; i++) {
			Friend *f = [friendList objectAtIndex:i];
		
			NSLog(@"Remove Friend");
			[f removeFromCurrentScene];
			[f release];
		}
		[friendList removeAllObjects];
	}
	
	for (int i = 0; i < [friendList count]; i++) {
		Friend *f = [friendList objectAtIndex:i];
		[f takeTick:tick];
	}
	 */
}

-(void) setShockWaveCount:(int)count {

	shockwavCount = count;
}

-(int) getShockWaveCount {

	return shockwavCount;
}

-(AnimatedCharacter *) generateDyingChar {
	
	AnimatedCharacter *explode = [[AnimatedCharacter alloc] initWithChar:@"坠" Size:35];
	[explode setColor:[Color R:255 G:0 B:0]];
	[explode setPositionX:[self getPosition].x Y:[self getPosition].y];
	[explode setSpeedX:0 Y:0];
	Curve *curve = [[Curve alloc] init];
	FadeoutAction *action0 = [FadeoutAction actionWithRate:0.7];
	[curve addAction:action0 Tick:0];
	[curve setTimeout:60];
	[explode setDefaultCurve:curve];
	return explode;
}

-(AnimatedCharacter *) generateExplodeChar {

	AnimatedCharacter *explode = [[AnimatedCharacter alloc] initWithChar:@"爆" Size:25];
	[explode setColor:[Color R:255 G:70 B:50]];
	[explode setPositionX:[self getPosition].x Y:[self getPosition].y];
	[explode setOpacity:30];
	[explode setSpeedX:[Common getRandomFrom:-150 To:150] Y:[Common getRandomFrom:-150 To:150]];
	
	Curve *curve = [[Curve alloc] init];
	FadeoutAction *action0 = [FadeoutAction actionWithRate:1.2];
	//SlowDownAction *action1 = [SlowDownAction actionWithRate:0.4];
	[curve addAction:action0 Tick:0];
	//[curve addAction:action1 Tick:0];
	[curve setTimeout:18];
	[explode setDefaultCurve:curve];
	
	return explode;
}
/*
-(void) addFriend:(Friend *)f {

	//[friendList addObject:f];
}
*/

@end
