//
//  Foreground.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-1.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForegroundLayer.h"
#import "AlertLayer.h"
#import "Character.h"

@interface Foreground : NSObject {

	ForegroundLayer *foregroundLayer;
	AlertLayer *alertLayer;
	
	Character *message;
	
	int leftHeroCount;
	int leftShockwaveCount;
	NSMutableArray *leftHeroes;
	NSMutableArray *leftShockwaves;
	
}

-(id) initWithScreen:(ForegroundLayer *)layer AlertLayer:(AlertLayer *)alert Game:(id)game;
-(void) setLeftHero:(int) count;
-(void) setLeftShockwave:(int) count;

-(void) showLeftHeroes;
-(void) showLeftShockwave;
-(void) showControllers;

// These are not used
-(void) showAlert;
-(void) hideAlert;
-(void) showAlert:(Character *)msg;

-(void) onShow;
-(void) onHide;

@end
