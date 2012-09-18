//
//  ShootController.m
//  Jipozhuan
//
//  Created by sui toney on 10-11-28.
//  Copyright 2010 ms. All rights reserved.
//

#import "ShootController.h"
#import "Hero.h"

@implementation ShootController

-(id) init {
	
	NSLog(@"Init ShootController");
	
	self = [super initWithChar:@"枪" Size:25];
	[self setPositionX:430.0 Y:50.0];
	[self setColor:[Color R:255 G:255 B:255 A:1]];
	[self setOpacity:1];
	[self setRadio:30.0];
	
	lastActionTime = [[NSDate date] retain];
	lastClickedLocation = ccp(0,0);
	//NSLog(@"lastActionTime %@", lastActionTime);
	
	return self;
}

-(void) pressed:(CGPoint) location {
	
	Hero *target = [Hero getCurrentHero];
	if(target == nil || ![target isValid]) {
		return;
	}
	
	//NSLog(@"Shooting Controller Pressed.");
	
	NSTimeInterval elapsedTimeInterval = [lastActionTime timeIntervalSinceNow];
	if (abs(elapsedTimeInterval) < 0.15 && abs(location.x - lastClickedLocation.x) < 8 && abs(location.y - lastClickedLocation.y) < 5) {
		NSLog(@"Should shock wave");
		[target onShockWave];
	} else {
		lastActionTime = [[NSDate date] retain];
		lastClickedLocation = location;
		//NSLog(@"elapsedTimeInterval: %f", elapsedTimeInterval);
	}
	
	if([self isClickedOn: location]) {
		[target setShooting:![target isShooting]];
	}
	
}

-(bool) isClickedOn:(CGPoint) location {
	
	Hero *target = [Hero getCurrentHero];
	if(target == nil) {
		return FALSE;
	}
	
	float heroX = [target getPosition].x;
	float heroY = [target getPosition].y;
	
	float r = [target getSize].width / 2;
	
	return (abs(heroX - location.x) <= r && abs(heroY - location.y) <= r);
}

@end
