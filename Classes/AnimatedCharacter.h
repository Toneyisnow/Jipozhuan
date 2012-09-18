//
//  AnimatedCharacter.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-29.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Curve.h"

@interface AnimatedCharacter : Character {

	Curve *defaultCurve;
	Curve *currentCurve;
	
	int beep;
}

-(Curve *) getCurrentCurve;
-(void) setDefaultCurve:(Curve *)curve;

-(void) takeTick:(int)tick;

@end
