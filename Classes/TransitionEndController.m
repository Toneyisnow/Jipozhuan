//
//  TransitionEndController.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-31.
//  Copyright 2011 ms. All rights reserved.
//

#import "TransitionEndController.h"
#import "Color.h"
#import "GameConfig.h"

@implementation TransitionEndController

-(id) initWithLayer:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {
	
	self = [super initWithLayer:layer1 Backdrop:layer2];
	
	duration = 8.0;
	
	skyColorA = [Color R:200 G:200 B:200];
	skyColorB = [Color R:0 G:120 B:250];
	
	groundColorA = [Color R:100 G:100 B:200];
	groundColorB = [Color R:60 G:60 B:200];
	
	return self;
}

-(void) drawBackdrop {
	
	int sum = 0;
	float delta = 0;
	
	int totalStep = 20; int index = 0;
	float lastY = 10, currentY = 10;
	float horizon = 50;
	float upDelta = 1.5;
	float downDelta = 0.8;
	
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
	//[self addToBackdrop:CGRectMake(0, -GAME_SCREEN_HEIGHT, GAME_SCREEN_WIDTH, GAME_SCREEN_HEIGHT+lastY+2) 
	//			  Color:groundColorB];
}

-(void) tick {
	
	[super tick];
	
	if (tickCount > 7.0 * GAME_FPS) {
		
		[self fadeoutColor:skyColorA Rate:0.95];
		[self fadeoutColor:skyColorB Rate:0.95];
		[self fadeoutColor:groundColorA Rate:0.95];
		[self fadeoutColor:groundColorB Rate:0.95];
		
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

-(void) fadeoutColor:(Color *)clr Rate:(float)rate {

	clr.red *= rate;
	clr.blue *= rate;
	clr.green *= rate;
}

-(BOOL) hasFinished {
	
	//NSLog(@"BackgroundController: %d", tickCount);
	return (tickCount > duration * GAME_FPS);
}

@end
