//
//  PuzzlePickerMenuSprite.h
//  Dingbats_Cocos
//
//  Created by Jennifer Duffey on 9/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MenuSprite.h"

@class CCUIViewWrapper;
@interface PuzzlePickerMenuSprite : MenuSprite 
<UITableViewDelegate, UITableViewDataSource>
{

}
	
@property (nonatomic, strong) UITableView *puzzleTableView;
@property (nonatomic, strong) CCUIViewWrapper *tableViewWrapper;

@end
