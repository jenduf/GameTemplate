//
//  IntroScene.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "IntroScene.h"
#import "IntroLayer.h"

@implementation IntroScene

- (id)init
{
	self = [super init];
	
	if(self != nil)
	{
		// Intro Layer
		IntroLayer *introLayer = [IntroLayer node];
		[self addChild:introLayer];
	}
	
	return self;
}

@end
