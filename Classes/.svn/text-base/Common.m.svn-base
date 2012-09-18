//
//  Common.m
//  Jipozhuan
//
//  Created by sui toney on 10-12-6.
//  Copyright 2010 ms. All rights reserved.
//

#import "Common.h"
//#import "cocos2d.h"

@implementation Common

+(float) update:(float)origin Delta:(float)d Min:(float)min Max:(float)max {

	float result = origin + d;
	
	if(result > max)
	{
		result = max;
	}
	if(result < min)
	{
		result = min;
	}
	return result;
}

+(float) getRandomFrom:(float)min To:(float)max {

	float r = ((random() / (float)0x7fffffff ));
	float val = r * (max - min) + min;
	return val;
}


@end
