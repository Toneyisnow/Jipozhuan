//
//  Hero.h
//  Jipozhuan
//
//  Created by sui toney on 10-11-28.
//  Copyright 2010 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AirCraft.h"
#import "Supply.h"
#import "Friend.h"

@interface Hero : AirCraft {
	
	BOOL initializeCompleted;
	int initializeTick;
	
	BOOL isExploding;
	int explodingStartTick;
	
	int isShockWaving;	// should always be 0; when started, it should be 3 -> 1
	int shockWavingTotalTick;
	
	float flyAreaX, flyAreaY;
	
	int bulletLevel;
	
	int shockwavCount;
	// TEMP
	//int beep;
	
	NSMutableArray *runningActions;
	// NSMutableArray *friendList;
	
	BOOL generateFriend;
	int friendCount;
	
	// BOOL destroyFriend;
	// NSMutableArray *composedBullets;
}

// -(void) setDeltaX:(float)x DeltaY:(float)y;
-(void) completeInit;

-(void) keepInRect;

-(BOOL) isValid;
-(BOOL) shockOffAllEnemyBullets;

// When it collected the supply items
-(void) onSupply:(SupplyType)type;

-(void) onShockWave;

-(void) setShockWaveCount:(int)count;
-(int) getShockWaveCount;

+(Hero *) getCurrentHero;
+(void) setCurrentHero:(Hero *)h;

//-(void) addFriend:(Friend *)f;


@end

