//
//  EnemyBullet.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-17.
//  Copyright 2011 ms. All rights reserved.
//

#import "EnemyBullet.h"


@implementation EnemyBullet

-(id) initWithChar:(NSString *)ch Size:(float)size {
	
	self = [super initWithChar:ch Size:size];
	shape->collision_type = ShapeTypeEnemyBullet;
	
	// Default Power
	power = 20;
	
	return self;
}

-(void) onCollision:(int) power {
	
	[self onExplode];
}

-(void) onExplode {
	
	solid = NO;
	
	if(defaultCurve != nil) {
		[defaultCurve release];
	}
	
	defaultCurve = explodeCurve;
	[self setDisposeFlag];
}


@end
