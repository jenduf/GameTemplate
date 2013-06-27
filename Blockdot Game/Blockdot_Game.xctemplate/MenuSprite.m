//
//  MenuSprite.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "MenuSprite.h"
#import "Constants.h"
#import "Utils.h"

@implementation MenuSprite
@synthesize actionTarget = _actionTarget;

- (id)initWithTarget:(id)target
{
	self = [super initWithFile:IMAGE_MENU_BACKGROUND];
	
	if(self != nil)
	{
		[self buildMenuBaseWithCloseTarget:target];
		[self addOverlayBox];
		[self createMenu];
	}
	
	return self;
}

- (void)buildMenuBaseWithCloseTarget:(id)target
{
	self.actionTarget = target;
	     
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	     
	CCMenuItemImage *menuButton = [CCMenuItemImage itemFromNormalImage:[Utils getImageByName:MENU_BUTTON_CLOSE forState:kButtonStateUp] selectedImage:[Utils getImageByName:MENU_BUTTON_CLOSE forState:kButtonStateDown] disabledImage:nil target:self selector:@selector(doCloseButtonSelected)];
	[menuButton setPosition:CGPointMake(screenSize.width - menuButton.rect.size.width, screenSize.height - menuButton.rect.size.height)];
		
	CCMenu *mainMenu = [CCMenu menuWithItems:menuButton, nil];
	[mainMenu setPosition:CGPointZero];
	[self addChild:mainMenu];
}

- (void)addOverlayBox
{
     CGSize screenSize = [[CCDirector sharedDirector] winSize];
     
     CCSprite *menuInterior = [CCSprite spriteWithFile:IMAGE_MENU_INTERIOR_OVERLAY];
     [menuInterior setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
     [self addChild:menuInterior];
}

- (void)createMenu
{
     // Override
}

- (void)clean
{
	// Override
}


@end
