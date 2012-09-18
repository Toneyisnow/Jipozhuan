//
//  GameStatistics.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-23.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GameStatistics : NSObject {

	int level;
	int scoreTotal;
	int scoreGained;
	
	int countTotal;
	int countGained;
	
	BOOL heroPerfect;
	BOOL shockwavUsed;
}

+(GameStatistics *) instance;
+(void) newInstance;
+(void) clearInstance;

@property (assign) int level;
@property (assign) int scoreTotal;
@property (assign) int scoreGained;
@property (assign) int countTotal;
@property (assign) int countGained;
@property (assign) BOOL heroPerfect;
@property (assign) BOOL shockwavUsed;


@end
