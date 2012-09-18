//
//  GameScene.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-17.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MainGameLayer.h"
#import "ForegroundLayer.h"
#import "AlertLayer.h"

@interface MainGameScene : CCScene {

	MainGameLayer *mainGameLayer;
	ContainerLayer *backgroundLayer;
	ContainerLayer *backdropLayer;
	ForegroundLayer *foregroundLayer;
	AlertLayer *alertLayer;
	
	id gameInstance;
}

+(MainGameScene *) scene;
+(void) releaseDistance;

@property (assign) MainGameLayer *mainGameLayer;
@property (assign) ContainerLayer *backgroundLayer;
@property (assign) ContainerLayer *backdropLayer;
@property (assign) ForegroundLayer *foregroundLayer;
@property (assign) AlertLayer *alertLayer;

-(void) gameStart;

@end
