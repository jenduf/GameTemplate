//
//  GameScene.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "GameScene.h"
#import "GameplayLayer.h"

@implementation GameScene

- (id)init
{
	self = [super init];
	
	if(self != nil)
	{
		// Gameplay Layer
		GameplayLayer *gamePlayLayer = [GameplayLayer node];
		[self addChild:gamePlayLayer];
	}
	
	return self;
}

@end
