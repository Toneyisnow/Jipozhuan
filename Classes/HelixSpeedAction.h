//
//  HelixSpeedAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-13.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface HelixSpeedAction : AbstractAction {

	float rate;
	int durationTick;
}

+(id) actionWithRate:(float)r Duration:(float)du;

@end
