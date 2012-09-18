//
//  TransitionThreeController.h
//  Jipozhuan
//
//  Created by sui toney on 11-3-11.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BackgroundController.h"

@interface TransitionThreeController : BackgroundController {

	float duration;
	float horizon;
	float downDelta;
	
	Color *skyColorA;
	Color *skyColorB;
	
	Color *groundColorA;
	Color *groundColorB;
	
}

-(void) addToBackdrop:(CGRect) rect Color:(Color *) clr;

@end
