//
//  Background.m
//  Jipozhuan
//
//  Created by sui toney on 10-11-29.
//  Copyright 2010 ms. All rights reserved.
//

#import "Background.h"
#import "JPFloat.h"
#import "Constants.h"
#import "GameConfig.h"
#import "Character.h"
#import "Common.h"

@interface Background()

-(void) updateLayer:(NSMutableArray *)layer index:(int)ind;
-(void) drawBackdrop;
-(void) clearScreenObjects:(NSMutableArray *)layer;

@end

@implementation Background

-(id) initWithScreen:(ContainerLayer *) screen BackDrop:(ContainerLayer *)backdrop {
	
	self = [super init];
	itemLayer = screen;
	backdropLayer = backdrop;
	
	screenWidth = GAME_SCREEN_WIDTH;
	screenHeight = GAME_SCREEN_HEIGHT;
	
	backdrops = [[NSMutableArray alloc] init];
	
	layer2 = [[NSMutableArray alloc] init];
	layer3 = [[NSMutableArray alloc] init];
	layer4 = [[NSMutableArray alloc] init];
	layer5 = [[NSMutableArray alloc] init];
	
	layerFront = [[NSMutableArray alloc] init];
	
	indexation = [[NSMutableArray alloc] init];
	[indexation addObject: [JPFloat create:1.0f]];
	[indexation addObject: [JPFloat create:2.0f]];
	[indexation addObject: [JPFloat create:3.5f]];
	[indexation addObject: [JPFloat create:6.0f]];
	[indexation addObject: [JPFloat create:9.0f]];
	[indexation addObject: [JPFloat create:13.0f]];
	
	started = FALSE;
	startedCharacter = FALSE;
	
	nextAnimationTick = 24;
	leftAnimationTick = 0;
	
	return self;
}

-(void) setSkyCharacter:(NSString *) ch {
	skyCharacter = ch;
}

-(void) setSkyCharacterColor:(Color *)clr {
	skyCharacterColor = clr;
}

-(void) setGroundCharacter:(NSString *) ch Color:(Color *)clr FocusRadio:(float)radio {
	
	groundCharacter = ch;
	groundCharacterColor = clr;
	focusRadio = radio;
	
	[indexation removeAllObjects];
	float index = 1.0f;
	for (int i = 0; i < 6; i ++) {
		[indexation addObject: [JPFloat create:index]];
		index *= radio; // [Common getRandomFrom:radio*0.9 To:radio*1.1];;
	}
}

-(void) clearAll {
	
	[self clearScreenObjects:backdrops];
	[self clearScreenObjects:layer2];
	[self clearScreenObjects:layer3];
	[self clearScreenObjects:layer4];
	[self clearScreenObjects:layer5];
}

-(void) clearScreenObjects:(NSMutableArray *)layer {
	
	for (int i=0; i < [layer count]; i++) {
		Sprite *sprite = [layer objectAtIndex:i];
		[sprite removeFromCurrentScene];
	}
	[layer removeAllObjects];
}

-(void) start {
	
	horizon = nextHorizon;
	upDelta = nextUpDelta;
	downDelta = nextDownDelta;
	angel = nextAngel;
	leftAnimationTick = 0;
	
	[self drawBackdrop];
	[self startCharacter];
	
	started = TRUE;
}

-(void) stop {
	[self stopCharacter];
	started = FALSE;
}

-(void) update {
	
	if (!started) {
		return;
	}
	// Move the view angel
	if (leftAnimationTick > 0) {
		
		//NSLog(@"Move View Angel...");
		upDelta += (nextUpDelta - upDelta) / leftAnimationTick;
		downDelta += (nextDownDelta - downDelta) / leftAnimationTick;
		horizon += (nextHorizon - horizon) / leftAnimationTick;
		angel += (nextAngel - angel) / leftAnimationTick;
		
		// redraw the backlop
		[self drawBackdrop];
		
		leftAnimationTick --;
	}
	
	[self updateLayer:layer2 index:1];
	[self updateLayer:layer3 index:2];
	[self updateLayer:layer4 index:3];
	[self updateLayer:layer5 index:4];
}

-(void) updateLayer:(NSMutableArray *)layer index:(int)ind {
	
	float index = [[indexation objectAtIndex:ind] getVal];
	
	if (startedCharacter) {
		
		//NSLog(@"Started Character");
		if([layer count] < 1 || [[layer lastObject] getEndPosition].x < screenWidth - [[layer lastObject] getSize].width * interval)
		{
			//NSLog(@"Add object to Layer");
			
			float dx = baseSpeed * index;
			//float size = focusRadio * index * 10;
			float size = index * 25;
			//float pY = horizon - (index - 1) * focusRadio * angel * 15;
			float pY = horizon - (index - 1) * angel * 15;
			
			Character *ch = [[Character alloc] initWithChar:groundCharacter Size:size];
			[ch setColor:groundCharacterColor];
			[ch setOpacity:(ind/5.0) * 255];
			[ch setPositionX:(screenWidth + [ch getSize].width + index * 40) Y:pY];
			[ch setSpeedX:-dx Y:0];
			[ch addToScene:itemLayer];
			[layer addObject:ch];
		}
	}
	if([layer count] > 0 && [[layer objectAtIndex:0] getEndPosition].x < 0) {
		[[layer objectAtIndex:0] removeFromCurrentScene];
		[layer removeObjectAtIndex:0];
	}
	
	// Move the view angel
	if (leftAnimationTick > 0) {
		
		// Adjust the character position
		//angel += (nextAngel - angel) / leftAnimationTick;
		//float pY = horizon - (index - 1) * focusRadio * angel * 15;
		float pY = horizon - (index - 1) * angel * 15;
		for (int i = 0; i < [layer count]; i++) {
			Character *ch = [layer objectAtIndex:i];
			[ch setPositionX:[ch getPosition].x Y:pY];
		}
	}
}

-(void) setScreen:(ContainerLayer *)screen BackDrop:(ContainerLayer *)backdrop {
	
	itemLayer= screen;
	backdropLayer = backdrop;
}

-(void) gamePause {
	
	NSLog(@"Backbround pause");
	[itemLayer pauseSchedulerAndActions];
	[backdropLayer pauseSchedulerAndActions];
}

-(void) gameResume {
	
	[itemLayer resumeSchedulerAndActions];
	[backdropLayer resumeSchedulerAndActions];
}

-(void) setAnimationTick:(int)tick {
	
	nextAnimationTick = tick;
	leftAnimationTick = tick;
}

-(void) addToBackdrop:(CGRect) rect Color:(Color *) clr {
}


-(void) removeAllfromBackdrop {

}

-(void) addCharacter:(Character *)ch {
	
}

@end

