//
//  MainGameLayer.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-22.
//  Copyright 2011 ms. All rights reserved.
//

#import "MainGameLayer.h"
#import "MoveController.h"
#import "ShootController.h"
#import "GameConfig.h"
#import "SolidCharacter.h"
#import "CollisionHandler.h"
#import "GameConfig.h"

@interface MainGameLayer()

-(void) initChipmunk;
//-(BOOL) isOutOfScreen: (CCNode *)node;

@end

static void eachShape(void *ptr, void* unused)
{
	//NSLog(@"each shape");
	
	cpShape *shape = (cpShape*) ptr;
	SolidCharacter *ch = shape->data;
	CCSprite *sprite = ch.ccLabel;
	
	if(sprite) {
		
		cpBody *body = shape->body;
		
		// TIP: cocos2d and chipmunk uses the same struct to store it's position
		// chipmunk uses: cpVect, and cocos2d uses CGPoint but in reality the are the same
		// since v0.7.1 you can mix them if you want.		
		if (body) {
			[sprite setPosition: body->p];
		}
	}
	else {
		//NSLog(@"null Sprite");
	}
}
/*
static void postStepRemove(cpSpace *space, cpShape *shape, void *unused)
{
	SolidCharacter *ch = shape->data;
	
	if ([ch shouldBeDisposed]) {
		[ch removeFromCurrentScene];
	}
}

static void heroCollision(cpArbiter *arb, cpSpace *space, void *data) {
	cpShape *a, *b; 
	cpArbiterGetShapes(arb, &a, &b);
	
	NSLog(@"HERO COLLISIONEDDD!");
	
	// Remove object
	cpSpaceAddPostStepCallback(space, (cpPostStepFunc)postStepRemove, b, NULL);
	
	//cpBodyApplyImpulse(a->body, cpv(10,30), cpv(0,0));
	//return 1;
}

static void bulletHitEnemy(cpArbiter *arb, cpSpace *space, void *data) {
	cpShape *a, *b; 
	cpArbiterGetShapes(arb, &a, &b);
	
	
	NSLog(@"BULLET COLLISIONEDDD!");
	
	SolidCharacter *schA = a->data;
	SolidCharacter *schB = b->data;
	
	[schB onCollision:[schA getPower]];
	// [schB onCollision:[schA getPower]];
	
	// Remove object
	cpSpaceAddPostStepCallback(space, (cpPostStepFunc)postStepRemove, b, NULL);
	
	//cpBodyApplyImpulse(a->body, cpv(10,30), cpv(0,0));
	//return 1;
}

static cpBool ignoreCollision(cpArbiter *arb, cpSpace *space, void *data) {
	
	return FALSE;
}

static cpBool handleCollision(cpArbiter *arb, cpSpace *space, void *data) {
	
	return TRUE;
}
*/

@implementation MainGameLayer

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		[self initChipmunk];
	}
	return self;
}

-(void) setCurrentGame:(AbstractGame *)game {

	currentGame = game;
}

-(void) initChipmunk {
	
	cpInitChipmunk();
	
	space = cpSpaceNew();
	cpSpaceResizeStaticHash(space, 400.0f, 40);
	cpSpaceResizeActiveHash(space, 100, 600);
	//space->defaultHandler = NULL;
	
	space->gravity = cpv(0, 0);
	//space->elasticIterations = space->iterations;
	
	[self schedule: @selector(step:)];
	
	cpSpaceSetDefaultCollisionHandler(space, NULL, NULL, NULL, NULL, 0);
	cpSpaceRemoveCollisionHandler(space, ShapeTypeBullet, ShapeTypeEnemy);
	
	cpSpaceAddCollisionHandler(space, ShapeTypeHero, ShapeTypeEnemy, &heroCollision, NULL, NULL, NULL, 0);
	cpSpaceAddCollisionHandler(space, ShapeTypeHero, ShapeTypeEnemyBullet, &heroCollision, NULL, NULL, NULL, 0);
	cpSpaceAddCollisionHandler(space, ShapeTypeBullet, ShapeTypeEnemy, &bulletHitEnemy, NULL, NULL, NULL, 0);
	cpSpaceAddCollisionHandler(space, ShapeTypeHero, ShapeTypeSupply, &heroSupplyCollision, NULL, NULL, NULL, 0);
	
	// Ignore collisions
	cpSpaceAddCollisionHandler(space, ShapeTypeHero, ShapeTypeBullet, &ignoreCollision, NULL, NULL, NULL, 0);
	cpSpaceAddCollisionHandler(space, ShapeTypeBullet, ShapeTypeBullet, &ignoreCollision, NULL, NULL, NULL, 0);
	cpSpaceAddCollisionHandler(space, ShapeTypeEnemy, ShapeTypeEnemy, &ignoreCollision, NULL, NULL, NULL, 0);
	
	NSLog(@"chipmunk finished.");
}

-(void) step: (ccTime) delta
{
	int steps = 2;
	CGFloat dt = delta/(CGFloat)steps;
	
	for(int i=0; i<steps; i++){
		cpSpaceStep(space, dt);
	}
	cpSpaceHashEach(space->activeShapes, &eachShape, nil);
	cpSpaceHashEach(space->staticShapes, &eachShape, nil);
}

// TODO: this method has problem, dont call it
-(void) recycle {

	for (int i=0; i < [[self children] count]; i++) {
		CCLabelTTF *ch = (CCLabelTTF *)[[self children] objectAtIndex:i];
		if ([self isOutOfScreen:ch]) {
			[self removeChild:ch cleanup:YES];
		}
	};
}

-(BOOL) isOutOfScreen: (CCLabelTTF *)node {
	
	BOOL rel = ((node.position.x + node.textureRect.size.width * 10 < 0) || (node.position.x - node.textureRect.size.width * 10 > GAME_SCREEN_WIDTH) ||
				(node.position.y + node.textureRect.size.height * 10 < 0) || (node.position.y - node.textureRect.size.height * 10 > GAME_SCREEN_HEIGHT));
	
	return rel;
}

@end
