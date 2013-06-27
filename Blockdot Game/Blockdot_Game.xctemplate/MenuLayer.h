//
//  MenuLayer.h
//  BD
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"

@class MenuSprite, PuzzlePickerMenuSprite, PuzzlePackPickerMenuSprite;
@interface MenuLayer : CCLayer 
{

}

@property (nonatomic, strong) MenuSprite *menuSprite;
@property (nonatomic, strong) PuzzlePickerMenuSprite *puzzlePickerMenuSprite;
@property (nonatomic, strong) PuzzlePackPickerMenuSprite *puzzlePackPickerMenuSprite;

- (void)buildMenuForType:(MenuType)menuType;
- (void)showPuzzleMenu;

@end
