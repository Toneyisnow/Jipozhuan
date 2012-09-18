//
//  MainGameLayer.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-22.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Hero.h"
#import "chipmunk.h"
#import "ContainerLayer.h"
#import "Rectangle.h"
#import "SolidCharacter.h"
#import "AbstractGame.h"

@interface MainGameLayer : ContainerLayer {

	AbstractGame *currentGame;
	
	// Temp
	CCLabelTTF *label;
	SolidCharacter *sch;
	Rectangle *rect;
	
}

-(void) setCurrentGame:(AbstractGame *)game;

-(BOOL) isOutOfScreen: (CCLabelTTF *)node;

// Recycle the objects that are out of screen
-(void) recycle;
@end
