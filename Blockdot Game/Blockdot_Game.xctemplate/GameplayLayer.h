//
//  GameplayLayer.h
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CCLabelFX;
@interface GameplayLayer : CCLayer 
{
     float accumulatedTime, currentTime;
	CCLabelFX *timerLabel;
}

- (void)createGameNavigation;
- (void)addGameClue;

@end
