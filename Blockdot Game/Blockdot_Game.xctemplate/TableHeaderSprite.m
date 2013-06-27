//
//  TableHeaderSprite.m
//  Dingbats_Cocos
//
//  Created by Jennifer Duffey on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableHeaderSprite.h"
#import "Constants.h"

@implementation TableHeaderSprite

- (void)addTextForFirstColumn:(NSString *)column1 andSecond:(NSString *)column2
{
	CCLabelTTF *label = [CCLabelTTF labelWithString:column1 fontName:@"Helvetica-Bold" fontSize:20.0];
     [label setPosition:CGPointMake(self.textureRect.origin.x + label.textureRect.size.width/2 + MENU_PADDING, self.textureRect.size.height/2)];
     [self addChild:label];
	
	CCLabelTTF *label2 = [CCLabelTTF labelWithString:column2 fontName:@"Helvetica-Bold" fontSize:20.0];
     [label2 setPosition:CGPointMake(self.textureRect.size.width/2, self.textureRect.size.height/2)];
     [self addChild:label2];
}

@end
