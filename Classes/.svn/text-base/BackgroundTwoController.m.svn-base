//
//  BackgroundTwoController.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "BackgroundTwoController.h"
#import "Rectangle.h"
#import "GameConfig.h"

@implementation BackgroundTwoController

-(id) initWithLayer:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {

	self = [super initWithLayer:layer1 Backdrop:layer2];
	charlayer1 = [[NSMutableArray alloc] init];
	charlayer2 = [[NSMutableArray alloc] init];
	charlayer3 = [[NSMutableArray alloc] init];
	charlayer4 = [[NSMutableArray alloc] init];
	
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
	}
}

-(void) drawBackdrop {
	
	int sum = 0;
	float delta = 0;
	
	int totalStep = 20; int index = 0;
	float lastY = 10, currentY = 10;
	float horizon = 10;
	float upDelta = 1.0;
	
	Color *skyColorA = [Color R:20 G:20 B:20];
	Color *skyColorB = [Color R:30 G:30 B:250];
	
	for(int i=1;i<= totalStep;i++)
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
	[self addToBackdrop:CGRectMake(0, lastY, GAME_SCREEN_WIDTH, 100) 
				  Color:skyColorB];
	
	[self addToBackdrop:CGRectMake(0, 0, GAME_SCREEN_WIDTH, horizon) 
					Color:[Color R:0 G:0 B:0]];
}

-(void) updateLayer:(NSMutableArray *)layer index:(int)ind {
	
	// Constants
	NSString *groundCharacter = @"林";
	Color *groundCharacterColor = [Color R:20 G:120 B:20];
	float baseSpeed = 45;
	float horizon = 10;
	float angel = -0.66;
	
	if (stage == 1) {
		return;
	}
	
	float index = 0;
	switch (ind) {
		case 1:
			index = 2.0;
			break;
		case 2:
			index = 3.5;
			break;
		case 3:
			index = 6.0;
			break;
		case 4:
		default:
			index = 9.0;
			break;
	}
	
	if([layer count] < 1 ||
	   ((stage == 0) && [[layer lastObject] getEndPosition].x < GAME_SCREEN_WIDTH) ||
	   ((stage == 2) && [[layer lastObject] getPosition].x > 0))
	{
		float dx = baseSpeed * index;
		float size = index * 25;
		float pY = horizon - (index - 1) * angel * 15;
			
		Character *ch = [[Character alloc] initWithChar:groundCharacter Size:size];
		[ch setColor:groundCharacterColor];
		[ch setOpacity:(ind/4.0)*255];
			
		if (stage == 0) {
			[ch setPositionX:(GAME_SCREEN_WIDTH + [ch getSize].width - 50 - index * 3) Y:pY];
		} else {
			[ch setPositionX:(-[ch getSize].width - index * 3) Y:pY];
		}

		[ch setSpeedX:((stage == 0) ? -dx: dx) Y:0];
		[ch addToScene:itemLayer];
		[layer addObject:ch];
	}
	
	if([layer count] > 0) {
		if((stage == 0 && [[layer objectAtIndex:0] getEndPosition].x < 0) ||
		   (stage == 2 && [[layer objectAtIndex:0] getPosition].x > GAME_SCREEN_WIDTH + [[layer objectAtIndex:0] getSize].width)) {
			[[layer objectAtIndex:0] removeFromCurrentScene];
			[layer removeObjectAtIndex:0];
		}
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

-(void) setStage:(int)s {
	[super setStage:s];
	
	if (s == 1) {
		// Stop All the background items
		[self stopLayer:charlayer1];
		[self stopLayer:charlayer2];
		[self stopLayer:charlayer3];
		[self stopLayer:charlayer4];
		
		[self revertLayer:charlayer1];
		[self revertLayer:charlayer2];
		[self revertLayer:charlayer3];
		[self revertLayer:charlayer4];
				
		NSLog(@"Layer 1 Count: %d", [charlayer1 count]);
		NSLog(@"Finished reverting array");
		
		NSLog(@"%@", [[charlayer1 objectAtIndex:0] getCharacter]);
	}
	
	if (s == 2) {
		// Backward moving
		
		NSLog(@"%@", [[charlayer1 objectAtIndex:0] getCharacter]);
		[self backwardLayer:charlayer1 index:1];
		[self backwardLayer:charlayer2 index:2];
		[self backwardLayer:charlayer3 index:3];
		[self backwardLayer:charlayer4 index:4];
		NSLog(@"Backward finished.");
	}
}

-(void) stopLayer: (NSMutableArray *)layer {

	for (int i = 0; i < [layer count]; i++) {
		Character *ch = [layer objectAtIndex:i]; [ch setSpeedX:0 Y:0];
	}
}

-(void) revertLayer: (NSMutableArray *)layer {

	NSUInteger i = 0;
	NSUInteger j = [layer count] - 1;
	while (i < j) {
		[layer exchangeObjectAtIndex:i
						withObjectAtIndex:j];
		i++;
		j--;
	}
}

-(void) backwardLayer:(NSMutableArray *)layer index:(int)ind {

	float baseSpeed = 45;
	float index = 0;
	switch (ind) {
		case 1:
			index = 2.0;
			break;
		case 2:
			index = 3.5;
			break;
		case 3:
			index = 6.0;
			break;
		case 4:
		default:
			index = 9.0;
			break;
	}
	float dx = baseSpeed * index;
	
	for (int i = 0; i < [layer count]; i++) {
		Character *ch = [layer objectAtIndex:i];
		[ch setSpeedX:dx Y:0];
	}
	
}

@end
