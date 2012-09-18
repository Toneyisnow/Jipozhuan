//
//  AbstractAction.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-22.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"

@interface AbstractAction : NSObject {

	//Character *character;
}

+(id) action;

-(void) execute:(Character *)character;
-(BOOL) hasFinished:(Character *)character;
//-(void) setNext:(AbstractAction *)action;


@end
