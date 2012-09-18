//
//  WillExplodeAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-3-21.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface WillExplodeAction : AbstractAction {

	int waitTick;
}

+(id) actionWithWaitTime:(float)t;

@end
