//
//  Sprite.m
//  Jipozhuan
//
//  Created by sui toney on 10-12-4.
//  Copyright 2010 ms. All rights reserved.
//

#import "SpriteChar.h"
#import "Common.h"
#import "cocos2d.h"

@implementation SpriteChar

@synthesize fontSize;
@synthesize character;

+(SpriteChar *) Build:(NSString *)str Color:(Color *)clr Size:(float)size {
	
	SpriteChar *sprite = [[SpriteChar alloc] init];
	//sprite.color = clr;
	sprite.character = str;
	//sprite.color = clr;
	sprite.fontSize = size;
	
	
	CCLabelTTF *label = [CCLabelTTF labelWithString:str fontName:@"Marker Felt" fontSize:size];
	label.color = ccc3(clr.red, clr.green, clr.blue);
	
	//sprite.ccSprite = label;
	return sprite;
}

-(void) changeSize:(float) ds {
	
	fontSize = [Common update:fontSize Delta:ds Min:8.0 Max:600];
}

-(void) changeAlpha:(float) da {
	
	//color.alpha = [Common update:color.alpha Delta:da Min:0 Max:1];
}

-(void) changeChar:(NSString *)ch {
	
	character = ch;
}

-(float) getSizeX {
	return fontSize * 1.1;
}

-(float) getSizeY {
	return fontSize * 1.1;
}

@end
