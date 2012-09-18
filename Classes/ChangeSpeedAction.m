//
//  ChangeSpeedAction.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-22.
//  Copyright 2011 ms. All rights reserved.
//

#import "ChangeSpeedAction.h"
#import "GameConfig.h"

@implementation ChangeSpeedAction

-(id) initWithDX:(float)dx DY:(float)dy TX:(float)tx TY:(float)ty Duration:(float)du {

	self = [super init];
	deltaX = dx;
	deltaY = dy;
	targetX = tx;
	targetY = ty;
	duration = du * GAME_FPS;
	return self;
}

+(id) actionWithDX:(float)dx DY:(float)dy TX:(float)tx TY:(float)ty Duration:(float)du {

	return [[self alloc] initWithDX:dx DY:dy TX:tx TY:ty Duration:du];
}

-(void) execute:(Character *)character {

	[character changeSpeedDX:deltaX DY:deltaY];
	duration --;
}

-(BOOL) hasFinished:(Character *)character {
	
	return (duration <= 0);
}

@end
