//
//  SetCharacterAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-25.
//  Copyright 2011 ms. All rights reserved.
//

#import "SetCharacterAction.h"


@implementation SetCharacterAction

-(id) initWithString:(NSString *)ch {
	self = [super init];
	newch = ch;
	return self;
}

+(id) actionWithString:(NSString *)ch {
	return [[self alloc] initWithString:ch];
}

-(void) execute:(Character *)character {

	[character setCharacter:newch];
}

@end
