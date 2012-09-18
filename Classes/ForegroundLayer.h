//
//  ForegroundLayer.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-2.
//  Copyright 2011 ms. All rights reserved.
//
//  This layer contains: Controllers, Information

#import <Foundation/Foundation.h>
#import "ContainerLayer.h"

@interface ForegroundLayer : ContainerLayer {

	NSMutableArray *controllers;
	
	//id controller;
}

-(void) initControllers;
-(void) removeControllers;
-(void) controllerPressed: (CGPoint)location;
-(void) controllerReleased: (CGPoint)location;
-(void) controllerMoved: (CGPoint)location;

@end
