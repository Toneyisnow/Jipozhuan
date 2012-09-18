//
//  Sprite.h
//  Jipozhuan
//
//  Created by sui toney on 10-12-4.
//  Copyright 2010 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"

@interface SpriteChar : NSObject {
	
	float fontSize;
	NSString *character;
}

@property float fontSize;
@property (nonatomic, retain) NSString *character;

+(SpriteChar *) Build:(NSString *)str Color:(Color *)clr Size:(float)size;

-(void) changeSize:(float) ds;
-(void) changeChar:(NSString *)ch;

@end
