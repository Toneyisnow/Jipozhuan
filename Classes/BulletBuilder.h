//
//  BulletBuilder.h
//  JipozhuanNew
//
//  Created by sui toney on 11-1-23.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bullet.h"

@interface BulletBuilder : NSObject {

}

//+(BOOL) bulletReady:(int) interval;

+(int) intervalForLevel:(int)level;
+(NSMutableArray *) composeBullets:(int)level;

+(Bullet *) originalBullet;
+(Bullet *) singleBullet;
+(Bullet *) doubleBullet:(int)type;
+(Bullet *) tripleBullet:(int)type;
+(Bullet *) fourBullet:(int)type;
+(Bullet *) smallBullet;


+(Bullet *) shockWaveBullet:(int)type;

@end
