//
//  TransitionOneController.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-11.
//  Copyright 2011 ms. All rights reserved.
//

#import "TransitionOneController.h"
#import "GameConfig.h"

@implementation TransitionOneController

-(id) initWithLayer:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {

	self = [super initWithLayer:layer1 Backdrop:layer2];
	duration = 0.5;
	
	return self;
}

-(void) drawBackdrop {
	
	int sum = 0;
	float delta = 0;
	
	int totalStep = 20; int index = 0;
	float lastY = 10, currentY = 10;
	float horizon = 200;
	float upDelta = 1.0;
	float downDelta = 1.2;
	
	Color *skyColorA = [Color R:200 G:200 B:200];
	Color *skyColorB = [Color R:0 G:0 B:200];
	
	Color *groundColorA = [Color R:180 G:185 B:190];
	Color *groundColorB = [Color R:100 G:127 B:100];
	
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
