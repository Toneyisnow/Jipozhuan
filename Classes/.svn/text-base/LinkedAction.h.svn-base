//
//  LinkedAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-27.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface LinkedAction : NSObject
{
	int actionTick;
	float actioinTime;
	AbstractAction *action;
	LinkedAction *nextAction;
}

-(id) initAction:(AbstractAction *)action At:(int)tick;
-(id) initAction:(AbstractAction *)action AtTime:(float)time;
-(void) setNext:(LinkedAction *)linkedAction;
-(AbstractAction *)getAction;
-(LinkedAction *)getNext;
-(int) getTick;

-(void) addAction:(AbstractAction *)action At:(int)tick;
-(void) addAction:(AbstractAction *)action AtTime:(float)time;


@end
