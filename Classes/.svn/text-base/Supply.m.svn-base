//
//  Supply.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-2.
//  Copyright 2011 ms. All rights reserved.
//

#import "Supply.h"
#import "ColorfulAction.h"

@implementation Supply

-(id) initWithChar:(NSString *)ch Size:(float)size {
	
	self = [super initWithChar:ch Size:size];
	shape->collision_type = ShapeTypeSupply;
	supplyType = SupplyTypeBullet;
	
	return self;
}

-(void) setSupplyType:(SupplyType)type {
	supplyType = type;
}

-(SupplyType) getType {
	return supplyType;
}

-(void) onCollision:(int) power {
	
	[self setDisposeFlag];
}

@end
