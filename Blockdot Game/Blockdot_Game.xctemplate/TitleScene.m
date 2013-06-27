//
//  TitleScene.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "TitleScene.h"
#import "TitleLayer.h"
#import "MenuLayer.h"

@implementation TitleScene

- (id)init
{
	self = [super init];
	
	if(self != nil)
	{
		// Title Layer
		TitleLayer *titleLayer = [TitleLayer node];
		[self addChild:titleLayer];
	}
	
	return self;
}

- (void)displayMenuType:(MenuType)menuType
{
     MenuLayer *menuLayer = [MenuLayer node];
     [menuLayer buildMenuForType:menuType];
     [self addChild:menuLayer];
}

@end
