//
//  Character.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-21.
//  Copyright 2011 ms. All rights reserved.
//

#import "Character.h"
#import "GameConfig.h"
#import "Constants.h"

@implementation Character

@synthesize ccLabel;

-(id) init {

	NSLog(@"[Character] Should not call the default constructer.");
	return nil;
}

-(id) initWithChar:(NSString *)ch Size:(float)size {

	return [self initWithChar:ch Size:size Anchor:CGPointMake(0.5, 0.5)];
}

-(id) initWithChar:(NSString *)ch Size:(float)size Anchor:(CGPoint)anchor {

	self = [super init];
	// ccLabel = [CCLabelTTF labelWithString:ch fontName:@"Marker Felt" fontSize:size];
	// ccLabel = [CCLabelTTF labelWithString:ch fontName:@"Arial" fontSize:size];
	ccLabel = [CCLabelTTF labelWithString:ch fontName:@"Marker Felt" fontSize:size];
	character = ch;
	fontSize = size;
	myPosition = CGPointMake(0, 0);
	
	ccLabel.anchorPoint = ccp(anchor.x, anchor.y);
	
	return self;	
}

-(void) bringToFront {

}

-(void) addToScene:(ContainerLayer *)scene {
	
	currentScene = scene;
	[currentScene addChild:ccLabel];
	//[currentScene addC
}

-(void) removeFromCurrentScene {
	
	if (ccLabel == nil || ccLabel.parent == nil) {
		return;
	}
	CCNode *parent = ccLabel.parent;
	[parent removeChild:ccLabel cleanup:YES];
}

-(void) setCharacter:(NSString *)ch {

	[ccLabel setString:ch];
	character = ch;
}

-(void) setFontSize:(float)size {

	// TODO: currently we dont have method to impliment this
}

-(void) setColor:(Color *)color {

	[super setColor:color];
	ccLabel.color = ccc3(color.red, color.green, color.blue);
}

-(void) setOpacity:(float)opacity {

	[super setOpacity:opacity];
	ccLabel.opacity = opacity;
}

-(void) setScaleX:(float)x Y:(float)y {
	
	[super setScaleX:x Y:y];
	[ccLabel setScaleX:x];
	[ccLabel setScaleY:y];
}

-(void) setPositionX:(float)x Y:(float)y {

	ccLabel.position = ccp(x, y);
	myPosition = CGPointMake(x, y);
}
-(void) setSpeedX:(float)dx Y:(float)dy {
	
	//[super setSpeedX:dx Y:dy Duration:1.0];
	[ccLabel runAction:[CCMoveBy actionWithDuration:TIME_INFINITE position:ccp(dx * TIME_INFINITE, dy * TIME_INFINITE)]];
}

-(CGPoint) getPosition {

	return CGPointMake(ccLabel.position.x, ccLabel.position.y);
}

-(CGPoint) getMyPosition {

	return myPosition;
}

-(CGSize) getSize {

	return ccLabel.textureRect.size;
}

-(CGPoint) getStartPosition {
	
	float posX = ccLabel.position.x - [self getSize].width/2;
	float posY = ccLabel.position.y - [self getSize].height/2;
	
	return CGPointMake(posX, posY);
}

-(CGPoint) getEndPosition {
	
	float posX = ccLabel.position.x + [self getSize].width/2;
	float posY = ccLabel.position.y + [self getSize].height/2;
	
	return CGPointMake(posX, posY);
}

-(NSString *) getCharacter {

	return character;
}

-(float) getFontSize {

	return fontSize;
}

-(void) setAnchorPoint:(CGPoint)point {

	ccLabel.anchorPoint = ccp(point.x, point.y);
	
}

-(Character *) colone {
	
	Character *newChar = [[Character alloc] initWithChar:character Size:fontSize];
	[newChar setColor:[self getColor]];
	[newChar setOpacity:[self getOpacity]];
	[newChar setScaleX:[self getScale].x Y:[self getScale].y];
	[newChar setPositionX:[self getPosition].x Y:[self getPosition].y];
	[newChar setSpeedX:[self getSpeed].x Y:[self getSpeed].y];
	
	return newChar;
}

-(BOOL) isCenterInScreen {

	return ([self getPosition].x > 0 && [self getPosition].x < [Constants gameScreenWidth]
			&& [self getPosition].y > 0 && [self getPosition].y < [Constants gameScreenHeight]);
}


@end
