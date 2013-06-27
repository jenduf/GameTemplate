//
//  MainMenuSprite.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "MainMenuSprite.h"
#import "Utils.h"
#import "Constants.h"

@implementation MainMenuSprite

- (void)createMenu
{
	CGSize windowSize = CGSizeMake(MENU_INTERIOR_WIDTH, MENU_INTERIOR_HEIGHT);
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	CCMenuItemImage *startButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_START forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_START forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(startGame)];
	[startButton setPosition:ccp(0, windowSize.height/2 - startButton.rect.size.height)];
	
	CCSprite *menuHRule = [CCSprite spriteWithFile:IMAGE_MENU_HRULE];
	[menuHRule setPosition:CGPointMake(screenSize.width/2, screenSize.height/2 + startButton.rect.size.height)];
	[self addChild:menuHRule z:1 tag:0];
	
	CCMenuItemImage *rulesButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_RULES forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_RULES forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showRules)];
	[rulesButton setPosition:ccp(0 - (rulesButton.rect.size.width/2), startButton.rect.origin.y - startButton.rect.size.height)];
	
	CCMenuItemImage *creditsButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_CREDITS forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_CREDITS forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showCredits)];
	[creditsButton setPosition:ccp(creditsButton.rect.size.width/2, startButton.rect.origin.y - startButton.rect.size.height)];
	
	CCMenuItemImage *socialButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_SOCIAL forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_SOCIAL forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showSocial)];
	[socialButton setPosition:ccp(0, creditsButton.rect.origin.y - socialButton.rect.size.height/2 - MENU_PADDING)];//-socialButton.rect.size.height)];
	
	CCMenuItemImage *gamesButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_GAMES forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_GAMES forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showMoreGames)];
	[gamesButton setPosition:ccp(0, socialButton.rect.origin.y - gamesButton.rect.size.height/2 - MENU_PADDING)];
	
	CCMenu *mainMenu = [CCMenu menuWithItems:startButton, rulesButton, creditsButton, socialButton, gamesButton, nil];
	[mainMenu setPosition:ccp(screenSize.width/2, screenSize.height/2)];
	[self addChild:mainMenu];

}

- (void)showCredits
{
	[self.actionTarget performSelector:@selector(showCreditsMenu:) withObject:nil];
}

- (void)showMoreGames
{
	[self.actionTarget performSelector:@selector(showMoreGames:) withObject:nil];
}

- (void)showRules
{
	[self.actionTarget performSelector:@selector(showRulesMenu:) withObject:nil];
}

- (void)showSocial
{
	[self.actionTarget performSelector:@selector(showSocialMenu:) withObject:nil];
}

- (void)startGame
{
	[self.actionTarget performSelector:@selector(showPlayMenu:) withObject:nil];
}

- (void)doCloseButtonSelected
{
	[self.actionTarget performSelector:@selector(closeMenu:) withObject:self];
}

@end
