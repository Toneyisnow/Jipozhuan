//
//  BackgroundController.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "BackgroundController.h"


@implementation BackgroundController

-(id) initWithLayer:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {

	self = [super init];
	
	tickCount = 0;
	itemLayer = layer1;
	backdropLayer = layer2;
	
	backgroundStarted = FALSE;
	backgroundPaused = FALSE;
	
	stage = 0;
	
	backdrops = [[NSMutableArray alloc] init];
	next = nil;
	
	return self;
}

-(void) setStage:(int)s {
	stage = s;
}

-(void) start {
	backgroundStarted = TRUE;
	backgroundPaused = FALSE;
	[self drawBackdrop];
}

-(void) stop {
	backgroundStarted = TRUE;
	backgroundPaused = FALSE;
}

-(void) tick {
	
	tickCount ++;
}

-(void) drawBackdrop {
}

-(void) clearBackdrop {

	for (int i = 0; i < [backdrops count]; i++) {
		Rectangle *rect = [backdrops objectAtIndex:i];
		[rect removeFromCurrentScene];
		[rect release];
		// NSLog(@"Remove rectangle from backdrop.");
	}
	[backdrops removeAllObjects];
	
}

-(BOOL) hasFinished {
	return FALSE;
}

-(BackgroundController *) getNext {

	return next;
}

-(void) setNext:(BackgroundController *)n {

	next = n;
}

-(void) release {

	[self clearBackdrop];
	
	[backdrops release];
	[super release];
}

@end
