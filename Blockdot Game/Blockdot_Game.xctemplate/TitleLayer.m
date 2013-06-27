//
//  BackgroundLayer.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "TitleLayer.h"
#import "TitleScene.h"
#import "TitleBackgroundSprite.h"
#import "GameManager.h"
#import "Constants.h"
#import "Utils.h"


@implementation TitleLayer

- (id)init
{
	self = [super init];
	
	if(self != nil)
	{
		CGSize screenSize = [[CCDirector sharedDirector] winSize];
		
		[[GameManager sharedGameManager] playBackgroundTrack:MUSIC_GAME];
          
		TitleBackgroundSprite *backgroundSprite = [[TitleBackgroundSprite alloc] initWithFile:IMAGE_TITLE_BACKGROUND];
		[backgroundSprite setPosition:ccp(screenSize.width/2, screenSize.height/2)];
		[self addChild:backgroundSprite];
		[backgroundSprite addOverlay];
		
		[self createTitleMenu];
		
		[self scheduleUpdate];
	}
	
	return self;
}

#pragma mark –
#pragma mark Update Method
-(void) update:(ccTime)deltaTime 
{
	// update method
}

- (void)createTitleMenu
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	CCMenuItemImage *menuButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:TITLE_BUTTON_MENU forState:kButtonStateUp] selectedImage:[Utils getImageByName:TITLE_BUTTON_MENU forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showMenu:)];
	menuButton.tag = MainMenu;
	
	CCMenuItemImage *playButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:TITLE_BUTTON_PLAY forState:kButtonStateUp] selectedImage:[Utils getImageByName:TITLE_BUTTON_PLAY forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showMenu:)];
	playButton.tag = PuzzlePackMenu;
	
	CCMenuItemImage *statsButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:TITLE_BUTTON_STATS forState:kButtonStateUp] selectedImage:[Utils getImageByName:TITLE_BUTTON_STATS forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showMenu:)];
	statsButton.tag = StatsMenu;
	
	CCMenu *titleMenu = [CCMenu menuWithItems:menuButton, playButton, statsButton, nil];
	[titleMenu alignItemsHorizontallyWithPadding:MENU_PADDING];
	[titleMenu setPosition: ccp(screenSize.width/2, TITLE_Y)];
	[self addChild:titleMenu z:0 tag:kTitleMenuTagValue];
}

- (void)showMenu:(id)sender
{
	int tag = [sender tag];
     
	[[GameManager sharedGameManager] playSoundEffect:SOUND_BUTTON_CLICK_KEY];
     
	TitleScene *titleScene = (TitleScene *)[[CCDirector sharedDirector] runningScene];
	[titleScene displayMenuType:tag];
}

@end
