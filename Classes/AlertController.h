//
//  AlertController.h
//  Jipozhuan
//
//  Created by sui toney on 11-3-28.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Controller.h"

@interface AlertController : Controller {

	CGPoint centralLocation;
	id target;
}

-(void) setTarget:(id)t;

@end
