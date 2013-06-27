//
//  PuzzlePackPickerSprite.h
//  Dingbats_Cocos
//
//  Created by Jennifer Duffey on 8/31/11.
//  Copyright 2011 Blockdot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MenuSprite.h"

@class CCUIViewWrapper;
@interface PuzzlePackPickerMenuSprite : MenuSprite 
<UITableViewDelegate, UITableViewDataSource>
{

}

@property (nonatomic, strong) UITableView *puzzlePackTableView;
@property (nonatomic, strong) CCUIViewWrapper *tableViewWrapper;

@end
