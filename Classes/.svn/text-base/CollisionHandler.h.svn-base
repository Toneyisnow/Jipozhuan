//
//  CollisionHandler.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-23.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "chipmunk.h"
#import "SolidCharacter.h"
#import "Hero.h"
#import "Supply.h"

static cpBool heroCollision(cpArbiter *arb, cpSpace *space, void *data) {
	cpShape *a, *b; 
	cpArbiterGetShapes(arb, &a, &b);
	
	SolidCharacter *schA = a->data;
	SolidCharacter *schB = b->data;
	
	if(![schA isSolid] || ![schB isSolid]) {
		return FALSE;
	}
	
	NSLog(@"HERO COLLISIONEDDD!");
	
	[schA onCollision:[schB getPower]];
	[schB onCollision:[schA getPower]];
	
	return TRUE;
}

static cpBool heroSupplyCollision(cpArbiter *arb, cpSpace *space, void *data) {
	cpShape *a, *b; 
	cpArbiterGetShapes(arb, &a, &b);
	
	Supply *schA = (Supply *)(b->data);
	Hero *schB = (Hero *)(a->data);
	
	[schA onCollision:[schB getPower]];
	[schB onSupply:[schA getType]];
	
	return TRUE;
}

static cpBool bulletHitEnemy(cpArbiter *arb, cpSpace *space, void *data) {
	cpShape *a, *b; 
	cpArbiterGetShapes(arb, &a, &b);
	
	SolidCharacter *schA = a->data;
	SolidCharacter *schB = b->data;
	
	@synchronized(schA) {
		@synchronized(schB) {
			
			if (schA == nil || schB == nil) {
				return FALSE;
			}
	
			if(![schA isSolid] || ![schB isSolid]) {
				return FALSE;
			}
	
			// NSLog(@"ENEMY COLLISIONEDDD!");
	
			[schA onCollision:[schB getPower]];
			[schB onCollision:[schA getPower]];
		}
	}
	// Remove object
	//cpSpaceAddPostStepCallback(space, (cpPostStepFunc)postStepRemove, a, NULL);
	//cpSpaceAddPostStepCallback(space, (cpPostStepFunc)postStepRemove, b, NULL);
	
	//cpBodyApplyImpulse(a->body, cpv(10,30), cpv(0,0));
	return TRUE;
}

static cpBool ignoreCollision(cpArbiter *arb, cpSpace *space, void *data) {
	
	return FALSE;
}

/*
static cpBool handleCollision(cpArbiter *arb, cpSpace *space, void *data) {
	
	return TRUE;
}
*/

@interface CollisionHandler : NSObject {

}

@end
