//
//  ColorfulAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-3.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface ColorfulAction : AbstractAction {

	float rate;
	int red;
}

+(id) actionWithRate:(float)r;

@end
