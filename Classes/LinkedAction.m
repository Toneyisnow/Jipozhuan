//
//  LinkedAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-27.
//  Copyright 2011 ms. All rights reserved.
//

#import "LinkedAction.h"
#import "Constants.h"

@implementation LinkedAction

-(id) initAction:(AbstractAction *)act AtTime:(float)time {

	return [self initAction:act At:(int)(time * [Constants gameFPS])];
}

-(id) initAction:(AbstractAction *)act At:(int)tick {
	self = [super init];
	action = act;
	actionTick = tick;
	nextAction = nil;
	return self;
}

-(id) init {

	self = [super init];
	action = nil;
	nextAction = nil;
	return self;
}

-(void) addAction:(AbstractAction *)act AtTime:(float)time {

	[self addAction:act At:(int)(time * [Constants gameFPS])];
}

-(void) addAction:(AbstractAction *)act At:(int)tick {

	if (action == nil) {
		action = act;
		actionTick = tick;
	} else {
		
		LinkedAction *link = self;
		while ([link getNext] != nil) {
			link = [link getNext];
		}
		
		LinkedAction *linkedAction = [[LinkedAction alloc] initAction:act At:tick];
		[link setNext: linkedAction];
	}
}

-(int) getTick {

	return actionTick;
}

-(AbstractAction *) getAction {
	return action;
}

-(LinkedAction *) getNext {
	
	return nextAction;
}

-(void) setNext:(LinkedAction *)linkedAction {

	nextAction = linkedAction;
}

@end
