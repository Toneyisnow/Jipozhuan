//
//  Curve.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-22.
//  Copyright 2011 ms. All rights reserved.
//

#import "Curve.h"
#import "Character.h"
#import "DisposeAction.h"
#import "Constants.h"

@implementation Curve

//-(id) initWithCharacter:(Character *)ch {
-(id) init {

	self = [super init];
	initialTick = 0;
	//actionDictionary = [[NSMutableDictionary alloc] init];
	linkedAction = [[LinkedAction alloc] init];
	runningActions = [[NSMutableArray alloc] init];
	
	return self;
}

-(void) addAction:(AbstractAction *)action Tick:(int)tick {

	[linkedAction addAction:action At:tick];
	
	/*
	NSString *key = [NSString stringWithFormat:@"%d", tick];
	
	[actionDictionary setObject:action forKey:key];
	//actionDictionary[tick] = action;
	 */
}

-(void) addAction:(AbstractAction *)action Time:(float)time {

	return [self addAction:action Tick:(int)(time * [Constants gameFPS])];
}

-(void) takeTick:(int) gameTick target:(Character *)character {

	if(initialTick == 0) {
		initialTick = gameTick;
	}
	
	int tick = gameTick - initialTick;
	
	while (linkedAction != nil && [linkedAction getTick] == tick) {
		
		AbstractAction *action = [linkedAction getAction];
		if(action != nil) {
			//NSLog(@"Add Action to running list: %@", [action class]);
			[runningActions addObject:action];
		}
		
		LinkedAction *old = linkedAction;
		linkedAction = [old getNext];
		[old release];
	}
	
	[self runAction:character];
}

-(void) runAction:(Character *)character  {

	if (runningActions == nil || [runningActions count] == 0 || character == nil) {
		return;
	}
	
	//@synchronized(character) {
		for (int i=[runningActions count]-1; i >= 0 ; i--) {
			AbstractAction *action = [runningActions objectAtIndex:i];
			[action execute:character];
		
			if([action hasFinished: character]) {
				[runningActions removeObject: action];
				[action release];
			}
		}
	//}
}

-(void) setTimeoutTime:(float)time {

	return [self setTimeout:(int)(time * [Constants gameFPS])];
}

-(void) setTimeout:(int) gameTick {

	[self addAction:[DisposeAction action] Tick:gameTick];
	[self addAction:[DisposeAction action] Tick:gameTick+1];
	[self addAction:[DisposeAction action] Tick:gameTick+2];
	
}

-(void) release {

	while (linkedAction != nil) {
		LinkedAction *old = linkedAction;
		linkedAction = [old getNext];
		[old release];
	}

	for (int i=[runningActions count]-1; i >= 0 ; i--) {
		AbstractAction *action = [runningActions objectAtIndex:i];
		if (action != nil) {
			[runningActions removeObject: action];
			[action release];
		}
	}
}

-(NSString *) getNextActionName {

	if (linkedAction != nil) {
		return [NSString stringWithFormat:@"%@", [[linkedAction getAction] class]];
	}
	return @"";
}

@end
