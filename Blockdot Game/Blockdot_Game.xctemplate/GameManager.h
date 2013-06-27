//
//  GameManager.h
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "SimpleAudioEngine.h"

@interface GameManager : NSObject
{

}

@property (nonatomic, strong) NSMutableDictionary *listOfSoundEffectFiles;
@property (nonatomic, assign) SceneType currentScene;
@property (nonatomic, assign) GameTransitionStyle gameTransitionStyle;
@property (nonatomic, assign) BOOL hasAudioBeenInitialized;
@property (nonatomic, strong) SimpleAudioEngine *soundEngine;
@property (readwrite) SceneManagerSoundState managerSoundState;

+ (GameManager *)sharedGameManager; 
- (void)runSceneWithID:(SceneType)sceneID; 
- (void)setupAudioEngine;
- (void)loadAudio;
- (void)unloadAudio;
- (NSDictionary *)getSoundEffectsList;
- (void)playBackgroundTrack:(NSString *)trackFileName;
- (ALuint)playSoundEffect:(NSString *)soundEffectKey;
- (void)stopBackgroundTrack;
- (void)stopSoundEffect:(ALuint)soundEffectID;

@end
