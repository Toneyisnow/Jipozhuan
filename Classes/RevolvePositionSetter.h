//
//  RevolvePositionSetter.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-21.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PositionSetter.h"

@interface RevolvePositionSetter : PositionSetter {

	float radio;
	float increase;
}

-(id) initWithRadio:(float)rad Increase:(float)inc;

@end
