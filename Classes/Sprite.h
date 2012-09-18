//
//  Sprite.h
//  Jipozhuan
//
//  Created by sui toney on 10-12-4.
//  Copyright 2010 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ContainerLayer.h"
#import "Color.h"

@interface Sprite : NSObject {
	
	ContainerLayer	*currentScene;
	BOOL disposeFlag;

	Color *_color;
	float _opacity;
	float _scaleX, _scaleY;
	float _speedX, _speedY;
	
	// Note: position is not saved in the object, it will be 
	// a virtual method which is implemented by sub-classes.
}

-(void) setColor:(Color *)color;
-(void) setOpacity:(float)opacity;
-(void) setScaleX:(float)x Y:(float)y;
-(void) setPositionX:(float)x Y:(float)y;
-(void) setSpeedX:(float)dx Y:(float)dy;

-(Color *) getColor;
-(float) getOpacity;
-(CGPoint) getScale;
-(CGPoint) getPosition;
-(CGPoint) getSpeed;

-(void) changeSpeedDX:(float)dx DY:(float)dy;
-(void) bringToFront;	// TODO: this cannot work yet

-(CGSize)  getSize;
-(CGPoint) getStartPosition;
-(CGPoint) getEndPosition;

-(void) addToScene:(ContainerLayer *)scene;
-(void) removeFromCurrentScene;

-(BOOL) shouldBeDisposed;
-(void) setDisposeFlag;

@end
