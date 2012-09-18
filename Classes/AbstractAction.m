//
//  AbstractAction.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-22.
//  Copyright 2011 ms. All rights reserved.
//

#import "AbstractAction.h"


@implementation AbstractAction

+(id) action {

	self = [[super alloc] init];
	return self;
}

-(void) execute:(Character *)character {
}

-(BOOL) hasFinished:(Character *)character {
	return YES;
}

@end
