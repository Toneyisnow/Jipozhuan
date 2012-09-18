//
//  RevolvePositionSetter.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-21.
//  Copyright 2011 ms. All rights reserved.
//

#import "RevolvePositionSetter.h"
#import "Hero.h"

@implementation RevolvePositionSetter


-(id) initWithRadio:(float)rad Increase:(float)inc {

	self = [super init];
	radio = rad;
	increase = inc;
	return self;
}

-(void) setPosition:(Character *)ch Accordiance:(Character *)accord {
	
	Hero *h = [Hero getCurrentHero];
	
	float distance = sqrt(([h getPosition].x - [accord getPosition].x)*([h getPosition].x - [accord getPosition].x) 
						+ ([h getPosition].y - [accord getPosition].y)*([h getPosition].y - [accord getPosition].y));
	distance = (distance > radio) ? distance - radio : 0;
	distance = (distance < radio) ? distance : radio;
	
	//NSLog(@"Distance: %f", distance);
	
	float vdistance = sqrt(radio * radio - distance * distance);
	
	float dx = [h getPosition].x - [accord getPosition].x;
	float dy = [h getPosition].y - [accord getPosition].y;
	
	float ux = dx / (abs(dx)+abs(dy));
	float uy = dy / (abs(dx)+abs(dy));
	
	float u1x = distance * ux;
	float u1y = distance * uy;
	
	float u2x = vdistance * (-uy);
	float u2y = vdistance * ux;
	
	float px = (u1x + u2x) * increase / distance;
	float py = (u1y + u2y) * increase / distance;
	
	//float px = (u1x + u2x) * increase / distance;
	//float py = (u1y + u2y) * increase / distance;
	
	[ch setPositionX:px Y:py];
}

@end
