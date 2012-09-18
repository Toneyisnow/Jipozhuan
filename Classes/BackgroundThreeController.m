//
//  BackgroundThreeController.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "BackgroundThreeController.h"
#import "GameConfig.h"

@implementation BackgroundThreeController

-(id) initWithLayer:(ContainerLayer *)layer1 Backdrop:(ContainerLayer *)layer2 {
	
	self = [super initWithLayer:layer1 Backdrop:layer2];
	charlayer1 = [[NSMutableArray alloc] init];
	charlayer2 = [[NSMutableArray alloc] init];
	charlayer3 = [[NSMutableArray alloc] init];
	charlayer4 = [[NSMutableArray alloc] init];
	charlayer5 = [[NSMutableArray alloc] init];
	charlayer6 = [[NSMutableArray alloc] init];
	charlayer7 = [[NSMutableArray alloc] init];
	charlayer8 = [[NSMutableArray alloc] init];
	charlayer9 = [[NSMutableArray alloc] init];
	charlayer10 = [[NSMutableArray alloc] init];
	charlayer11 = [[NSMutableArray alloc] init];
	charlayer12 = [[NSMutableArray alloc] init];
	
	return self;
}

-(void) tick {
	
	[super tick];
	//backgroundStarted = FALSE;
	
	if (backgroundStarted) {
		[self updateLayer:charlayer1 index:0];
		[self updateLayer:charlayer2 index:1];
		[self updateLayer:charlayer3 index:2];
		[self updateLayer:charlayer4 index:3];
		[self updateLayer:charlayer5 index:4];
		[self updateLayer:charlayer6 index:5];
		[self updateLayer:charlayer7 index:6];
		[self updateLayer:charlayer8 index:7];
		[self updateLayer:charlayer9 index:8];
		[self updateLayer:charlayer10 index:9];
		[self updateLayer:charlayer11 index:10];
		[self updateLayer:charlayer12 index:11];
	}
}

-(void) updateLayer:(NSMutableArray *)layer index:(int)ind {
	
	
	// Constants
	NSString *groundCharacter = @"草";
	Color *groundCharacterColor = [Color R:80 G:180 B:20];
	float baseSpeed = 200;
	float horizon = GAME_SCREEN_HEIGHT;
	float angel = 34;
	
	float M = 24;
	float column = 0.8;
	float lastPosition = GAME_SCREEN_WIDTH / 2 + (GAME_SCREEN_WIDTH/2 + ind * M) * column;
	
	if([layer count] < 1 || [[layer lastObject] getEndPosition].x < lastPosition)
	{
		float dx = baseSpeed * (ind*M*2 + GAME_SCREEN_WIDTH) / GAME_SCREEN_WIDTH;
		float size = ind + 25;
		float pY = horizon - ind * angel;
		
		Character *ch = [[Character alloc] initWithChar:groundCharacter Size:size];
		[ch setColor:groundCharacterColor];
		[ch setOpacity:127 + (ind/9.0)*127];
		[ch setPositionX:(GAME_SCREEN_WIDTH + [ch getSize].width + ind*M) Y:pY];
		[ch setSpeedX:-dx Y:0];
		[ch addToScene:itemLayer];
		[layer addObject:ch];
	}
	
	if([layer count] > 0 && [[layer objectAtIndex:0] getEndPosition].x < 0) {
		[[layer objectAtIndex:0] removeFromCurrentScene];
		[layer removeObjectAtIndex:0];
	}
}

-(void) drawBackdrop {
	
	int sum = 0;
	float delta = 0;
	
	int totalStep = 20; int index = 0;
	float horizon = GAME_SCREEN_WIDTH;
	float downDelta = 15;
	
	Color *groundColorA = [Color R:10 G:80 B:10];
	Color *groundColorB = [Color R:50 G:220 B:50];
	
	float lastY = horizon, currentY = horizon;
	for(int i=1;i< totalStep;i++)
	{
		delta = downDelta + i * 3;
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
	//[self addToBackdrop:CGRectMake(0, 0, GAME_SCREEN_WIDTH, GAME_SCREEN_HEIGHT) 
	//			  Color:[Color R:50 G:250 B:50]];
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
