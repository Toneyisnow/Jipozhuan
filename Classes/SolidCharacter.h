//
//  SolidCharacter.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-21.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimatedCharacter.h"
#import "chipmunk.h"

typedef enum ShapeType {

	ShapeTypeDefault = 99,
	ShapeTypeHero = 1,
	ShapeTypeBullet = 2,
	ShapeTypeEnemy = 3,
	ShapeTypeEnemyBullet = 4,
	ShapeTypeSupply = 5
} ShapeType;


@interface SolidCharacter : AnimatedCharacter {

	cpBody *body;
	cpShape *shape;
	
	BOOL solid;
	
	Curve *explodeCurve;
	
	int power;
}

-(BOOL) isSolid;
-(void) setSolid:(BOOL)s;

-(void) onCollision:(int) power;
-(void) onExplode;

-(int) getPower;
-(void) setPower:(int)p;

-(void) setExplodeCurve:(Curve *)curve;

@end
