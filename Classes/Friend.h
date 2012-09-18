//
//  Friend.h
//  Jipozhuan
//
//  Created by sui toney on 11-6-15.
//  Copyright 2011 ms. All rights reserved.
//

//#import <Cocoa/Cocoa.h>
#import "AirCraft.h"
#import "Supply.h"
#import "ScreenContainer.h"

@interface Friend : AirCraft {

	int mainType;
}

-(id) initWithType:(int)type;
-(void) composeCharacterToGame: (id<ScreenContainer>) game;

@end
