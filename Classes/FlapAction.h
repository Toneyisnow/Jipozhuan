//
//  FlapAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-28.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface FlapAction : AbstractAction {

	float rate;
	float minScale;
}

+(id) actionWithRate:(float)r To:(float)t;

@end
