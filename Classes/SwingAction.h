//
//  SwingAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-28.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface SwingAction : AbstractAction {

	int axis;		// 0: X Axis 1: Y Axis
	float central;
	float swingRate;
	BOOL initial;
	
	int temp;
}
+(id) actionWithAxis:(int)a Central:(float)c Rate:(float)r;

@end
