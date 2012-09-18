//
//  MoveController.m
//  Jipozhuan
//
//  Created by sui toney on 10-11-28.
//  Copyright 2010 ms. All rights reserved.
//

#import "MoveController.h"
//#import "SpriteChar.h"

@implementation MoveController

-(id) init {

	NSLog(@"Init MoveController");
	
	self = [super initWithChar:@"移" Size:25];
	[self setPositionX:240.0 Y:50.0];
	[self setColor:[Color R:255 G:255 B:255 A:1]];
	[self setRadio:320.0];
	[self setOpacity:1];
	return self;
}

-(void) pressed:(CGPoint) location {
	
	
	///1. centerLocation = location;
	[self moveDirectTo:location];
	 
	//[self moveTo:location];
}

-(void) released:(CGPoint) location {

	if(![self isClickedOn: location])
	{
		return;
	}
	
	Hero *target = [Hero getCurrentHero];
	if(target == nil) {
		return;
	}
	
	[target setSpeedX:0 Y:0];
	///1. [self moveTo:location];
}

-(void) draged:(CGPoint) location {
	
	///1. [self moveTo:location];
	[self moveDirectTo:location];
}

-(void) moveTo:(CGPoint) location {

	//NSLog(@"Move Controller Pressed.");
	
	Hero *target = [Hero getCurrentHero];
	
	float maxValue = 15;
	@synchronized (target) {
		
		if(target == nil || ![target isValid]) {
			return;
		}
		
		float dx = location.x - centerLocation.x;
		dx = (dx > maxValue) ? maxValue : dx;
		dx = (dx < -maxValue)? -maxValue : dx;
		dx = abs(dx) < 4 ? 0 : dx;
		
		float dy = location.y - centerLocation.y;
		dy = (dy > maxValue) ? maxValue : dy;
		dy = (dy < -maxValue)? -maxValue : dy;
		dy = abs(dy) < 4 ? 0 : dy;
		
		[target setSpeedX:dx * 10 Y:dy * 10];
	}
}

-(void) moveDirectTo:(CGPoint) location {
	
	Hero *target = [Hero getCurrentHero];
	
	float maxValue = 15;
	@synchronized (target) {
		
		if(target == nil || ![target isValid]) {
			return;
		}
		
		float dx = location.x - [target getPosition].x;
		dx = (dx > maxValue) ? maxValue : dx;
		dx = (dx < -maxValue)? -maxValue : dx;
		dx = abs(dx) < 4 ? 0 : dx;
		
		float dy = location.y - [target getPosition].y;
		dy = (dy > maxValue) ? maxValue : dy;
		dy = (dy < -maxValue)? -maxValue : dy;
		dy = abs(dy) < 4 ? 0 : dy;
		
		[target setSpeedX:dx * 10 Y:dy * 10];
	}
}

@end
