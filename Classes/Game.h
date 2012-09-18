//
//  Game.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-17.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainGameLayer.h"
#import "BackgroundLayer.h"
#import "AbstractGame.h"
#import "Background.h"
#import "Foreground.h"
#import "Chapter.h"
#import "Hero.h"
#import "ScreenContainer.h"
#import "MainGameScene.h"

typedef enum GameStatus {

	GameStatusIdle = 0,
	GameStatusPlaying = 1,
	GameStatusPaused = 2,
	GameStatusFinished = 3,
	GameStatusGameOver = 4
} GameStatus;


@interface Game : AbstractGame<ScreenContainer> {

	MainGameScene *gameScene;
	MainGameLayer *gameScreen;
	//BackgroundLayer *backgroundLayer;
	
	Background *background;
	Foreground *foreground;
	Hero *hero;
	//BOOL heroPerfect;

	Chapter *gameChapter;
	int currentChapter;
	
	int leftHeroCount;
	int gameTick;
	int lastImportantTick;
	
	//float FPS;
	
	GameStatus gameStatus;
	
	NSMutableArray *screenObjects;
}

-(void) tick;

-(id) initWithScene:(MainGameScene *)scene;

//-(void) addObject: (SolidCharacter *) sch;
-(void) addCharacter: (AnimatedCharacter *) ach;

-(void) removeCharacter: (AnimatedCharacter *) ach;

// When boss enemy crashes, other enemies on screen should be defeated
-(void) defeatAllEnemy;

-(void) gameStart;

-(void) gamePause;

-(void) gameResume;

-(void) gameFinish;

-(void) gameOver;

-(void) gameEnd;

// Hero is dead
-(void) gameDie;


-(void) gameSave;

-(void) gameLoad;

// This is used to set CCDirector.notificationNode
-(void) visit;
// Recycle the objects that are out of the screen
// -(void) recycle;

@end
