//
//  IController.m
//  Jipozhuan
//
//  Created by sui toney on 10-11-28.
//  Copyright 2010 ms. All rights reserved.
//

#import "Controller.h"


@implementation Controller

-(void) setRadio:(float)r {
	radio = r;
}

-(void) pressed:(CGPoint) location {
	
}

-(void) released:(CGPoint) location {
	
}

-(void) draged:(CGPoint) location {

}

-(bool) isClickedOn:(CGPoint) location {
	
	float posX = ccLabel.position.x;
	float posY = ccLabel.position.y;
	
	return (abs(location.x - posX) <= radio && abs(location.y - posY) <= radio);
}

@end
