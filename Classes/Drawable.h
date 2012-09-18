//
//  Drawable.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-17.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpriteChar.h"
#import "cocos2d.h"

@interface Drawable : NSObject {

	Sprite *sprite;
	
	//CCSprite *ccSprite;
	
	//float posX, posY;
	//float deltaX, deltaY;
	
}

//@property float deltaX;
//@property float deltaY;
//@property float posX;
//@property float posY;
@property (nonatomic, retain) Sprite *sprite;

-(id) initSprite: (Sprite *) sp;

// -(void) draw;
-(void) update;

-(CCSprite *) getCCSprite;

-(void) setPositionX:(float)x Y:(float)y;
-(void) setSpeedX:(float)dx Y:(float)dy Duration:(float) duration;
	
-(float) getPosX;
-(float) getPosY;
-(float) getPosEndX;
-(float) getPosEndY;
-(float) getWidth;
-(float) getHeight;
-(CGPoint) getCentral;

-(bool) isDisposed;		// Indicates that this item should be removed from screen

+(Drawable *) generate:(Sprite *)sp X:(float)x Y:(float)y DX:(float)dx DY:(float)dy;

@end
