//
//  ConnectWithSocialMenuSprite.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ConnectWithSocialMenuSprite.h"
#import "Constants.h"
#import "Utils.h"

@implementation ConnectWithSocialMenuSprite

- (void)createMenu
{
	//CGSize windowSize = CGSizeMake(MENU_INTERIOR_WIDTH, MENU_INTERIOR_HEIGHT);
     CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	CCLabelTTF *label = [CCLabelTTF labelWithString:TEXT_SOCIAL_HEADER fontName:@"Helvetica-Bold" fontSize:MENU_TITLE_FONT_SIZE];
	
     [label setPosition:CGPointMake(screenSize.width / 2, screenSize.height - MENU_LABEL_OFFSET)];
     [self addChild:label];
	
	CCMenuItemImage *facebookLogoSprite = [CCMenuItemImage itemFromNormalImage:IMAGE_FACEBOOK_LOGO selectedImage:IMAGE_FACEBOOK_LOGO disabledImage:nil target:self selector:@selector(facebookConnect)];
     [facebookLogoSprite setPosition:CGPointMake(0, 0)];
	
	CCMenuItemImage *facebookButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_CONNECT_FACEBOOK forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_CONNECT_FACEBOOK forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(facebookConnect)];
     [facebookButton setPosition:ccp(0, 0)];
	
	CCLabelTTF *facebookLabel = [CCLabelTTF labelWithString:TEXT_FACEBOOK_CONNECT 
									 dimensions:CGSizeMake(facebookButton.boundingBox.size.width, MENU_LABEL_HEIGHT) 
									  alignment:UITextAlignmentCenter lineBreakMode:UILineBreakModeWordWrap 
									   fontName:@"Helvetica" fontSize:MENU_SMALL_TEXT_FONT_SIZE];
	CCMenuItemLabel *facebookMenuItem = [CCMenuItemLabel itemWithLabel:facebookLabel];
     [facebookLabel setPosition:CGPointMake(0, 0)];
	
	CCMenu *leftMenu = [CCMenu menuWithItems:facebookLogoSprite, facebookButton, facebookMenuItem, nil];
	[leftMenu setPosition:ccp(screenSize.width/2 - MENU_LABEL_WIDTH/2 + MENU_SPACING, screenSize.height / 2 - MENU_SPACING)];
	[leftMenu alignItemsVerticallyWithPadding:MENU_PADDING];
	[self addChild:leftMenu];
	
	CCMenuItemImage *gameCenterLogoSprite = [CCMenuItemImage itemFromNormalImage:IMAGE_GAMECENTER_LOGO selectedImage:IMAGE_GAMECENTER_LOGO disabledImage:nil target:self selector:@selector(gameCenterConnect)];
     [gameCenterLogoSprite setPosition:CGPointMake(0, 0)];
	
	CCMenuItemImage *gameCenterButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_CONNECT_GAMECENTER forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_CONNECT_GAMECENTER forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(gameCenterConnect)];
     [gameCenterButton setPosition:ccp(0, 0)];
	
	CCLabelTTF *gameCenterLabel = [CCLabelTTF labelWithString:TEXT_GAMECENTER_CONNECT 
										dimensions:CGSizeMake(gameCenterButton.boundingBox.size.width, MENU_LABEL_HEIGHT) 
										 alignment:UITextAlignmentCenter lineBreakMode:UILineBreakModeWordWrap 
										  fontName:@"Helvetica" fontSize:MENU_SMALL_TEXT_FONT_SIZE];
	CCMenuItemLabel *gameCenterMenuItem = [CCMenuItemLabel itemWithLabel:gameCenterLabel];
     [gameCenterLabel setPosition:CGPointMake(0, 0)];
	
	CCMenu *rightMenu = [CCMenu menuWithItems:gameCenterLogoSprite, gameCenterButton, gameCenterMenuItem, nil];
	[rightMenu setPosition:ccp(screenSize.width/2 + gameCenterButton.boundingBox.size.width/2, screenSize.height / 2 - MENU_SPACING)];
	[rightMenu alignItemsVerticallyWithPadding:MENU_PADDING];
	[self addChild:rightMenu];
	
}

- (void)addOverlayBox
{
     CGSize screenSize = [[CCDirector sharedDirector] winSize];
     
     CCSprite *menuInterior = [CCSprite spriteWithFile:IMAGE_MENU_INTERIOR_OVERLAY];
     [menuInterior setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
     [self addChild:menuInterior];
}

- (void)facebookConnect
{
	
}

- (void)gameCenterConnect
{
	
}

- (void)doCloseButtonSelected
{
	[self.actionTarget performSelector:@selector(closeMenu:) withObject:self];
}

@end
