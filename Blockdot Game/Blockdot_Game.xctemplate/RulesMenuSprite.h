//
//  RulesSprite.h
//  Magneto2
//
//  Created by Jennifer Duffey on 9/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MenuSprite.h"

@class DTAttributedTextView, CCUIViewWrapper;
@interface RulesMenuSprite : MenuSprite 
{

}

@property (nonatomic, strong) DTAttributedTextView *rulesTextView;
@property (nonatomic, strong) CCUIViewWrapper *textViewWrapper;

@end
