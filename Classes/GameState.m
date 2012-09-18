//
//  GameState.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-12.
//  Copyright 2011 ms. All rights reserved.
//

#import "GameState.h"

static GameState *_gameState;
//static NSString *_gameFile;

@implementation GameState

@synthesize level, score, highestScore;
@synthesize level0_ji, level0_jian, level0_quan, level0_qing;
@synthesize level1_ji, level1_jian, level1_quan, level1_qing;

+(GameState *)gameState {
	return _gameState;
}

+(NSString *) gameFilePath {
	
	NSString *dir = [NSSearchPathForDirectoriesInDomains(  NSDocumentDirectory
														 , NSUserDomainMask
														 , YES) objectAtIndex:0];
	
	return [NSString stringWithFormat:@"%@/Jpgame.state.1.1", dir];
	
}

+(void) loadGameStateFromFile {
	
	if (![[NSFileManager defaultManager] fileExistsAtPath:[self gameFilePath]]) {
		NSLog(@"Cannot find game state file, create a new instance.");
		[GameState newState];
		return;
	}
	
   [_gameState release];
	_gameState = [[NSKeyedUnarchiver unarchiveObjectWithFile:[self gameFilePath]] retain];
	NSLog(@"Loaded game state from file [%@]", [self gameFilePath]);
	
	NSLog(@"Loaded game state %d.", _gameState.level0_ji);
}

+(void) saveGameStateToFile {

	NSLog(@"Save game state to:%@", [self gameFilePath]);
	NSFileManager *fm = [NSFileManager defaultManager];
	if ([fm fileExistsAtPath:[self gameFilePath]]) {
		NSError *myerror;
		[fm removeItemAtPath:[self gameFilePath] error:&myerror];
	}
	[NSKeyedArchiver archiveRootObject:[GameState gameState] toFile:[self gameFilePath]];
}

- (void) encodeWithCoder:(NSCoder *)coder {
	
    [coder encodeInt:level forKey:@"level"];
    [coder encodeInt:score forKey:@"score"];
    [coder encodeInt:highestScore forKey:@"highestScore"];
	
	[coder encodeInt:level0_ji   forKey:@"level0_ji"];
	[coder encodeInt:level0_jian forKey:@"level0_jian"];
	[coder encodeInt:level0_quan forKey:@"level0_quan"];
	[coder encodeInt:level0_qing forKey:@"level0_qing"];
	[coder encodeInt:level1_ji   forKey:@"level1_ji"];
	[coder encodeInt:level1_jian forKey:@"level1_jian"];
	[coder encodeInt:level1_quan forKey:@"level1_quan"];
	[coder encodeInt:level1_qing forKey:@"level1_qing"];
}

-(id) initWithCoder:(NSCoder *)coder {
	
    self = [super init];
    level = [coder decodeIntForKey:@"level"];
    score = [coder decodeIntForKey:@"score"];
    highestScore = [coder decodeIntForKey:@"highestScore"];
	
	level0_ji   = [coder decodeIntForKey:@"level0_ji"];
	level0_jian = [coder decodeIntForKey:@"level0_jian"];
	level0_quan = [coder decodeIntForKey:@"level0_quan"];
	level0_qing = [coder decodeIntForKey:@"level0_qing"];
	level1_ji   = [coder decodeIntForKey:@"level1_ji"];
	level1_jian = [coder decodeIntForKey:@"level1_jian"];
	level1_quan = [coder decodeIntForKey:@"level1_quan"];
	level1_qing = [coder decodeIntForKey:@"level1_qing"];
	
    return self;
}

+(void) newState {

	_gameState = [[GameState alloc] init];
	_gameState.level = 0;
	_gameState.score = 0;
	_gameState.highestScore = 0;
	
	_gameState.level0_ji = 0;
	_gameState.level0_jian = 0;
	_gameState.level0_quan = 0;
	_gameState.level0_qing = 0;
	_gameState.level1_ji = 0;
	_gameState.level1_jian = 0;
	_gameState.level1_quan = 0;
	_gameState.level1_qing = 0;
	
	[_gameState retain];
}

@end
