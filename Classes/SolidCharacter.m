//
//  SolidCharacter.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-21.
//  Copyright 2011 ms. All rights reserved.
//

#import "SolidCharacter.h"


@implementation SolidCharacter

-(id) initWithChar:(NSString *)ch Size:(float)size {

	return [self initWithChar:ch Size:size Anchor:CGPointMake(0.5, 0.5)];
}

-(id) initWithChar:(NSString *)ch Size:(float)size Anchor:(CGPoint)anchor {
	
	self = [super initWithChar:ch Size:size Anchor:anchor];
	
	explodeCurve = nil;
	solid = TRUE;
	
	float sizeX = ccLabel.textureRect.size.width;
	float sizeY = ccLabel.textureRect.size.height;
	
	// To get rid of the edge of the character
	sizeX = sizeX * 0.75 - 5;
	sizeY = sizeY * 0.75 - 5;
	
	sizeX = (sizeX > 0)? sizeX : 1;
	sizeY = (sizeY > 0)? sizeY : 1;
	
	int num = 4;
	float adjust = 0.25;
	CGPoint verts[] = {
		ccp(sizeX/2*(-1-anchor.x), sizeY/2*(-1-anchor.y+adjust)),
		ccp(sizeX/2*(-1-anchor.x), sizeY/2*( 1-anchor.y+adjust)),
		ccp(sizeX/2*( 1-anchor.x), sizeY/2*( 1-anchor.y+adjust)),
		ccp(sizeX/2*( 1-anchor.x), sizeY/2*(-1-anchor.y+adjust))
	};
	
	body = cpBodyNew(1.0f, cpMomentForPoly(1.0f, num, verts, CGPointZero));
	body->p = ccp(0, 0);
	body->v = ccp(0, 0);
	
	shape = cpPolyShapeNew(body, num, verts, CGPointZero);
	shape->e = 0.5f;
	shape->u = 0.5f;
	shape->data = self;
	shape->collision_type = ShapeTypeDefault;	// This should be overwritten by subclass
		
	return self;
}

-(void) addToScene:(ContainerLayer *)scene {
	
	currentScene = scene;
	
	// Add Label
	[scene addChild:ccLabel];
	ccLabel.position = ccp(myPosition.x, myPosition.y);
	
	// Add Body and Shape
	cpSpace *space = [scene getSpace];
	cpSpaceAddBody(space, body);
	cpSpaceAddShape(space, shape);
	
}

-(void) removeFromCurrentScene {
	
	CCNode *parent = ccLabel.parent;
	[parent removeChild:ccLabel cleanup:YES];
	
	//[defaultCurve release];
	//[explodeCurve release];
	
	cpSpace *space = [currentScene getSpace];
	cpSpaceRemoveBody(space, body);
	cpSpaceRemoveShape(space, shape);
	cpShapeFree(shape);
	cpBodyFree(body);
}

-(void) setFontSize:(float)size {
	
	// TODO: currently we dont have method to impliment this
}

/*
-(void) setScaleX:(float)x Y:(float)y {
	
	[ccLabel setScaleX:x];
	[ccLabel setScaleY:y];
	
	// TODO: change the body?
}*/

-(void) setPositionX:(float)x Y:(float)y {
	
	body->p = ccp(x, y);
	myPosition = CGPointMake(x, y);
}
-(void) setSpeedX:(float)dx Y:(float)dy {
	
	_speedX = dx;
	_speedY = dy;
	body->v = ccp(dx, dy);
}

-(CGPoint) getSpeed {

	return (CGPoint)(body->v);
}

-(void) changeSpeedDX:(float)dx DY:(float)dy {

	float vx = (body->v).x;
	float vy = (body->v).y;
	
	vx += dx;
	vy += dy;
	
	body->v = ccp(vx, vy);
	[super setSpeedX:vx Y:vy];
}

-(void) setAnchorPoint:(CGPoint)anchor {
	
	ccLabel.anchorPoint = ccp(anchor.x, anchor.y);
	float sizeX = ccLabel.textureRect.size.width;
	float sizeY = ccLabel.textureRect.size.height;
	
	cpSpace *space = [currentScene getSpace];
	
	cpSpaceRemoveBody(space, body);
	cpSpaceRemoveShape(space, shape);
	//[body release];
	//[shape release];
	
	int num = 4;
	
	// To get rid of the edge of the character
	sizeX = sizeX * 0.8 - 5;
	sizeY = sizeY * 0.8 - 5;
	
	sizeX = (sizeX > 0)? sizeX : 1;
	sizeY = (sizeY > 0)? sizeY : 1;
	CGPoint verts[] = {
		ccp(sizeX/2*(-1-anchor.x), sizeY/2*(-1-anchor.y)),
		ccp(sizeX/2*(-1-anchor.x), sizeY/2*( 1-anchor.y)),
		ccp(sizeX/2*( 1-anchor.x), sizeY/2*( 1-anchor.y)),
		ccp(sizeX/2*( 1-anchor.x), sizeY/2*(-1-anchor.y))
	};
	
	body = cpBodyNew(1.0f, cpMomentForPoly(1.0f, num, verts, CGPointZero));
	body->p = ccp(0, 0);
	body->v = ccp(0, 0);
	
	shape = cpPolyShapeNew(body, num, verts, CGPointZero);
	shape->e = 0.5f;
	shape->u = 0.5f;
	shape->data = self;
	shape->collision_type = ShapeTypeDefault;	// This should be overwritten by subclass
	
	cpSpaceAddBody(space, body);
	cpSpaceAddShape(space, shape);	
}

-(void) onCollision:(int) power {

}

-(void) onExplode {
	
}

-(int) getPower {
	return power;
}

-(void) setPower:(int)p {
	power = p;
}

-(BOOL) isSolid {
	return solid;
}

-(void) setSolid:(BOOL)s {
	solid = s;
}

-(void) setExplodeCurve:(Curve *)curve {

	explodeCurve = curve;
}

-(void) release {

	[explodeCurve release];
	[super release];
}

@end
