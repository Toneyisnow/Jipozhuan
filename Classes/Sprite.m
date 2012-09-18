//
//  Sprite.m
//  Jipozhuan
//
//  Created by sui toney on 10-12-4.
//  Copyright 2010 ms. All rights reserved.
//

#import "Sprite.h"

@implementation Sprite

-(id) init {
	
	self = [super init];
	disposeFlag = FALSE;
	
	return self;
}

-(void) setColor:(Color *)color {
	_color = color;
}

-(void) setOpacity:(float)opacity {
	_opacity = opacity;
}

-(void) setScaleX:(float)x Y:(float)y {
	_scaleX = x;
	_scaleY = y;
}

-(void) setPositionX:(float)x Y:(float)y {
	// TODO: This is a virtual method
}

-(void) setSpeedX:(float)dx Y:(float)dy {
	_speedX = dx;
	_speedY = dy;
}

-(Color *) getColor {
	return _color;
}

-(float) getOpacity {
	return _opacity;
}

-(CGPoint) getScale {
	return CGPointMake(_scaleX, _scaleY);
}

-(CGPoint) getPosition {
	// TODO: This is a virtual method
	return CGPointMake(0, 0);
}

-(CGPoint) getSpeed {
	return CGPointMake(_speedX, _speedY);
}

-(void) changeSpeedDX:(float)dx DY:(float)dy {

}

-(void) bringToFront {

}


-(CGPoint) getStartPosition {
	return [self getPosition];
}

-(CGPoint) getEndPosition {
	return [self getPosition];
}

-(CGSize) getSize {
	return CGSizeMake(0, 0);
}

-(void) addToScene:(ContainerLayer *)scene {
}

-(void) removeFromCurrentScene {
	
	NSLog(@"Remove from current scene [Sprite]. This should be overridden by sub class.");
}

-(BOOL) shouldBeDisposed {
	return disposeFlag;
}

-(void) setDisposeFlag {
	disposeFlag = TRUE;
}

@end
