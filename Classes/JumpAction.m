//
//  JumpAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-12.
//  Copyright 2011 ms. All rights reserved.
//

#import "JumpAction.h"


@implementation JumpAction

-(id) initWithRate:(float)r {
	
	self = [super init];
	rate = (r > 0.7) ? 0.7: r;
	rate = (r < 0) ? 0 : r;
	initiated = FALSE;
	recovered = FALSE;
	
	return self;
}

+(id) actionWithRate:(float)r {
	
	return [[self alloc] initWithRate:r];
}

-(void) execute:(Character *)character {
	
	if (!initiated) {
		
		height = [character getSize].height;
		//lastY = [character getPosition].y;
		// NSLog(@"Anchor Point: X: %f Y:%f", character.ccLabel.anchorPoint.x, character.ccLabel.anchorPoint.y);
		//[character setAnchorPoint:CGPointMake(0.5, 0.85)];
		// character.ccLabel.anchorPoint = ccp(0.5, 0.85);
		initiated = TRUE;
	}
	
	//CGPoint pos = [character getPosition];
	
	character.ccLabel.scaleY -= rate;
	//[character setPositionX:pos.x Y:pos.y + height * rate / 2];

	if(character.ccLabel.scaleY < 0.7) {
		character.ccLabel.scaleY = 1;
	}
	
	/*
	if (recovered) {
		character.ccLabel.scaleY = 1;
		recovered = FALSE;
	}
	if(character.ccLabel.scaleY < 0.7) {
		[character setPositionX:pos.x Y:pos.y - height * 0.15];
		recovered = TRUE;
	}
	 */
}

-(BOOL) hasFinished:(Character *)character {
	return FALSE;
}
@end
