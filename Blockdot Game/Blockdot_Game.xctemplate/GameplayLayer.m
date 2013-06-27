//
//  GameplayLayer.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "GameplayLayer.h"
#import "Constants.h"
#import "BackgroundSprite.h"
#import "Utils.h"
#import "GameManager.h"
#import "CCLabelFX.h"

static inline ccColor4B ccc4BFromccc3B(ccColor3B c)
{
	return (ccColor4B){c.r/255.f, c.g/255.f, c.b/255.f, 1.0f};
}

@implementation GameplayLayer

- (id)init
{
	self = [super init];
	
	if(self != nil)
	{
		CGSize screenSize = [[CCDirector sharedDirector] winSize];
		
		currentTime = 240;
		
		BackgroundSprite *backgroundSprite = [[BackgroundSprite alloc] initWithFile:IMAGE_GAME_BACKGROUND];
		[backgroundSprite setPosition:ccp(screenSize.width/2, screenSize.height/2)];
		[self addChild:backgroundSprite];
		
		[self createGameNavigation];
		
		[self addGameClue];
		
		[self schedule:@selector(updateTimer:) interval:kTimerThreshold];
	}
	
	return self;
}

#pragma mark –
#pragma mark Update Method
-(void) update:(ccTime)deltaTime 
{
     accumulatedTime += deltaTime;
}

- (void)createGameNavigation
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	CCMenuItemImage *menuButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:BUTTON_GAME_MENU forState:kButtonStateUp] selectedImage:[Utils getImageByName:BUTTON_GAME_MENU forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showMenu:)];
	
	CCMenuItemImage *muteButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:BUTTON_GAME_MUTE forState:kButtonStateUp] selectedImage:[Utils getImageByName:BUTTON_GAME_MUTE forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(toggleMute:)];
	
	CCMenuItemImage *timerImage = [CCMenuItemImage itemFromNormalImage:IMAGE_GAME_TIMER selectedImage:nil disabledImage:nil target:self selector:nil];
	
	ccColor4B shadowColor = ccc4BFromccc3B(ccBLACK);
	ccColor4B fillColor = ccc4BFromccc3B(ccWHITE);
	
	timerLabel = [CCLabelFX labelWithString:TEXT_TIMER_START
				 fontName:FONT_HELVETICA_BOLD 
				 fontSize:GAME_TIMER_FONT_SIZE 
			       shadowOffset:CGSizeMake(-2,2) 
			         shadowBlur:2.0f 
			        shadowColor:shadowColor 
				fillColor:fillColor];
	
	//timerLabel = [CCLabelTTF labelWithString:TEXT_TIMER_START fontName:FONT_HELVETICA_BOLD fontSize:GAME_TIMER_FONT_SIZE];
	[timerLabel setPosition:CGPointMake(GAME_TIMER_LABEL_X, MENU_SPACING)];
	[timerImage addChild:timerLabel];
	
	CCMenu *navMenu = [CCMenu menuWithItems:timerImage, menuButton, muteButton, nil];
	[navMenu alignItemsHorizontallyWithPadding:MENU_PADDING];
	[navMenu setPosition: ccp(screenSize.width - GAME_NAV_WIDTH, screenSize.height - GAME_NAV_HEIGHT)];
	[self addChild:navMenu z:0 tag:kNavMenuTagValue];
}

- (void)addGameClue
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	ccColor4B shadowColor = ccc4BFromccc3B(ccWHITE);
	ccColor4B fillColor = ccc4BFromccc3B(ccBLACK);
	
	CCLabelFX *gameClueLabel = [CCLabelFX labelWithString:TEXT_CLUE
					     fontName:FONT_HELVETICA_BOLD 
					     fontSize:GAME_CLUE_FONT_SIZE 
					 shadowOffset:CGSizeMake(2,2) 
					   shadowBlur:2.0f 
					  shadowColor:shadowColor 
					    fillColor:fillColor];
	
	[gameClueLabel setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
	[self addChild:gameClueLabel z:1 tag:0];
}

- (void)toggleMute:(id)sender
{
	[[GameManager sharedGameManager] stopBackgroundTrack];
}

- (void)showMenu:(id)sender
{
	[[GameManager sharedGameManager] runSceneWithID:Menu];
}

- (void)updateTimer:(ccTime)newTime
{
	currentTime -= newTime;
	
	if(currentTime > 0)
	{
		int min = (int)(currentTime / 60);
		int seconds = (int)currentTime % 60;
		timerLabel.string = [NSString stringWithFormat:@"%i:%02i", min, seconds];
	}
	else
		[self showMenu:nil];
}

@end
