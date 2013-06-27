//
//  MyCocos2DClass.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CreditsMenuSprite.h"
#import "Constants.h"
#import "Utils.h"

@implementation CreditsMenuSprite

- (void)createMenu
{
     CGSize windowSize = CGSizeMake(MENU_INTERIOR_WIDTH, MENU_INTERIOR_HEIGHT);
     CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	CCLabelTTF *label = [CCLabelTTF labelWithString:TEXT_CREDITS_HEADER fontName:@"Helvetica-Bold" fontSize:MENU_TITLE_FONT_SIZE];
								  
     [label setPosition:CGPointMake(screenSize.width / 2, screenSize.height - MENU_LABEL_OFFSET)];
     [self addChild:label];
	
	CCSprite *logoSprite = [CCSprite spriteWithFile:IMAGE_BLOCKDOT_LOGO];
     [logoSprite setPosition:CGPointMake(screenSize.width/2, label.boundingBox.origin.y - label.boundingBox.size.height - MENU_SPACING)];
     [self addChild:logoSprite z:1 tag:0];
	
	CCLabelTTF *thanksLabel = [CCLabelTTF labelWithString:TEXT_CREDITS_THANKS fontName:@"Helvetica" fontSize:MENU_LABEL_FONT_SIZE];
     [thanksLabel setPosition:CGPointMake(screenSize.width / 2, screenSize.height / 2)];
     [self addChild:thanksLabel];
	
	CCLabelTTF *plugLabel = [CCLabelTTF labelWithString:TEXT_CREDITS_PLUG 
									 dimensions:CGSizeMake(MENU_LABEL_WIDTH, MENU_LABEL_HEIGHT) 
									  alignment:UITextAlignmentCenter lineBreakMode:UILineBreakModeWordWrap 
									   fontName:@"Helvetica" fontSize:MENU_LABEL_FONT_SIZE];
     [plugLabel setPosition:CGPointMake(screenSize.width / 2, thanksLabel.boundingBox.origin.y - (MENU_LABEL_HEIGHT / 2) - MENU_SPACING)];
     [self addChild:plugLabel];
     
     CCMenuItemImage *visitWebButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_VISIT_WEB forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_VISIT_WEB forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(visitWeb)];
     [visitWebButton setPosition:ccp(0, 0)];
	
	CCMenuItemImage *visitFacebook = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_FACEBOOK forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_FACEBOOK forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(visitFacebook)];
     [visitFacebook setPosition:ccp(0, 0)];
	
	CCMenu *mainMenu = [CCMenu menuWithItems:visitWebButton, visitFacebook, nil];
	[mainMenu setPosition:ccp(screenSize.width/2, windowSize.height/2)];
	[mainMenu alignItemsHorizontallyWithPadding:MENU_PADDING];
	[self addChild:mainMenu];
	
}

- (void)addOverlayBox
{
     CGSize screenSize = [[CCDirector sharedDirector] winSize];
     
     CCSprite *menuInterior = [CCSprite spriteWithFile:IMAGE_MENU_INTERIOR_OVERLAY];
     [menuInterior setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
     [self addChild:menuInterior];
}

- (void)visitFacebook
{
	
}

- (void)visitWeb
{
	
}

- (void)doCloseButtonSelected
{
	[self.actionTarget performSelector:@selector(closeMenu:) withObject:self];
}

@end
