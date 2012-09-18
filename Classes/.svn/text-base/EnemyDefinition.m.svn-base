//
//  EnemyDefinition.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-2.
//  Copyright 2011 ms. All rights reserved.
//

#import "EnemyDefinition.h"

@implementation EnemyDefinition

@synthesize clarification;
@synthesize subtype;

-(id) initWithClarification:(EnemyClarification)c Type:(int)type {

	self = [super init];
	clarification = c;
	subtype = type;
	return self;
}

+(id) enemyWithClarification:(EnemyClarification)c Type:(int)type {
	return [[self alloc] initWithClarification:c Type:type];
}

+(id) enemyWithClarification:(EnemyClarification)c {
	return [self enemyWithClarification:c Type:1];
}

@end
