//
//  Bullet.m
//  Jipozhuan
//
//  Created by sui toney on 10-11-28.
//  Copyright 2010 ms. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet

-(id) initWithChar:(NSString *)ch Size:(float)size {

	self = [super initWithChar:ch Size:size];
	status = BulletNormal;
	shape->collision_type = ShapeTypeBullet;
	
	// Default Power
	power = 5;
	
	return self;
}

-(void) onCollision:(int) power {
	
	//NSLog(@"bullet onCollission");
	[self onExplode];
	
	//status = BulletDisposed;
}

-(void) onExplode {
	
	status = BulletExploding;
	//[ccLabel setString:@"碎"];
	solid = NO;
	
	currentCurve = explodeCurve;
}

@end
