//
//  SetColorAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-25.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Color.h"
#import "AbstractAction.h"

@interface SetColorAction : AbstractAction {

	Color *color;
}

+(id) actionWithColor:(Color *)c;

@end
