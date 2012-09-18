//
//  CircleSpeedAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-20.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface CircleSpeedAction : AbstractAction {

	float rate;
	int durationTick;
	
}

+(id) actionWithRate:(float)r Duration:(float)du;

-(NSString *) getHashA:(float)a B:(float)b C:(float)c;
-(CGPoint) calculateNext:(Character *)character;

@end
