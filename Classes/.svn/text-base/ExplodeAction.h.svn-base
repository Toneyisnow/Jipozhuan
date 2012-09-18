//
//  ExplodeAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-3-21.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"
#import "AnimatedCharacter.h"

@interface ExplodeAction : AbstractAction {

	NSString *str;
	int size;
	int tick;
}

+(id) actionWithString:(NSString *)ch Size:(int)s;
-(BOOL) isOutOfScreen:(Character *) ch;

-(AnimatedCharacter *) generateExplodeChar:(Character *) ch;

@end
