//
//  BossEnemy.m
//  Jipozhuan
//
//  Created by sui toney on 11-3-23.
//  Copyright 2011 ms. All rights reserved.
//

#import "BossEnemy.h"
#import "Chapter.h"

@implementation BossEnemy

// When BossEnemy Explode, End the current chapter
-(void) onExplode {

	[super onExplode];
	
	if (chapter != nil) {
		Chapter *c = (Chapter *)chapter;
		[c setFinishNow];
	}
	
	//NSLog(@"Finished BossEnemy onExplode.");
}

-(void) setChapter:(id) chap {
	chapter = chap;
}

@end
