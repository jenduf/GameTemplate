//
//  StatsMenuSprite.m
//  Dingbats_Cocos
//
//  Created by Jennifer Duffey on 8/30/11.
//  Copyright 2011 Blockdot. All rights reserved.
//

#import "StatsMenuSprite.h"
#import "Utils.h"
#import "Constants.h"

@implementation StatsMenuSprite


- (void)createMenu
{
     CGSize windowSize = CGSizeMake(MENU_INTERIOR_WIDTH, MENU_INTERIOR_HEIGHT);
     CGSize screenSize = [[CCDirector sharedDirector] winSize];
     
     CCMenuItemImage *socialButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_SOCIAL forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_SOCIAL forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showSocial)];
     [socialButton setPosition:ccp(0, windowSize.height/2 - socialButton.rect.size.height)];
     
     CCSprite *menuHRule = [CCSprite spriteWithFile:IMAGE_MENU_HRULE];
     [menuHRule setPosition:CGPointMake(screenSize.width/2, screenSize.height - (windowSize.height/2) - socialButton.rect.size.height)];
     [self addChild:menuHRule z:1 tag:0];
     
     CCMenuItemImage *highScoresButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_HIGH_SCORES forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_HIGH_SCORES forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showHighScores)];
     [highScoresButton setPosition:ccp(0 - (highScoresButton.rect.size.width/2), socialButton.rect.origin.y - socialButton.rect.size.height - (menuHRule.textureRect.size.height * 2))];
     
     CCMenuItemImage *achievementsButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_ACHIEVEMENTS forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_ACHIEVEMENTS forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showAchievements)];
     [achievementsButton setPosition:ccp(highScoresButton.rect.size.width/2, socialButton.rect.origin.y - socialButton.rect.size.height - (menuHRule.textureRect.size.height * 2))];
     
     CCMenuItemImage *fanPageButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_FAN_PAGE forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_FAN_PAGE forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showFanPage)];
     [fanPageButton setPosition:ccp(0 - (fanPageButton.rect.size.width/2), achievementsButton.rect.origin.y - fanPageButton.rect.size.height/2 - MENU_PADDING)];
     
     CCMenuItemImage *challengeButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_CHALLENGE forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_CHALLENGE forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(challengeAFriend)];
     [challengeButton setPosition:ccp(fanPageButton.rect.size.width/2, achievementsButton.rect.origin.y - fanPageButton.rect.size.height/2 - MENU_PADDING)];
     
     CCMenuItemImage *gamesButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_GAMES forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_GAMES forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(showMoreGames)];
     [gamesButton setPosition:ccp(0, challengeButton.rect.origin.y - gamesButton.rect.size.height/2 - MENU_PADDING)];
	
	CCMenu *mainMenu = [CCMenu menuWithItems:socialButton, highScoresButton, achievementsButton, fanPageButton, challengeButton, gamesButton, nil];
	[mainMenu setPosition:ccp(screenSize.width/2, screenSize.height/2)];
	[self addChild:mainMenu];
     
}

- (void)challengeAFriend
{
     
}

- (void)showAchievements
{
     
}

- (void)showFanPage
{
     
}

- (void)showHighScores
{
     
}

- (void)showMoreGames
{
     
}

- (void)showSocial
{
     
}

- (void)doCloseButtonSelected
{
	[self.actionTarget performSelector:@selector(closeMenu:) withObject:self];
}

@end
