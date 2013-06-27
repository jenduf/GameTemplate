//
//  TitleBackgroundSprite.m
//  BlockdotGame
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "TitleBackgroundSprite.h"
#import "Constants.h"

@implementation TitleBackgroundSprite


- (void)addOverlay
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];

	// overlay
	CCSprite *overlaySprite = [CCSprite spriteWithFile:IMAGE_TITLE_OVERLAY];
	[overlaySprite setPosition:ccp(screenSize.width/2, screenSize.height/2)];
	[self addChild:overlaySprite];
}


@end
