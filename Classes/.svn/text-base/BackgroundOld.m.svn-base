//
//  Background.m
//  Jipozhuan
//
//  Created by sui toney on 10-11-29.
//  Copyright 2010 ms. All rights reserved.
//

#import "BackgroundOld.h"
#import "JPFloat.h"
#import "Constants.h"
#import "GameConfig.h"
#import "Character.h"
#import "Common.h"

@interface BackgroundOld()

-(void) updateLayer:(NSMutableArray *)layer index:(int)ind;
-(void) drawBackdrop;
-(void) clearScreenObjects:(NSMutableArray *)layer;

@end

@implementation BackgroundOld

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

-(void) setInterval:(float)i {
	interval = i;
}

-(void) setSpeed:(float) sp {
	baseSpeed = sp;
}

-(void) setHorizon:(float)h UpDelta:(float)u DownDelta:(float)d Angel:(float)a {

	nextHorizon = h;
	nextUpDelta = u;
	nextDownDelta = d;
	nextAngel = a;
	leftAnimationTick = nextAnimationTick;
}

-(void) setSkyColor:(Color *)clrA To:(Color *)clrB {
	skyColorA = clrA;
	skyColorB = clrB;
}

-(void) setGroundColor:(Color *)clrA To:(Color *)clrB {
	groundColorA = clrA;
	groundColorB = clrB;
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

-(void) drawBackdrop {
	
	//[self clearAll];
	
	int sum = 0;
	float delta = 0;
	
	int totalStep = 20; int index = 0;
	float lastY = horizon, currentY = horizon;
	Rectangle *rect;
	
	for(int i=1;i<= totalStep;i++)
	{
		delta = upDelta * i;
		sum += delta;
		
		float red = skyColorA.red + (skyColorB.red - skyColorA.red) * i / totalStep;
		float green = skyColorA.green + (skyColorB.green - skyColorA.green) * i / totalStep;
		float blue = skyColorA.blue + (skyColorB.blue - skyColorA.blue) * i / totalStep;
		currentY = horizon + sum;
		
		if ([backdrops count] <= index) {
			rect = [[Rectangle alloc] init];
			[rect setColor:[Color R:red G:green B:blue]];
			[rect setPositionX:0 Y:currentY+1];
			[rect setSizeX:screenWidth Y:currentY-lastY+2];
			[rect addToScene:backdropLayer];
			[backdrops addObject:rect];
		}
		else {
			rect = [backdrops objectAtIndex:index];
			[rect setColor:[Color R:red G:green B:blue]];
			[rect setPositionX:0 Y:currentY+1];
			[rect setSizeX:screenWidth Y:currentY-lastY+2];
		}
		index++;
		lastY = currentY;
	}
	//if (lastY < screenHeight * 2) {
		
		if ([backdrops count] <= index) {
			rect = [[Rectangle alloc] init];
			[rect setColor:skyColorB];
			[rect setPositionX:0 Y:lastY];
			[rect setSizeX:screenWidth Y:(screenHeight*2>lastY?screenHeight*2-lastY:0)];
			[rect addToScene:backdropLayer];
			[backdrops addObject:rect];
		}
		else {
			rect = [backdrops objectAtIndex:index];
			[rect setColor:skyColorB];
			[rect setPositionX:0 Y:lastY];
			[rect setSizeX:screenWidth Y:(screenHeight*2>lastY?screenHeight*2-lastY:0)];
		}
		index++;
	//}
	
	sum = 0;
	lastY = horizon, currentY = horizon;
	for(int i=1;i< totalStep;i++)
	{
		delta = downDelta * i;
		sum += delta;
		currentY = horizon - sum;
		float red = groundColorA.red + (groundColorB.red - groundColorA.red) * i / totalStep;
		float green = groundColorA.green + (groundColorB.green - groundColorA.green) * i / totalStep;
		float blue = groundColorA.blue + (groundColorB.blue - groundColorA.blue) * i / totalStep;
		
		if ([backdrops count] <= index) {
			rect = [[Rectangle alloc] init];
			[rect setColor:[Color R:red G:green B:blue]];
			[rect setPositionX:0 Y:currentY+1];
			[rect setSizeX:screenWidth Y:lastY-currentY+2];
			[rect addToScene:backdropLayer];
			[backdrops addObject:rect];
		}
		else {
			rect = [backdrops objectAtIndex:index];
			[rect setColor:[Color R:red G:green B:blue]];
			[rect setPositionX:0 Y:currentY+1];
			[rect setSizeX:screenWidth Y:lastY-currentY+2];
		}
		index++;
		lastY = currentY;
	}
	//if (lastY > -screenHeight) {
	if ([backdrops count] <= index) {
		rect = [[Rectangle alloc] init];
		[rect setColor:groundColorB];
		[rect setPositionX:0 Y:-screenHeight];
		[rect setSizeX:screenWidth Y:screenHeight+lastY+2];
		[rect addToScene:backdropLayer];
		[backdrops addObject:rect];
	}
	else {
		rect = [backdrops objectAtIndex:index];
		[rect setColor:groundColorB];
		[rect setPositionX:0 Y:-screenHeight];
		[rect setSizeX:screenWidth Y:screenHeight+lastY+2];
	}
	//index++;
	//}
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

-(void) startCharacter {
	startedCharacter = TRUE;
}

-(void) stopCharacter {
	startedCharacter = FALSE;
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

-(void) addBackItem:(Character *) item {
	
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

/*
-(void) stepChangeViewAngel:(float)deltaH Up:(float)deltaUp Down:(float)deltaDown ViewAngel:(float)viewangel {
	
	if (!started) {
		return;
	}
	
	horizon += deltaH;
	upDelta += deltaUp;
	downDelta += deltaDown;
}

-(void) changeViewAngel:(float)h Up:(float)up Down:(float)down ViewAngel:(float)viewangel TotalTick:(float)totalTick {

	if (!started) {
		return;
	}	
}
 */

@end

