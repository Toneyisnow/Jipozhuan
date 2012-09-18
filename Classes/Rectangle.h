//
//  Rectangle.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-21.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"

@interface Rectangle : Sprite {

	CCSprite *ccSprite;
}

-(void) setSizeX:(float)x Y:(float)y;


@end
