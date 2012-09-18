//
//  ForegroundLayer.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-2.
//  Copyright 2011 ms. All rights reserved.
//

#import "ForegroundLayer.h"
#import "MoveController.h"
#import "ShootController.h"
#import "AlertController.h"

@implementation ForegroundLayer

-(id) init
{
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		self.isTouchEnabled = YES;
	}
	return self;
}

-(void) initControllers {
	
	controllers = [[NSMutableArray alloc] init];
	
	MoveController *controller1 = [[MoveController alloc] init];
	ShootController *controller2 = [[ShootController alloc] init];
	AlertController *controller3 = [[AlertController alloc] init];
	[controllers addObject:controller1];
	[controllers addObject:controller2];
	[controllers addObject:controller3];
	
	[controller1 addToScene:self];
	[controller2 addToScene:self];
	[controller3 addToScene:self];
	[controller3 setTarget:controller];
	
	/*
	Character *ch1 = [[Character alloc] initWithChar:@"上" Size:25];
	[ch1 setPositionX:[controller1 getPosition].x Y:[controller1 getPosition].y + 35];
	[ch1 setColor:[Color R:255 G:255 B:255]];
	[ch1 addToScene:self];
	Character *ch2 = [[Character alloc] initWithChar:@"下" Size:25];
	[ch2 setPositionX:[controller1 getPosition].x Y:[controller1 getPosition].y - 35];
	[ch2 setColor:[Color R:255 G:255 B:255]];
	[ch2 addToScene:self];
	Character *ch3 = [[Character alloc] initWithChar:@"左" Size:25];
	[ch3 setPositionX:[controller1 getPosition].x - 35 Y:[controller1 getPosition].y];
	[ch3 setColor:[Color R:255 G:255 B:255]];
	[ch3 addToScene:self];
	Character *ch4 = [[Character alloc] initWithChar:@"右" Size:25];
	[ch4 setPositionX:[controller1 getPosition].x + 35 Y:[controller1 getPosition].y];
	[ch4 setColor:[Color R:255 G:255 B:255]];
	[ch4 addToScene:self];
	*/
}

-(void) removeControllers {

	for (int i = [controllers count] - 1; i >= 0; i--) {
		[[controllers objectAtIndex:i] removeFromCurrentScene];
		[controllers removeObjectAtIndex:i];
	}
}


- (void) ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	
	NSLog(@"Clicked");
	
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
	
	[self controllerPressed: convertedLocation];
}

- (void) ccTouchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
	
	UITouch *touch = [touches anyObject];
	
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
	
	[self controllerMoved: convertedLocation];
}

- (void) ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	
	UITouch *touch = [touches anyObject];
	
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
	
	[self controllerReleased: convertedLocation];
}

-(void) controllerPressed: (CGPoint)location {
	
	for (int i=0; i< [controllers count]; i++) {
		[[controllers objectAtIndex:i] pressed:location];
	}
}

-(void) controllerMoved: (CGPoint)location {

	for (int i=0; i< [controllers count]; i++) {
		[[controllers objectAtIndex:i] draged:location];
	}	
}

-(void) controllerReleased: (CGPoint)location {
	
	for (int i=0; i< [controllers count]; i++) {
		[[controllers objectAtIndex:i] released: location];
	}
}


@end
