//
//  SetCharacterAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-25.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"

@interface SetCharacterAction : AbstractAction {

	NSString *newch;
}

+(id) actionWithString:(NSString *)ch;


@end
