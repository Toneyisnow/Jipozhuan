//
//  Color.m
//  Jipozhuan
//
//  Created by sui toney on 10-12-6.
//  Copyright 2010 ms. All rights reserved.
//

#import "Color.h"


@implementation Color

@synthesize red, green, blue, alpha;

+(Color *) R:(float)r G:(float)g B:(float)b A:(float)a {
	
	Color *clr = [[Color alloc] init];
	clr.red = r;
	clr.green = g;
	clr.blue = b;
	clr.alpha = a;
	
	return clr;
}

+(Color *) R:(float)r G:(float)g B:(float)b {
	
	Color *clr = [[Color alloc] init];
	clr.red = r;
	clr.green = g;
	clr.blue = b;
	
	return clr;
}

-(Color *) changeColorR:(float)r G:(float)g B:(float)b {

	//NSLog(@"Change Color.");
	return [Color R:red+r G:green+g B:blue+b];
}

@end