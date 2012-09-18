//
//  TransitionFourController.h
//  Jipozhuan
//
//  Created by sui toney on 11-3-12.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BackgroundController.h"

@interface TransitionFourController : BackgroundController {

	float duration;
	float horizon;
	float upDelta;
	float downDelta;
	
	Color *skyColorA;
	Color *skyColorB;
	
	Color *groundColor1A;
	Color *groundColor1B;
	
	Color *groundColor2A;
	Color *groundColor2B;
	
}

-(void) addToBackdrop:(CGRect) rect Color:(Color *) clr;

@end