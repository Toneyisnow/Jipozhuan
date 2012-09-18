//
//  Curve.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-22.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"
#import "LinkedAction.h"

//#import "Character.h"

@interface Curve : NSObject {

	int initialTick;
	
	//NSMutableDictionary *actionDictionary;
	
	LinkedAction *linkedAction;
	
	NSMutableArray *runningActions;
	
}

//-(id) initWithCharacter:(Character *)ch;

-(void) addAction:(AbstractAction *)action Tick:(int)tick;
-(void) addAction:(AbstractAction *)action Time:(float)time;

-(void) takeTick:(int)gameTick target:(Character *)character;

-(void) runAction:(Character *)character;

-(void) setTimeout:(int)gameTick;
-(void) setTimeoutTime:(float)time;

//// This is used for debugging
-(NSString *) getNextActionName;

//-(Character *) getCharacter;

//@property (retain) LinkedAction *linkedAction;

@end


