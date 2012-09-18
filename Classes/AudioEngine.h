//
//  AudioEngine.h
//  Jipozhuan
//
//  Created by sui toney on 11-5-24.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface AudioEngine : NSObject {

}

+(void) preloadAll;


+(void) tick;

+(void) clickButtonConfirmEffect;
+(void) clickButtonCancelEffect;
+(void) playBackgroundMusic:(int) level;
+(void) playBossMusic:(int) level;
+(void) stopAllMusic;
+(void) fadeOutMusic;

+(void) selfExplodeEffect:(int)level;
+(void) supplyEffect:(int)level;
+(void) shootBulletEffect:(int)level;
+(void) shootBombEffect:(int)level;
+(void) bossExplodeEffect:(int)level;

+(void) loadAudioFlags;

@end
