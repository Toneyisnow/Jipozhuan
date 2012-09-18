//
//  BackgroundThreeController.h
//  Jipozhuan
//
//  Created by sui toney on 11-3-10.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BackgroundController.h"

@interface BackgroundThreeController : BackgroundController {

	NSMutableArray *charlayer1;
	NSMutableArray *charlayer2;
	NSMutableArray *charlayer3;
	NSMutableArray *charlayer4;
	NSMutableArray *charlayer5;
	NSMutableArray *charlayer6;
	NSMutableArray *charlayer7;
	NSMutableArray *charlayer8;
	NSMutableArray *charlayer9;
	NSMutableArray *charlayer10;
	NSMutableArray *charlayer11;
	NSMutableArray *charlayer12;
	
}

-(void) addToBackdrop:(CGRect) rect Color:(Color *) clr;

-(void) updateLayer:(NSMutableArray *)layer index:(int)ind;

@end
