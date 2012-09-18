//
//  ChasingAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-10.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface ChasingAction : AbstractAction {
	
	float baseSpeed;
	int durationTick;

}

+(id) actionWithParam:(float)param Duration:(float)du;

-(float) distanceToHero:(Character *)character;

@end
