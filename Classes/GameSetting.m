//
//  GameSettings.m
//  Jipozhuan
//
//  Created by sui toney on 11-2-13.
//  Copyright 2011 ms. All rights reserved.
//

#import "GameSetting.h"

static GameSetting *_gameSetting;

@implementation GameSetting

@synthesize controlLocation, autoShooting, playMusic, playSound;

+(GameSetting *)gameSetting {
	return _gameSetting;
}

+(NSString *) gameFilePath {
	
	NSString *dir = [NSSearchPathForDirectoriesInDomains(  NSDocumentDirectory
														 , NSUserDomainMask
														 , YES) objectAtIndex:0];
	
	return [NSString stringWithFormat:@"%@/Jpgame.settings", dir];
	
}

+(void) loadGameSettingFromFile {
	
	if (![[NSFileManager defaultManager] fileExistsAtPath:[self gameFilePath]]) {
		
		NSLog(@"Cannot find game setting file, create a new instance.");
		_gameSetting = [[GameSetting alloc] init];
		_gameSetting.controlLocation = 0;
		_gameSetting.autoShooting = 0;
		_gameSetting.playMusic = 1;
		_gameSetting.playSound = 1;
		return;
	}
	
    @synchronized([GameSetting class]) {
        [_gameSetting release];
        _gameSetting = [[NSKeyedUnarchiver unarchiveObjectWithFile:[self gameFilePath]] retain];
		NSLog(@"Loaded game setting from file [%@]", [self gameFilePath]);
    }

}

+(void) saveGameSettingToFile {
	
	NSLog(@"Save game setting to:%@", [self gameFilePath]);
	NSFileManager *fm = [NSFileManager defaultManager];
	if ([fm fileExistsAtPath:[self gameFilePath]]) {
		NSError *myerror;
		[fm removeItemAtPath:[self gameFilePath] error:&myerror];
	}
	[NSKeyedArchiver archiveRootObject:[GameSetting gameSetting] toFile:[self gameFilePath]];
	
}


- (void) encodeWithCoder:(NSCoder *)coder {
    [coder encodeInt:controlLocation forKey:@"controlLocation"];
    [coder encodeInt:autoShooting forKey:@"autoShooting"];
    [coder encodeInt:playMusic forKey:@"playMusic"];
    [coder encodeInt:playSound forKey:@"playSound"];
}

- (id) initWithCoder:(NSCoder *)coder {
    self = [super init];
    controlLocation = [coder decodeIntForKey:@"controlLocation"];
    autoShooting = [coder decodeIntForKey:@"autoShooting"];
    playMusic = [coder decodeIntForKey:@"playMusic"];
    playSound = [coder decodeIntForKey:@"playSound"];
    return self;
}


@end
