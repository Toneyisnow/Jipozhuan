//
//  Rectangle.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-21.
//  Copyright 2011 ms. All rights reserved.
//

#import "Rectangle.h"


@implementation Rectangle

-(id) init {

	self = [super init];
	ccSprite = [CCSprite node];
	ccSprite.anchorPoint = ccp(0, 0);
	return self;
}

-(void) setColor:(Color *)color {
	
	ccSprite.color = ccc3(color.red, color.green, color.blue);
}

-(void) setOpacity:(float)opacity {

	ccSprite.opacity = opacity;
}

-(void) setSizeX:(float)x Y:(float)y {
	
	ccSprite.textureRect = CGRectMake(0, 0, x, y);
}

-(void) setPositionX:(float)x Y:(float)y {
	
	ccSprite.position = ccp(x, y);
}

-(CGPoint) getPosition {
	
	return ccSprite.position;
}

-(void) setSpeedX:(float)dx Y:(float)dy Duration:(float) duration {
	
	// TODO
}

-(void) addToScene:(ContainerLayer *)scene {

	currentScene = scene;
	[currentScene addChild:ccSprite];
}

-(void) removeFromCurrentScene {
	
	if (ccSprite == nil || ccSprite.parent == nil) {
		return;
	}
	CCNode *parent = ccSprite.parent;
	[parent removeChild:ccSprite cleanup:YES];
}

@end
