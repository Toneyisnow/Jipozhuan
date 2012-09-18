//
//  ComposingAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-13.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface ComposingAction : AbstractAction {

	id _delegate;
	SEL _selector;
	id _object;
}


+(id) actionWithDelegate:(id)delegate Selector:(SEL)seletor WithObject:(id)object;

@end
