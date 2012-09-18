//
//  ColorfulAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-3.
//  Copyright 2011 ms. All rights reserved.
//

#import "ColorfulAction.h"


@implementation ColorfulAction

-(id) initWithRate:(float)r {

	self = [super init];
	rate = r;
	red = 0;
	return self;
}


+(id) actionWithRate:(float)r {

	return [[self alloc] initWithRate:r];
}

-(void) execute:(Character *)character {

	red = ((int)(red + rate)) % 256;
	int green = 20;
	int blue = 255 - red;
	
	//NSLog(@"Execute: %d %d %d", red, green, blue);
	[character setColor:[Color R:red G:green B:blue]];
}

-(BOOL) hasFinished:(Character *)character {

	return FALSE;
}

@end
