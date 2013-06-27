//
//  MenuLayer.m
//  BD
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "MenuLayer.h"
#import "MainMenuSprite.h"
#import "StatsMenuSprite.h"
#import "CreditsMenuSprite.h"
#import "RulesMenuSprite.h"
#import "GameManager.h"
#import "PuzzlePackPickerMenuSprite.h"
#import "PuzzlePickerMenuSprite.h"
#import "ConnectWithSocialMenuSprite.h"
#import "WebSprite.h"

@implementation MenuLayer
@synthesize menuSprite = _menuSprite;
@synthesize puzzlePickerMenuSprite = _puzzlePickerMenuSprite;
@synthesize puzzlePackPickerMenuSprite = _puzzlePackPickerMenuSprite;

- (id)init
{
	self = [super init];
	
	if(self != nil)
	{
          
	}
	
	return self;
}

- (void)buildMenuForType:(MenuType)menuType
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	switch (menuType) 
	{
		case MainMenu:
			self.menuSprite = [[MainMenuSprite alloc] initWithTarget:self];
			break;
			
		case PuzzlePackMenu:
			self.menuSprite = [[PuzzlePackPickerMenuSprite alloc] initWithTarget:self];
			break;
			
		case PuzzleMenu:
			self.menuSprite = [[PuzzlePickerMenuSprite alloc] initWithTarget:self];
			break;
			
		case StatsMenu:
			self.menuSprite = [[StatsMenuSprite alloc] initWithTarget:self];
			break;
			
		default:
			self.menuSprite = [[MainMenuSprite alloc] initWithTarget:self];
			break;
	}
	
	
	[self.menuSprite setPosition:CGPointMake(screenSize.width/2, screenSize.height)];
	[self addChild:self.menuSprite z:2 tag:menuType];
	
	CCMoveTo *move = [CCMoveTo actionWithDuration:.25 position:ccp(screenSize.width/2, screenSize.height/2)];
	[self.menuSprite runAction:move];
}

- (void)showCreditsMenu:(id)sender
{
	[[GameManager sharedGameManager] playSoundEffect:SOUND_BUTTON_CLICK_KEY];
	
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	CreditsMenuSprite *creditsMenuSprite = [[CreditsMenuSprite alloc] initWithTarget:self];
	[creditsMenuSprite setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
	[self addChild:creditsMenuSprite z:2 tag:OverlayMenu];
}

- (void)showRulesMenu:(id)sender
{
	[[GameManager sharedGameManager] playSoundEffect:SOUND_BUTTON_CLICK_KEY];
	
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	RulesMenuSprite *rulesMenuSprite = [[RulesMenuSprite alloc] initWithTarget:self];
	[rulesMenuSprite setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
	[self addChild:rulesMenuSprite z:2 tag:OverlayMenu];
}

- (void)showSocialMenu:(id)sender
{
	[[GameManager sharedGameManager] playSoundEffect:SOUND_BUTTON_CLICK_KEY];
	
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	ConnectWithSocialMenuSprite *socialSprite = [[ConnectWithSocialMenuSprite alloc] initWithTarget:self];
	[socialSprite setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
	[self addChild:socialSprite z:2 tag:OverlayMenu];
}

- (void)showPlayMenu:(id)sender
{
	[[GameManager sharedGameManager] playSoundEffect:SOUND_BUTTON_CLICK_KEY];
	
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	self.puzzlePackPickerMenuSprite = [[PuzzlePackPickerMenuSprite alloc] initWithTarget:self];
	[self.puzzlePackPickerMenuSprite setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
	[self addChild:self.puzzlePackPickerMenuSprite z:2 tag:PuzzlePackOverlayMenu];
}

- (void)showMoreGames:(id)sender
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	WebSprite *webSprite = [[WebSprite alloc] initWithTarget:self forURL:GET_MORE_GAMES_URL];
	[webSprite setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
	[self addChild:webSprite z:2 tag:OverlayMenu];
}

- (void)showPuzzleMenu
{
	[[GameManager sharedGameManager] playSoundEffect:SOUND_BUTTON_CLICK_KEY];
	
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	self.puzzlePickerMenuSprite = [[PuzzlePickerMenuSprite alloc] initWithTarget:self];
	[self.puzzlePickerMenuSprite setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
	[self addChild:self.puzzlePickerMenuSprite z:2 tag:PuzzleMenu];
}

- (void)closeMenu:(id)sender
{
	CCSprite *sprite = (CCSprite *)sender;
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	int tag = [sender tag];
	
	switch(tag)
	{
		case OverlayMenu:
		case PuzzleMenu:
		case PuzzlePackOverlayMenu:
			[self removeChildByTag:[sender tag] cleanup:YES];
			break;
		default:
		{
			CCMoveTo *move = [CCMoveTo actionWithDuration:.3 position:ccp(screenSize.width/2, screenSize.height)];
			id funcAction = [CCCallFuncND actionWithTarget:self selector:@selector(animationComplete:) data:(__bridge void *)sender];
			[sprite runAction:[CCSequence actions:move, funcAction, nil]];
		}
			break;
	}
}

- (void)play:(id)sender
{
	int tag = [sender tag];
	
	switch(tag)
	{
		case PuzzlePackMenu:
		case PuzzlePackOverlayMenu:
			[self showPuzzleMenu];
			break;
		case PuzzleMenu:
			[self removeAllChildrenWithCleanup:YES];
			[[GameManager sharedGameManager] runSceneWithID:Game];
			break;
	}
	
	[sender performSelector:@selector(clean)];
}


#pragma mark - 
#pragma mark Animation Complete
- (void)animationComplete:(id)sender
{
	[self removeChildByTag:[sender tag] cleanup:YES];
	[sender performSelector:@selector(clean)];
}

@end
