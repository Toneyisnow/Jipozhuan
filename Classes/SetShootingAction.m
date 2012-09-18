//
//  SetShootingAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-29.
//  Copyright 2011 ms. All rights reserved.
//

#import "SetShootingAction.h"
#import "AirCraft.h"

@implementation SetShootingAction

-(id) initWithBool:(BOOL)shooting {

	self = [super init];
	
	setShooting = shooting;
	return self;
}

+(id) actionWithBool:(BOOL)shooting {

	return [[self alloc] initWithBool:shooting];
}

-(void) execute:(Character *)character {

	AirCraft *craft = (AirCraft *)character;
	
	if (craft == nil) {
		return;
	}
	
	[craft setShooting:setShooting];
	
}

@end
