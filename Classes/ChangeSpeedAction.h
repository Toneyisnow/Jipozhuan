//
//  ChangeSpeedAction.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-22.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface ChangeSpeedAction : AbstractAction {

	float deltaX;
	float deltaY;
	float targetX;
	float targetY;
	int duration;
}


+(id) actionWithDX:(float)x DY:(float)y TX:(float)tx TY:(float)ty Duration:(float)du;

@end
