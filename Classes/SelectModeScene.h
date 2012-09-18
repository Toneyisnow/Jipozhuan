//
//  ModeSelectionScene.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-14.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SelectModeScene : CCLayer {

}

+(id) scene;

-(void) onBack;
-(void) onEasy;
-(void) onMedium;
-(void) onHard;

@end
