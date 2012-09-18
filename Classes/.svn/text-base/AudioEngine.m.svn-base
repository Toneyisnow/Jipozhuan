//
//  AudioEngine.m
//  Jipozhuan
//
//  Created by sui toney on 11-5-24.
//  Copyright 2011 ms. All rights reserved.
//

#import "AudioEngine.h"
#import "SimpleAudioEngine.h"
#import "GameSetting.h"

@implementation AudioEngine

static int willPlayBossMusic;
static int willPlayBackgroundMusic;
static BOOL willStopMusic;

static BOOL playMusicFlag;
static BOOL playSoundFlag;


+(void) preloadAll {

	
	SimpleAudioEngine *sae =[SimpleAudioEngine sharedEngine];
	if(sae !=nil) {
		[sae preloadBackgroundMusic:@"hxmusic.mp3"];
		[sae preloadBackgroundMusic:@"confirm.wav"];
		[sae preloadBackgroundMusic:@"back.wav"];
		[sae preloadBackgroundMusic:@"background.mp3"];
		[sae preloadBackgroundMusic:@"boss.mp3"];
		[sae preloadBackgroundMusic:@"explode.wav"];
		[sae preloadBackgroundMusic:@"bullet1.wav"];
		[sae preloadBackgroundMusic:@"bomb.wav"];
		[sae preloadBackgroundMusic:@"bossexplode.wav"];
		[sae preloadBackgroundMusic:@"supply.wav"];

		willPlayBossMusic = 0;
		willPlayBackgroundMusic = 0;
		willStopMusic = FALSE;
		
		[self loadAudioFlags];
		
		[SimpleAudioEngine sharedEngine].effectsVolume = 0.3;
	}
	
}

+(void) tick {

	if (!playMusicFlag) {
		return;
	}
	
	SimpleAudioEngine *engine = [SimpleAudioEngine sharedEngine];
	
	if(willPlayBossMusic > 0) {
		if (engine.willPlayBackgroundMusic && engine.backgroundMusicVolume > 0) {
			engine.backgroundMusicVolume -= 0.015;
		}
		else {
			engine.backgroundMusicVolume = 1;
			[engine playBackgroundMusic:@"boss.mp3"];
			willPlayBossMusic = FALSE;
		}
	}
	
	if(willPlayBackgroundMusic > 0) {
		if (engine.willPlayBackgroundMusic && engine.backgroundMusicVolume > 0) {
			engine.backgroundMusicVolume -= 0.02;
		}
		else {
			engine.backgroundMusicVolume = 1;
			
			if (willPlayBackgroundMusic == 5) {
				[engine playBackgroundMusic:@"hxmusic.mp3"];
			} else {
				[engine playBackgroundMusic:@"background.mp3"];
			}

			willPlayBackgroundMusic = FALSE;
		}
	}
	
	if (willStopMusic) {
		
		if (engine.willPlayBackgroundMusic && engine.backgroundMusicVolume > 0) {
			engine.backgroundMusicVolume -= 0.025;
		} else {
			[engine stopBackgroundMusic];
			willStopMusic = FALSE;
		}

	}
}

+(void) clickButtonConfirmEffect {
	
	if (!playSoundFlag) {
		return;
	}
	[[SimpleAudioEngine sharedEngine] playEffect:@"confirm.wav"];
}

+(void) clickButtonCancelEffect {
	
	if (!playSoundFlag) {
		return;
	}
	[[SimpleAudioEngine sharedEngine] playEffect:@"back.wav"];
}

+(void) playBackgroundMusic:(int) level {

	if (!playMusicFlag) {
		return;
	}
	/*
	NSURL *file = [NSURL fileURLWithPath:@".\background.mp3"];
	AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc ] initWithContentsOfURL:file error:NULL];
    
	[audioPlayer prepareToPlay];
	// [audioPlayer setDelegate:self];
	// audioPlayer.numberOfLoops = -1;
	[audioPlayer play];
	*/
	
	willPlayBackgroundMusic = level;
}

+(void) playBossMusic:(int) level {
	
	if (!playMusicFlag) {
		return;
	}
	willPlayBossMusic = level;
}

+(void) selfExplodeEffect:(int)level {
	
	if (!playSoundFlag) {
		return;
	}
	[[SimpleAudioEngine sharedEngine] playEffect:@"explode.wav"];
}

+(void) shootBulletEffect:(int)level {
	
	if (!playSoundFlag) {
		return;
	}
	//[[SimpleAudioEngine sharedEngine] playEffect:@"bullet1.wav"];
}

+(void) shootBombEffect:(int)level {
	
	if (!playSoundFlag) {
		return;
	}
	//[[SimpleAudioEngine sharedEngine] playEffect:@"bomb.wav"];
}

+(void) supplyEffect:(int)level {
	
	if (!playSoundFlag) {
		return;
	}
	//[[SimpleAudioEngine sharedEngine] playEffect:@"supply.wav"];
}

+(void) bossExplodeEffect:(int)level {
	
	if (!playSoundFlag) {
		return;
	}
	[[SimpleAudioEngine sharedEngine] playEffect:@"bossexplode.wav"];
}

+(void) fadeOutMusic {

	willStopMusic = TRUE;
}

+(void) stopAllMusic {

	SimpleAudioEngine *engine = [SimpleAudioEngine sharedEngine];
	if (engine.willPlayBackgroundMusic) {
		[engine stopBackgroundMusic];
	}
}

+(void) loadAudioFlags {

	if ([GameSetting gameSetting] == NULL) {
		[GameSetting loadGameSettingFromFile];
	}
	GameSetting *setting = [GameSetting gameSetting];
	
	if (setting.playMusic == 1) {
		playMusicFlag = TRUE;
	} else {
		playMusicFlag = FALSE;
	}

	if (setting.playSound == 1) {
		playSoundFlag = TRUE;
	} else {
		playSoundFlag = FALSE;
	}
	
	willStopMusic = FALSE;
}

@end

