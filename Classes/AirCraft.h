//
//  AirCraft.h
//  Jipozhuan
//
//  Created by sui toney on 10-11-28.
//  Copyright 2010 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SolidCharacter.h"
#import "ScreenContainer.h"

@protocol CharacterComposer

-(void) composeCharacterToGame: (id<ScreenContainer>) game;
-(void) addComposedItem:(AnimatedCharacter *)item;

@end


// AirCraft can compose bullet and can be hit by bullet
@interface AirCraft : SolidCharacter<CharacterComposer> {
	
	float health;
	int status;	// 0: Ready   1: Dieing    2: Dead
	
	BOOL invincible;
	BOOL shooting;
	
	NSMutableArray *explodeChars;
	
	NSMutableArray *composedItemList;
	
}

@property float health;

-(void) onExplode;
-(void) addExplodeChar:(Character *)ch;

-(BOOL) isInvincible;
-(void) setInvincible:(BOOL)val;

-(void) setShooting:(BOOL)val;
-(BOOL) isShooting;

@end
