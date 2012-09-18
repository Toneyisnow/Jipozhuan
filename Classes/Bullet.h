//
//  Bullet.h
//  Jipozhuan
//
//  Created by sui toney on 10-11-28.
//  Copyright 2010 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SolidCharacter.h"
#import	"Enemy.h"

typedef enum BulletStatus {
	BulletNormal,
	BulletExploding,
	BulletDisposed
} BulletStatus;

@interface Bullet : SolidCharacter {
	
	BulletStatus status;
}

@end
