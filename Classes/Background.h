//
//  Background.h
//  Jipozhuan
//
//  Created by sui toney on 10-11-29.
//  Copyright 2010 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Character.h"
#import "ContainerLayer.h"

@interface Background : NSObject {
	
	NSMutableArray *backdrops;
	
	float screenWidth;
	float screenHeight;
	
	ContainerLayer *itemLayer;
	ContainerLayer *backdropLayer;
	
	NSString *skyCharacter;
	Color *skyCharacterColor;
	
	NSString *groundCharacter;
	Color *groundCharacterColor;
	
	Color *skyColorA, *skyColorB;
	Color *groundColorA, *groundColorB;
	
	float horizon;		// Range 0 ~ 320
	float upDelta, downDelta;
	
	float angel;		// Range -1 ~ 1
	float focusRadio;	// Range 1 ~ 3
	float baseSpeed;
	float interval;
	
	float nextHorizon, nextUpDelta, nextDownDelta, nextAngel;
	
	NSMutableArray * indexation;
	
	BOOL started;
	BOOL startedCharacter;
}

-(id) initWithScreen:(ContainerLayer *)screen BackDrop:(ContainerLayer *)backdrop;

-(void) setSkyCharacter:(NSString *) ch;
-(void) setSkyCharacterColor:(Color *) clr;
-(void) setGroundCharacter:(NSString *) ch Color:(Color *)clr FocusRadio:(float)radio;
-(void) setInterval:(float)i;

-(void) setSpeed:(float) sp;
-(void) setHorizon:(float)h UpDelta:(float)u DownDelta:(float)d Angel:(float)a;

-(void) setSkyColor:(Color *)clrA To:(Color *)clrB;
-(void) setGroundColor:(Color *)clrA To:(Color *)clrB;

// Move View Angel
-(void) setAnimationTick:(int)tick;
//-(void) changeViewAngel:(float)h Up:(float)up Down:(float)down ViewAngel:(float)viewangel;

-(void) gamePause;
-(void) gameResume;

-(void) addToBackdrop:(CGRect) rect Color:(Color *) clr;
-(void) removeAllfromBackdrop;

-(void) addCharacter:(Character *)ch;

@end

