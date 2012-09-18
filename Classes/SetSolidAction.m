//
//  SetSolodAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-29.
//  Copyright 2011 ms. All rights reserved.
//

#import "SetSolidAction.h"
#import "AirCraft.h"

@implementation SetSolidAction

-(id) initWithSolid:(BOOL)s Invincible:(BOOL)i {

	self = [super init];
	setSolid = s;
	setInvincible = i;
	return self;
}

+(id) actionWithSolid:(BOOL)s Invincible:(BOOL)i {

	return [[self alloc] initWithSolid:s Invincible:i];
}

-(void) execute:(Character *)character {

	AirCraft *craft = (AirCraft *)character;
	if (craft == nil) {
		return;
	}
	
	[craft setSolid:setSolid];
	[craft setInvincible:setInvincible];
}
			
@end
