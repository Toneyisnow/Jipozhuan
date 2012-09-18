//
//  BulletBuilder.m
//  JipozhuanNew
//
//  Created by sui toney on 11-1-23.
//  Copyright 2011 ms. All rights reserved.
//

#import "BulletBuilder.h"
#import "Curve.h"
#import "DisposeAction.h"
#import "SetSpeedAction.h"
#import "FadeoutAction.h"
#import "SetCharacterAction.h"
#import "SetColorAction.h"
#import "SlowDownAction.h"
#import "SwingAction.h"
#import "HelixSpeedAction.h"

static int bulletInterval;

@interface BulletBuilder()

+(Bullet *) singleBullet;
+(Bullet *) doubleBullet:(int)type;
+(Bullet *) tripleBullet:(int)type;

+(Curve *) deathCurve;

@end


@implementation BulletBuilder

+(BOOL) bulletReady:(int) interval {

	if (bulletInterval < 0 || bulletInterval >= interval) {
		bulletInterval = 0;
		return TRUE;
	} else {
		bulletInterval ++;
		return FALSE;
	}
}

+(int) intervalForLevel:(int)level {

	switch (level) {
		case 0:
			return 3; break;
		case 1:
			return 2; break;
		case 2:
			return 2; break;
		case 3:
		case 4:
		case 5:
		case 6:
			return 2; break;
		default:
			break;
	}
	return 1;
}

+(NSMutableArray *) composeBullets:(int)level {

	NSMutableArray *bullets = [[NSMutableArray alloc] init];
	
	switch (level) {
		case 0:
			[bullets addObject:[self originalBullet]]; break;
		case 1:
			[bullets addObject:[self singleBullet]]; break;
		case 2:
			[bullets addObject:[self doubleBullet:1]];
			[bullets addObject:[self doubleBullet:2]];
			break;
		case 3:
			[bullets addObject:[self tripleBullet:1]];
			[bullets addObject:[self tripleBullet:2]];
			[bullets addObject:[self tripleBullet:3]];
			break;
		case 4:
			[bullets addObject:[self fourBullet:1]];
			[bullets addObject:[self fourBullet:2]];
			[bullets addObject:[self fourBullet:3]];
			[bullets addObject:[self fourBullet:4]];
			break;
		case 5:
		case 6:
			break;
		case 11:
			[bullets addObject:[self smallBullet]]; break;
			
		default:
			break;
	}
	
	return bullets;
}

+(Bullet *) originalBullet {
	
	Bullet *bullet = [[Bullet alloc] initWithChar:@"弹" Size:22];
	
	[bullet setColor:[Color R:200 G:255 B:50 A:1]];
	[bullet setSpeedX:500 Y:0];
	[bullet setPower:8];
	
	[bullet setExplodeCurve:[self deathCurve]];
	
	return bullet;
}

+(Bullet *) singleBullet {
	
	Bullet *bullet = [[Bullet alloc] initWithChar:@"弹" Size:22];
	
	[bullet setColor:[Color R:200 G:255 B:50 A:1]];
	[bullet setSpeedX:700 Y:0];
	[bullet setPower:5];
	
	[bullet setExplodeCurve:[self deathCurve]];
	
	return bullet;
}

+(Bullet *) smallBullet {

	Bullet *bullet = [[Bullet alloc] initWithChar:@"弹" Size:18];
	
	[bullet setColor:[Color R:200 G:255 B:50 A:1]];
	[bullet setSpeedX:700 Y:0];
	[bullet setPower:2];
	
	[bullet setExplodeCurve:[self deathCurve]];
	
	return bullet;
}

+(Bullet *) doubleBullet:(int)type {
	
	Bullet *bullet = [[Bullet alloc] initWithChar:@"弹" Size:25];
	
	if (type == 1) {
		[bullet setColor:[Color R:200 G:50 B:255 A:1]];
	} else {
		[bullet setColor:[Color R:200 G:127 B:255 A:1]];
	}

	[bullet setSpeedX:500 Y:((type==1)?250:-250)];
	[bullet setPower:3];
	
	Curve *curve = [[Curve alloc] init];
	SwingAction *action = [SwingAction actionWithAxis:1 Central:0 Rate:30];
	[curve addAction:action Tick:1];
	[bullet setDefaultCurve:curve];
	
	[bullet setExplodeCurve:[self deathCurve]];
	
	return bullet;
}

+(Bullet *) tripleBullet:(int)type {
	
	Bullet *bullet = [[Bullet alloc] initWithChar:@"弹" Size:16];
	
	[bullet setColor:[Color R:250 G:0 B:255 A:1]];
	
	[bullet setSpeedX:600 Y:((type - 2) * 200)];
	[bullet setPower:3];
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action = [SetSpeedAction actionWithSpeedX:600 Y:((type - 2) * 40)];
	[curve addAction:action Tick:1];
	[bullet setDefaultCurve:curve];
	
	[bullet setExplodeCurve:[self deathCurve]];
	
	return bullet;
}

+(Bullet *) fourBullet:(int)type {
	
	int y1 = 0;
	int y2 = 0;
	int size = 16;
	int power = 3;
	switch (type) {
		case 1:
			y1 = -300;
			y2 = -200;
			break;
		case 2:
			y1 = -200;
			y2 = 0;
			size = 25;
			power = 5;
			break;
		case 3:
			y1 = 200;
			y2 = 0;
			size = 25;
			power = 5;
			break;
		case 4:
			y1 = 300;
			y2 = 200;
			break;
		default:
			break;
	}
	
	Bullet *bullet = [[Bullet alloc] initWithChar:@"弹" Size:size];
	[bullet setColor:[Color R:250 G:150 B:255 A:1]];
	[bullet setSpeedX:600 Y:y1];
	[bullet setPower:power];
	
	Curve *curve = [[Curve alloc] init];
	SetSpeedAction *action = [SetSpeedAction actionWithSpeedX:600 Y:y2];
	[curve addAction:action Tick:2];
	[bullet setDefaultCurve:curve];
	
	[bullet setExplodeCurve:[self deathCurve]];
	
	return bullet;
}

+(Bullet *) shockWaveBullet:(int)type {
	
	//NSLog(@"Build bullet with type %d", type);
	
	Bullet *bullet = [[Bullet alloc] initWithChar:@"破" Size:30];
	
	[bullet setColor:[Color R:0 G:255 B:50]];
	[bullet setPower:10];
	
	int level = type / 36;
	int angel = type % 36;
	
	[bullet setOpacity:(level * 85)];
	double delta = (angel/36.0)*6.28;
	[bullet setSpeedX:sin(delta)*360 Y:cos(delta)*360];

	// 0-23
	Curve *curve = [[Curve alloc] init];
	HelixSpeedAction *action1 = [HelixSpeedAction actionWithRate:0.22 Duration:2];
	//HelixSpeedAction *action2 = [HelixSpeedAction actionWithRate:0.4 Duration:1.0];
	[curve addAction:action1 Time:0];
	//[curve addAction:action2 Time:3.0];
	[bullet setDefaultCurve:curve];
	
	[bullet setExplodeCurve:[self deathCurve]];
	
	return bullet;
}

+(Curve *) deathCurve {

	Curve *curve = [[Curve alloc] init];
	SetColorAction *action0 = [SetColorAction actionWithColor:[Color R:255 G:0 B:0]];
	SlowDownAction *action1 = [SlowDownAction actionWithRate:0.3];
	SetCharacterAction *action2 = [SetCharacterAction actionWithString:@"碎"];
	FadeoutAction *action3 = [FadeoutAction actionWithRate:0.7];
	[curve addAction:action0 Time:0];
	[curve addAction:action1 Time:0];
	[curve addAction:action2 Time:0];
	[curve addAction:action3 Time:0];
	[curve setTimeout:10];
	
	return curve;
}


@end
