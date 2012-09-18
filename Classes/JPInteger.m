//
//  JPInteger.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-18.
//  Copyright 2011 ms. All rights reserved.
//

#import "JPInteger.h"


@implementation JPInteger

@synthesize value;

+(JPInteger *) new:(int)val {

	JPInteger *v = [[JPInteger alloc] init];
	v.value = val;
	return v;
}

-(int) getValue {

	return value;
}

@end
