//
//  SetShootingAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-29.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface SetShootingAction : AbstractAction {

	BOOL setShooting;
}

+(id) actionWithBool:(BOOL)shooting;

@end
