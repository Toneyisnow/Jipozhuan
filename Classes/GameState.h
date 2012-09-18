//
//  GameState.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-12.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GameState : NSObject<NSCoding> {

	int level, score, highestScore;
	
	int level0_ji;
	int level0_jian;
	int level0_quan;
	int level0_qing;
	int level1_ji;
	int level1_jian;
	int level1_quan;
	int level1_qing;
}

+(GameState *)gameState;

+(void) loadGameStateFromFile;
+(void) saveGameStateToFile;

+(void) newState;

@property (assign) int level;
@property (assign) int score;
@property (assign) int highestScore;

@property (assign) int level0_ji;
@property (assign) int level0_jian;
@property (assign) int level0_quan;
@property (assign) int level0_qing;
@property (assign) int level1_ji;
@property (assign) int level1_jian;
@property (assign) int level1_quan;
@property (assign) int level1_qing;

@end
