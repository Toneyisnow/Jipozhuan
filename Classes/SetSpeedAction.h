//
//  SetSpeedAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-22.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface SetSpeedAction : AbstractAction {
	
	float speedX;
	float speedY;
}

+(id) actionWithSpeedX:(float)x Y:(float)y;

@end