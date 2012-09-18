//
//  BackgroundFourController.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "BackgroundFourController.h"
#import "GameConfig.h"
#import "Common.h"

@implementation BackgroundFourController

-(id) initWithLayer:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {
	
	self = [super initWithLayer:layer1 Backdrop:layer2];
	charlayer1 = [[NSMutableArray alloc] init];
	charlayer2 = [[NSMutableArray alloc] init];
	charlayer3 = [[NSMutableArray alloc] init];
	charlayer4 = [[NSMutableArray alloc] init];
	skyCharlayer = [[NSMutableArray alloc] init];
	
	return self;
}

-(void) tick {
	
	[super tick];
	//backgroundStarted = FALSE;
	
	if (backgroundStarted) {
		[self updateLayer:charlayer1 index:1];
		[self updateLayer:charlayer2 index:2];
		[self updateLayer:charlayer3 index:3];
		[self updateLayer:charlayer4 index:4];
		[self updateSky];
	}
}

-(void) drawBackdrop {
	
	int sum = 0;
	float delta = 0;
	
	int totalStep = 20; int index = 0;
	float lastY = 10, currentY = 10;
	float horizon = 50;
	float upDelta = 1.5;
	float downDelta = 0.8;
	
	Color *skyColorA = [Color R:200 G:200 B:200];
	Color *skyColorB = [Color R:0 G:120 B:250];
	
	Color *groundColorA = [Color R:100 G:100 B:200];
	Color *groundColorB = [Color R:60 G:60 B:200];
	
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

-(void) updateSky {

	if([skyCharlayer count] < 1 || [[skyCharlayer lastObject] getPosition].x - 20 < GAME_SCREEN_WIDTH)
	{
		float baseSpeed = 40;
		float size = [Common getRandomFrom:10 To:80];
		float posY = [Common getRandomFrom:GAME_SCREEN_HEIGHT/2 To:GAME_SCREEN_WIDTH*0.8];
		
		int random = [Common getRandomFrom:0 To:2];
		
		Character *ch = [[Character alloc] initWithChar:(random ? @"云" : @"雾") Size:size];
		[ch setColor:[Color R:255 G:255 B:255]];
		[ch setOpacity:[Common getRandomFrom:50 To:200]];
		[ch setPositionX:(GAME_SCREEN_WIDTH + [ch getSize].width) Y:posY];
		[ch setSpeedX:-(baseSpeed+[Common getRandomFrom:0 To:20]) Y:0];
		[ch addToScene:itemLayer];
		[skyCharlayer addObject:ch];
	}
	
	if([skyCharlayer count] > 0 && [[skyCharlayer objectAtIndex:0] getEndPosition].x < 0)
	{
		[[skyCharlayer objectAtIndex:0] removeFromCurrentScene];
		[skyCharlayer removeObjectAtIndex:0];
	}
	
}

-(void) updateLayer:(NSMutableArray *)layer index:(int)ind {
	
	
	// Constants
	NSString *groundCharacter = @"海";
	Color *groundCharacterColor = [Color R:80 G:120 B:120];
	float baseSpeed = 45;
	float horizon = 50;
	float angel = 0.7;
	
	float index = 0;
	switch (ind) {
		case 1:
			index = 2.0;
			break;
		case 2:
			index = 3.0;
			break;
		case 3:
			index = 4.0;
			break;
		case 4:
		default:
			index = 5.0;
			break;
	}
	
	if([layer count] < 1 || [[layer lastObject] getEndPosition].x < GAME_SCREEN_WIDTH)
	{
		float dx = baseSpeed * index;
		float size = index * 10;
		float pY = horizon - (index - 1) * angel * 18;
		
		Character *ch = [[Character alloc] initWithChar:groundCharacter Size:size];
		[ch setColor:groundCharacterColor];
		[ch setOpacity:(ind/4.0)*255];
		[ch setPositionX:(GAME_SCREEN_WIDTH + [ch getSize].width) Y:pY];
		[ch setSpeedX:-dx Y:0];
		[ch addToScene:itemLayer];
		[layer addObject:ch];
	}
	
	if([layer count] > 0 && [[layer objectAtIndex:0] getEndPosition].x < 0) {
		[[layer objectAtIndex:0] removeFromCurrentScene];
		[layer removeObjectAtIndex:0];
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

@end
