//
//  BackgroundController.h
//  Jipozhuan
//
//  Created by sui toney on 11-3-10.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Background.h"
#import "ContainerLayer.h"

@interface BackgroundController : NSObject {

	int tickCount;
	//Background *background;		// deprecated
	ContainerLayer *itemLayer;
	ContainerLayer *backdropLayer;
	
	NSMutableArray *backdrops;

	BOOL backgroundStarted;
	BOOL backgroundPaused;
	
	int stage;
	
	BackgroundController *next;
}

-(id) initWithLayer:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2;

-(void) tick;
-(void) start;
-(void) stop;

-(void) drawBackdrop;
-(void) clearBackdrop;

-(BOOL) hasFinished;

-(void) setStage:(int)s;

-(BackgroundController *) getNext;
-(void) setNext:(BackgroundController *)n;

@end
