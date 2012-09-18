//
//  Friend.m
//  Jipozhuan
//
//  Created by sui toney on 11-6-15.
//  Copyright 2011 ms. All rights reserved.
//

#import "Friend.h"
#import "Hero.h"
#import "BulletBuilder.h"

@implementation Friend


-(id) initWithType:(int)type {
	
	self = [super initWithChar:@"击" Size:20];
	//ccLabel.set
	
	shape->collision_type = ShapeTypeDefault;
	
	[self setPositionX:0 Y:0];
	//[self setColor:[Color R:255 G:0 B:0]];
	[self setColor:[Color R:155 G:20 B:20]];
	[self setOpacity:150];
	solid = TRUE;
	invincible = FALSE;
	
	//bullets = [[NSMutableArray alloc] init];
	health = 50;
	
	mainType = type;
	status = 0;
	
	NSLog(@"Friend inited.");
	return self;
}


-(void) composeCharacterToGame: (id<ScreenContainer>) game {
	
	Hero *hero = [Hero getCurrentHero];
	if (hero == NULL) {
		return;
	}
	
	if ([hero isShooting]) {
		
		int interval = [BulletBuilder intervalForLevel:0];
		if (beep % interval == 0) {
			
			NSMutableArray *bullets = [BulletBuilder composeBullets:11];
			for (int i=0; i < [bullets count]; i++) {
				Bullet *b = [bullets objectAtIndex:i];
				[b setPositionX:[self getEndPosition].x Y:[self getPosition].y];
				[game addCharacter:b];
			}
		}
	}
	
	[super composeCharacterToGame:game];
}

-(void) takeTick:(int)tick {
	
	composedItemList = [[NSMutableArray alloc] init];
	beep ++;
	
	Hero *hero = [Hero getCurrentHero];
	
	float dX = [hero getPosition].x - [self getPosition].x;
	float dY = ([hero getPosition].y + (mainType==1 ? 40 : -40)) - [self getPosition].y;
	
	[self setSpeedX:dX*3 Y:dY*3];
}


@end
