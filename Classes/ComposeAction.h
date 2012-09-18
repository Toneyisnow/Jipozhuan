//
//  ComposeAction.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-26.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractAction.h"
#import "EnemyDefinition.h"

@interface ComposeAction : AbstractAction {

	EnemyDefinition *item;
	//int enemyType;
}

+(id) actionWithItem:(EnemyClarification)def Type:(int)type;

@end
