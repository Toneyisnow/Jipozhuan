//
//  SequencedCharacterBuilder.m
//  Jipozhuan
//
//  Created by sui toney on 11-1-29.
//  Copyright 2011 ms. All rights reserved.
//

#import "SequencedCharacterBuilder.h"


@implementation SequencedCharacterBuilder

-(id) initWithChar:(Character *)ch Interval:(int)i {

	self = [super init];
	character = ch;
	interval = i;
	beeper = 0;
	return self;
}

-(Character *) compose {

	if (beeper < 0 || beeper >= interval) {
		beeper = 0;
		return [character copy];
	} else {
		beeper ++;
		return nil;
	}
}

@end
