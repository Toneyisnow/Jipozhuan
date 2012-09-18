//
//  Drawable.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-17.
//  Copyright 2011 ms. All rights reserved.
//

#import "Drawable.h"
#import "Constants.h"

@implementation Drawable

//@synthesize posX, posY, deltaX, deltaY;
@synthesize sprite;

-(id) init {
	
	self = [super init];
	return self;
}

-(id) initSprite: (Sprite *) sp {

	self = [super init];
	sprite = sp;
	
	return self;
}

-(void) setPositionX: (float)x Y:(float)y {

	//sprite.ccSprite.position = ccp(x, y);
}

-(void) setSpeedX:(float)dx Y:(float)dy Duration:(float) duration {

	//CCSprite *ccSprite = sprite.ccSprite;
	//[ccSprite runAction:[CCMoveBy actionWithDuration:duration position:ccp(dx, dy)]];

}

-(float) getPosX {
	
	//return sprite.ccSprite.position.x;
	
	// return posX;
}

-(float) getPosEndX {
	
	return [self getPosX] + [self getWidth];
	
	// return posX + [sprite getSizeX];
}

-(float) getPosY {
	//return sprite.ccSprite.position.x;
	
	//return posY;
}

-(float) getPosEndY {
	
	return [self getPosY] + [self getHeight];
	
	// return posY + [sprite getSizeY];
}

-(float) getWidth {
	
	//return sprite.ccSprite.contentSize.width;
	
	// return [sprite getSizeX];
}

-(float) getHeight {
	//return sprite.ccSprite.contentSize.height;
	
	// return [sprite getSizeY];
}

-(CGPoint) getCentral {
	
	//return sprite.ccSprite.anchorPoint;
	// return CGPointMake(posX + [sprite getSizeX]/2, posY + [sprite getSizeY]/2);

}

-(CCSprite *) getCCSprite {

	// ccSprite.position = ccp(posX, posY);
	
	//[ccSprite runAction:[CCMoveBy actionWithDuration:10.0 position:(CGPoint)deltaPosition
						 
	//return sprite.ccSprite;
}

-(bool) isDisposed {
	return false;
}

-(void) update {

	//posX += deltaX;
	//posY += deltaY;
}

+(Drawable *) generate:(Sprite *)sp X:(float)x Y:(float)y DX:(float)dx DY:(float)dy {
	
	Drawable *drawable = [[Drawable alloc] init];
	
	drawable.sprite = sp;
	//drawable.posX = x;
	//drawable.posY = y;
	//drawable.deltaX = dx;
	//drawable.deltaY = dy;
	
	//CCSprite *ccSprite = sp.ccSprite;
	
	//ccSprite.position = ccp(x, y);
	//[ccSprite runAction:[CCMoveBy actionWithDuration:10.0 position:ccp(dx, dy)]];
	
	
	return drawable;
}


@end
