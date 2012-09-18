//
//  ContainerLayer.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-21.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "chipmunk.h"


@interface ContainerLayer : CCLayer {

	cpSpace *space;
	id controller;
	
}

-(cpSpace *) getSpace;

-(void) setController:(id)c;

@end
