//
//  AbstractGame.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-22.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AbstractGame : NSObject {

}

-(void) gameStart;

-(void) gamePause;

-(void) gameResume;

-(void) gameFinish;

-(void) gameOver;

// Hero is dead
-(void) gameDie;

@end

