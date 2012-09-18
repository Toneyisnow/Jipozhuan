//
//  TransitionController.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-11.
//  Copyright 2011 ms. All rights reserved.
//

#import "TransitionThreeController.h"
#import "GameConfig.h"

@implementation TransitionThreeController

-(id) initWithLayer:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {
	
	self = [super initWithLayer:layer1 Backdrop:layer2];
	duration = 9.0;
	//duration = 0.5;
	
	horizon = 10;
	downDelta = 0.3;
	
	skyColorA = [Color R:20 G:20 B:20];
	skyColorB = [Color R:30 G:30 B:250];
	
	//skyColorA = [Color R:200 G:200 B:200];
	//skyColorB = [Color R:0 G:0 B:200];
	
	groundColorA = [Color R:10 G:10 B:10];
	groundColorB = [Color R:10 G:10 B:10];
	
	//groundColorA = [Color R:180 G:185 B:190];
	//groundColorB = [Color R:100 G:127 B:100];
	
	return self;
}

-(void) drawBackdrop {
	
	int sum = 0;
	float delta = 0;
	
	int totalStep = 20; int index = 0;
	float lastY = 10, currentY = 10;
	float upDelta = 1.0;
	
	for(int i = 1;i <= totalStep;i++)
	{
		delta = upDelta * i;
		sum += delta;
		
		float red = skyColorA.red + (skyColorB.red - skyColorA.red) * i / totalStep;
		float green = skyColorA.green + (skyColorB.green - skyColorA.green) * i / totalStep;
		float blue = skyColorA.blue + (skyColorB.blue - skyColorA.blue) * i / totalStep;
		currentY = horizon + sum;
		
		[self addToBackdrop:CGRectMake(0, currentY+1, GAME_SCREEN_WIDTH, currentY-lastY+2) 
					  Color:[Color R:red G:green B:blue]];
		
		index++;
		lastY = currentY;
	}
	
	[self addToBackdrop:CGRectMake(0, lastY, GAME_SCREEN_WIDTH, (GAME_SCREEN_HEIGHT*2>lastY?GAME_SCREEN_HEIGHT*2-lastY:0)) 
				  Color:skyColorB];
	
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
		
		[self addToBackdrop:CGRectMake(0, currentY+1, GAME_SCREEN_WIDTH, lastY-currentY+2) 
					  Color:[Color R:red G:green B:blue]];
		
		index++;
		lastY = currentY;
	}
}

-(void) tick {
	
	[super tick];
	
	if (tickCount < 4.0 * GAME_FPS) {
		
		if (skyColorA.red < 194) {
				skyColorA = [skyColorA changeColorR:3 G:3 B:3];
			}
		if (skyColorB.red < 200) {
				skyColorB = [skyColorB changeColorR:0.5 G:0.5 B:0];
			}
		
		// Target:
		// Color *groundColorA = [Color R:10 G:90 B:10];
		// Color *groundColorB = [Color R:50 G:220 B:50];
		
		
		if (groundColorA.green < 100) {
				groundColorA = [groundColorA changeColorR:0.3 G:1.5 B:0.3];
			}
		if (groundColorB.green < 220) {
				groundColorB = [groundColorB changeColorR:0.8 G:3.0 B:0.8];
			}
		[self clearBackdrop];
		[self drawBackdrop];
		
	} else {
	
		if (horizon < GAME_SCREEN_HEIGHT) {
			horizon += 3;
		}
		if (downDelta < 15 && tickCount % 3 == 0) {
			downDelta += 0.06;
			
		}
		
		[self clearBackdrop];
		[self drawBackdrop];
			
			/*
			for (int i = 0; i < [backdrops count]; i++) {
				Rectangle *rect = [backdrops objectAtIndex:i];
				CGPoint pos = [rect getPosition];
				[rect setPositionX:pos.x Y:pos.y+3];
			}
			*/
	}
}

-(void) addToBackdrop:(CGRect) rect Color:(Color *) clr {
	
	Rectangle *rectangle = [[Rectangle alloc] init];
	[rectangle setColor:clr];
	[rectangle setPositionX:rect.origin.x Y:rect.origin.y];
	[rectangle setSizeX:rect.size.width Y:rect.size.height];
	[rectangle addToScene:backdropLayer];
	[backdrops addObject:rectangle];
}

-(BOOL) hasFinished {
	
	//NSLog(@"BackgroundController: %d", tickCount);
	return (tickCount > duration * GAME_FPS);
}

@end
