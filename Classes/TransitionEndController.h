//
//  TransitionEndController.h
//  Jipozhuan
//
//  Created by sui toney on 11-3-31.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BackgroundController.h"

@interface TransitionEndController : BackgroundController {

	float duration;

	Color *skyColorA;
	Color *skyColorB;
	
	Color *groundColorA;
	Color *groundColorB;
	
}

-(void) addToBackdrop:(CGRect) rect Color:(Color *) clr;

-(void) fadeoutColor:(Color *)clr Rate:(float)rate;

@end
