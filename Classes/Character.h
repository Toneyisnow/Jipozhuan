//
//  Character.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-21.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"

@interface Character : Sprite {

	CCLabelTTF *ccLabel;
	NSString *character;
	float fontSize;
	CGPoint myPosition;		// Sometimes we need our local position to track the chars that are not put on screen yet.
}

-(id) initWithChar:(NSString *)ch Size:(float)size;
-(id) initWithChar:(NSString *)ch Size:(float)size Anchor:(CGPoint)anchor;

-(void) setCharacter:(NSString *)ch;
-(void) setFontSize:(float)size;
-(NSString *) getCharacter;
-(float) getFontSize;
-(CGPoint) getMyPosition;
-(void) setAnchorPoint:(CGPoint)point;

-(Character *) colone;
-(BOOL) isCenterInScreen;

@property (readonly) CCLabelTTF *ccLabel;

@end
