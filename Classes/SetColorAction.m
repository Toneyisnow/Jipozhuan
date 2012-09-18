//
//  SetColorAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-25.
//  Copyright 2011 ms. All rights reserved.
//

#import "SetColorAction.h"


@implementation SetColorAction

-(id) initWithMyColor:(Color *)c {

	self = [super init];
	color = c;
	return self;
}

+(id) actionWithColor:(Color *)c {

	return [[self alloc] initWithMyColor:c];
}

-(void) execute:(Character *)character {

	[character setColor:color];
}

@end
