//
//  Supply.h
//  Jipozhuan
//
//  Created by sui toney on 11-2-2.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enemy.h"

typedef enum SupplyType {

	SupplyTypeBullet,
	SupplyTypeFriend
	
} SupplyType;

@interface Supply : Enemy {

	SupplyType supplyType;
}

-(void) setSupplyType:(SupplyType)type;
-(SupplyType) getType;
	
@end
