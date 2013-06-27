//
//  GameManager.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "GameManager.h"
#import "IntroScene.h"
#import "TitleScene.h"
#import "GameScene.h"

@implementation GameManager

@synthesize listOfSoundEffectFiles = _listOfSoundEffectFiles;
@synthesize managerSoundState = _managerSoundState;
@synthesize currentScene = _currentScene;
@synthesize gameTransitionStyle = _gameTransitionStyle;
@synthesize hasAudioBeenInitialized = _hasAudioBeenInitialized;
@synthesize soundEngine = _soundEngine;

static GameManager *_sharedGameManager = nil;

+(GameManager *)sharedGameManager 
{
	@synchronized([GameManager class])                             
	{
		if(!_sharedGameManager)                                   
			_sharedGameManager =  [[GameManager alloc] init]; 
		
		return _sharedGameManager;                                
	}
	
	return nil; 
}

+(id)alloc 
{
	@synchronized ([GameManager class])                            
	{
		NSAssert(_sharedGameManager == nil,
		         @"Attempted to allocated a second instance of the Scene Manager singleton"); 
		_sharedGameManager = [super alloc];
		return _sharedGameManager;                                 
	}
	return nil;  
}

-(id)init 
{                                                        
	self = [super init];
	
	if(self)
	{
		self.hasAudioBeenInitialized = NO;
		self.soundEngine = nil;
		self.managerSoundState = kAudioManagerUninitialized;
		self.currentScene = Intro;
		self.gameTransitionStyle = GAME_TRANSITION_STYLE;
	}
	
	return self;
}

- (void)runSceneWithID:(SceneType)sceneID
{
	if(self.currentScene != sceneID || self.currentScene == Intro)
	{
		SceneType oldScene = self.currentScene;
		self.currentScene = sceneID;
		
		id sceneToRun = nil;
		switch (sceneID)
		{
			case Intro:
				sceneToRun = [IntroScene node];
				break;
			case Title: 
				sceneToRun = [TitleScene node];
				break;
			case Game:
				sceneToRun = [GameScene node];
				break;
			case Menu:
				sceneToRun = [TitleScene node];
				break;
				
			default:
				CCLOG(@"Unknown ID, cannot switch scenes");
				return;
				break;
		}
		
		if(sceneToRun == nil)
		{
			// revert back since no new scene was found
			self.currentScene = oldScene;
			return;
		}
		
		// load audio for new scene
		[self performSelectorInBackground:@selector(loadAudio) withObject:nil];
		
		if ([[CCDirector sharedDirector] runningScene] == nil) 
		{
			[[CCDirector sharedDirector] runWithScene:sceneToRun];
			
		} 
		else 
		{
			if(sceneID == Game)
			{
				if(self.gameTransitionStyle == LeftRight)
				{
					CCTransitionSlideInR *slideTrans = [CCTransitionSlideInR transitionWithDuration:0.4 scene:sceneToRun];
					[[CCDirector sharedDirector] replaceScene:slideTrans];
				}
				else if(self.gameTransitionStyle == TopBottom)
				{
					CCTransitionSlideInB *slideTrans = [CCTransitionSlideInB transitionWithDuration:0.4 scene:sceneToRun];
					[[CCDirector sharedDirector] replaceScene:slideTrans];
				}
			}
			else if(sceneID == Title)
			{
				// initialize a transition scene object
				CCTransitionFade *fadeTrans = [CCTransitionFade transitionWithDuration:0.4 scene:sceneToRun withColor:ccWHITE];
				[fadeTrans hideOutShowIn];
				[[CCDirector sharedDirector] replaceScene:fadeTrans];
			}
			else if(sceneID == Menu)
			{
				if(self.gameTransitionStyle == LeftRight)
				{
					CCTransitionSlideInL *slideTrans = [CCTransitionSlideInL transitionWithDuration:0.4 scene:sceneToRun];
					[[CCDirector sharedDirector] replaceScene:slideTrans];
				}
				else if(self.gameTransitionStyle == TopBottom)
				{
					CCTransitionSlideInT *slideTrans = [CCTransitionSlideInT transitionWithDuration:0.4 scene:sceneToRun];
					[[CCDirector sharedDirector] replaceScene:slideTrans];
				}
			}
		}
		
		[self performSelectorInBackground:@selector(unloadAudio) withObject:nil];
		
	}
}

- (void)setupAudioEngine
{
	if(self.hasAudioBeenInitialized == YES)
		return;
	
	self.hasAudioBeenInitialized = YES;
	
	NSOperationQueue *queue = [NSOperationQueue new];
	NSInvocationOperation *asyncSetupOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(initAudioAsync) object:nil];
	[queue addOperation:asyncSetupOperation];
}

- (void)initAudioAsync
{
	// initializes the audio engine asynchronously
	self.managerSoundState = kAudioManagerInitializing;
	
	// indicate that we are trying to start up the audio manager
	[CDSoundEngine setMixerSampleRate:CD_SAMPLE_RATE_MID];
	
	// Init audio manager asynchronously as it can take a few seconds
	// The FXPlusMusicIfNoOtherAudio mode will check if the user is
	// playing music and disable background music playback if
	// that is the case.
	[CDAudioManager initAsynchronously:kAMM_FxPlusMusicIfNoOtherAudio];
	
	// wait for the audio manager to initialize
	while ([CDAudioManager sharedManagerState] != kAMStateInitialised)
	{
		[NSThread sleepForTimeInterval:0.1];
	}
	
	// At this point the CocosDenshion should be initialized
	// Grab the cdaudiomanager and check the state
	CDAudioManager *audioManager = [CDAudioManager sharedManager];
	if(audioManager.soundEngine == nil || audioManager.soundEngine.functioning == NO)
	{
		CCLOG(@"CocosDenshion failed to init, no audio will play.");
		self.managerSoundState = kAudioManagerFailed;
	}
	else
	{
		[audioManager setResignBehavior:kAMRBStopPlay autoHandle:YES];
		self.soundEngine = [SimpleAudioEngine sharedEngine];
		self.managerSoundState = kAudioManagerReady;
		CCLOG(@"CocosDenshion is Ready");
	}
	
}

- (void)loadAudio
{
	@autoreleasepool 
	{
		if(self.managerSoundState == kAudioManagerInitializing)
		{
			int waitCycles = 0;
			while(waitCycles < AUDIO_MAX_WAITTIME)
			{
				[NSThread sleepForTimeInterval:0.1f];
				if((self.managerSoundState == kAudioManagerReady) || (self.managerSoundState == kAudioManagerFailed))
				{
					break;
				}
				
				waitCycles = waitCycles + 1;
			}
		}
		
		if(self.managerSoundState == kAudioManagerFailed)
		{
			return;
		}
		
		self.listOfSoundEffectFiles = [[NSMutableDictionary alloc] initWithDictionary:[self getSoundEffectsList]];
		
		if(self.listOfSoundEffectFiles == nil)
		{
			CCLOG(@"Error loading SoundEffects");
			return;
		}
		
		for(NSString *keyString in self.listOfSoundEffectFiles)
		{
			CCLOG(@"\n Loading Audio Key:%@ File: %@", keyString, [self.listOfSoundEffectFiles objectForKey:keyString]);
			[self.soundEngine preloadEffect:[self.listOfSoundEffectFiles objectForKey:keyString]];
		}
	}
}

- (void)unloadAudio
{
	@autoreleasepool 
	{
		NSDictionary *soundEffectsToUnload = [self getSoundEffectsList];
		
		if(soundEffectsToUnload == nil)
		{
			CCLOG(@"Error unloading SoundEffects");
			return;
		}
		
		if(self.managerSoundState == kAudioManagerReady)
		{
			// get all of the entries and unload
			for(NSString *keyString in soundEffectsToUnload)
			{
				CCLOG(@"\n Unloading Audio Key:%@ File: %@", keyString, [soundEffectsToUnload objectForKey:keyString]);
				[self.soundEngine unloadEffect:keyString];
			}
			
		}
	}
}

- (void)playBackgroundTrack:(NSString *)trackFileName
{
	// Wait to make sure sound engine is initialized
	if((self.managerSoundState != kAudioManagerReady) && (self.managerSoundState != kAudioManagerFailed))
	{
		int waitCycles = 0;
		while(waitCycles < AUDIO_MAX_WAITTIME)
		{
			[NSThread sleepForTimeInterval:0.1f];
			if((self.managerSoundState == kAudioManagerReady) || (self.managerSoundState == kAudioManagerFailed))
			{
				break;
			}
			
			waitCycles = waitCycles + 1;
		}
	}
	
	if(self.managerSoundState == kAudioManagerReady)
	{
		if([self.soundEngine isBackgroundMusicPlaying])
		{
			[self.soundEngine stopBackgroundMusic];
		}
		
		[self.soundEngine preloadBackgroundMusic:trackFileName];
		[self.soundEngine playBackgroundMusic:trackFileName loop:YES];
	}
}

- (void)stopBackgroundTrack
{
	if(self.managerSoundState == kAudioManagerReady)
	{
		[self.soundEngine stopBackgroundMusic];
	}
}

- (ALuint)playSoundEffect:(NSString *)soundEffectKey
{
	ALuint soundID = 0;
	
	if(self.managerSoundState == kAudioManagerReady)
	{
		soundID = [self.soundEngine playEffect:[self.listOfSoundEffectFiles objectForKey:soundEffectKey]];
	}
	else
	{
		CCLOG(@"GameMgr: Sound Manager is not ready, cannot play %@", soundEffectKey);
	}
	
	return soundID;
}

- (void)stopSoundEffect:(ALuint)soundEffectID
{
	if(self.managerSoundState == kAudioManagerReady)
	{
		[self.soundEngine stopEffect:soundEffectID];
	}
}

- (NSDictionary *)getSoundEffectsList
{
	NSDictionary *soundEffectsToLoad = [NSDictionary dictionaryWithObjectsAndKeys:SOUND_BUTTON_CLICK,SOUND_BUTTON_CLICK_KEY, nil];
	
	return soundEffectsToLoad;
}

@end
