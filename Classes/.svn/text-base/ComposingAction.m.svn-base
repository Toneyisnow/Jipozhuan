//
//  ComposingAction.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-13.
//  Copyright 2011 ms. All rights reserved.
//

#import "ComposingAction.h"
#import "AnimatedCharacter.h"
#import "AirCraft.h"

@implementation ComposingAction

-(id) initWithDelegate:(id)delegate Selector:(SEL)selector WithObject:(id)object {

	self = [super init];
	_delegate = delegate;
	_selector = selector;
	_object = object;
	return self;
}

+(id) actionWithDelegate:(id)delegate Selector:(SEL)selector WithObject:(id)object {

	if (![delegate respondsToSelector:selector]) {
		NSLog(@"Composing Action: delegate [%@] doesn't respond to selector:[%@]", delegate, selector);
		return nil;
	}
	return [[self alloc] initWithDelegate:delegate Selector:selector WithObject:object];
}

-(void) execute:(Character *)character {

	AnimatedCharacter *item = [_delegate performSelector:_selector withObject:_object];
	//NSLog(@"Composing character:%@", [item getCharacter]);
	
	AirCraft *craft = (AirCraft *)character;
	[craft addComposedItem:item];
	
}

@end
