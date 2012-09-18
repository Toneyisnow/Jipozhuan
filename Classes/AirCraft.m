//
//  AirCraft.m
//  Jipozhuan
//
//  Created by sui toney on 10-11-28.
//  Copyright 2010 ms. All rights reserved.
//

#import "AirCraft.h"
//#import "SpriteChar.h"

@interface AirCraft()


@end


@implementation AirCraft

@synthesize health;

-(id) initWithChar:(NSString *)ch Size:(float)size {	
	
	self = [super initWithChar:ch Size:size];
	status = 0;
	explodeChars = [[NSMutableArray alloc] init];
	shooting = FALSE;	
	composedItemList = [[NSMutableArray alloc] init];
	
	return self;
}

-(void) addComposedItem:(AnimatedCharacter *)item {
	
	//NSLog(@"Add composed item: %@", [item getCharacter]);
	[composedItemList addObject:item];
}

-(void) composeCharacterToGame: (id<ScreenContainer>) game {

	for (int i = [composedItemList count] - 1; i >= 0; i--) {
		AnimatedCharacter *ch = [composedItemList objectAtIndex: i];
		
		float ox =[ch getMyPosition].x;
		float oy = [ch getMyPosition].y;
		
		[ch setPositionX:([self getPosition].x + ox) Y:([self getPosition].y + oy)];
		[game addCharacter:ch];
	}
}

-(void) onHit: (int) bypower {
	
	// Only in health status that AirCraft can be hit
	if(status != 0) {
		return;
	}
	
	health -= bypower;
	if(health <= 0)
	{
		// Turn to dead status
		//[self beginDie];
	}
	
}

-(void) onExplode {
	
}

-(void) addExplodeChar:(Character *)ch {

	[explodeChars addObject:ch];
}

-(void) takeTick:(int)tick {

	composedItemList = [[NSMutableArray alloc] init];
	[super takeTick:tick];
}

-(BOOL) isInvincible {
	return invincible;
}

-(void) setInvincible:(BOOL)val {
	
	invincible = val;
}

-(void) setShooting:(BOOL)val {
	shooting = val;
}

-(BOOL) isShooting {
	return shooting;
}

-(Character *) colone {

	// TODO: 
	return [self copy];
}
@end
