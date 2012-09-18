//
//  Color.h
//  Jipozhuan
//
//  Created by sui toney on 10-12-6.
//  Copyright 2010 ms. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Color : NSObject {
	
	float red, green, blue, alpha;
}

@property float red;
@property float green;
@property float blue;
@property float alpha;

+(Color *) R:(float)r G:(float)g B:(float)b A:(float)a;

+(Color *) R:(float)r G:(float)g B:(float)b;

-(Color *) changeColorR:(float)r G:(float)g B:(float)b;

@end

