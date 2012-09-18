//
//  TransitionController.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-11.
//  Copyright 2011 ms. All rights reserved.
//

#import "TransitionFourController.h"
#import "GameConfig.h"

@implementation TransitionFourController

-(id) initWithLayer:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {
	
	self = [super initWithLayer:layer1 Backdrop:layer2];
	duration = 8.5;
	horizon = GAME_SCREEN_HEIGHT;	// Target: 50
	upDelta = 0.5;					// Target: 1.5
	downDelta = 15;					// Target: 0.8
	
	skyColorA = [Color R:200 G:200 B:200];
	skyColorB = [Color R:0 G:120 B:250];
	
	groundColor1A = [Color R:10 G:80 B:10];
	groundColor1B = [Color R:50 G:220 B:50];
	
	groundColor2A = [Color R:100 G:100 B:200];
	groundColor2B = [Color R:60 G:60 B:200];
	
	//skyColorA = [Color R:200 G:200 B:200];
	//skyColorB = [Color R:0 G:0 B:200];
	
	//groundColorA = [Color R:10 G:10 B:10];
	//groundColorB = [Color R:10 G:10 B:10];
	
	//groundColorA = [Color R:180 G:185 B:190];
	//groundColorB = [Color R:100 G:127 B:100];
	
	return self;
}

-(void) drawBackdrop {
	
	int sum = 0;
	float delta = 0;
	
	int totalStep = 20; int index = 0;
	float lastY = 10, currentY = 10;
	//float upDelta = 1.0;
	
	
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
		float red = groundColor1A.red + (groundColor1B.red - groundColor1A.red) * i / totalStep;
		float green = groundColor1A.green + (groundColor1B.green - groundColor1A.green) * i / totalStep;
		float blue = groundColor1A.blue + (groundColor1B.blue - groundColor1A.blue) * i / totalStep;
		
		[self addToBackdrop:CGRectMake(0, currentY+1, GAME_SCREEN_WIDTH, lastY-currentY+2) 
					  Color:[Color R:red G:green B:blue]];
		
		index++;
		lastY = currentY;
	}
}

-(void) tick {
	
	[super tick];
	
	if (tickCount > 3.0 * GAME_FPS && tickCount < 6.0 * GAME_FPS) {
		
		// GAME_SCREEN_HEIGHT -> 50
		if (horizon > 50) {
			horizon -= 5;
		}
		
		// 0.5 -> 1.5
		if (upDelta < 1.5 && tickCount % 3 == 0) {
			upDelta += 0.05;
		}
		
		// 15 -> 0.8
		if (downDelta > 0.8 && tickCount % 3 == 0) {
			downDelta -= 0.7;
		}
		
		[self clearBackdrop];
		[self drawBackdrop];
	}
	
	if(tickCount > 5.0 * GAME_FPS) {
	
		// Target [Color R:100 G:100 B:200] +90 +20 +190
		if (groundColor1A.red < 100) {
			groundColor1A = [groundColor1A changeColorR:1.5 G:0.3 B:3.1];
		}
		
		// Target [Color R:60 G:60 B:200] +10 -160 +150
		if (groundColor1B.blue < 200) {
			groundColor1B = [groundColor1B changeColorR:0.15 G:-2.5 B:2.5];
		}
		[self clearBackdrop];
		[self drawBackdrop];
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
