//
//  BossEnemy.h
//  Jipozhuan
//
//  Created by sui toney on 11-3-23.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enemy.h"

@interface BossEnemy : Enemy {

	id chapter;
}

-(void) setChapter:(id) chap;

@end
