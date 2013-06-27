//
//  CCUIViewWrapper.h
//  Dingbats_Cocos
//
//  Created by Jennifer Duffey on 9/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CCUIViewWrapper : CCSprite 
{

}

@property (nonatomic, strong) UIView *uiViewWrapper;

+ (id)wrapperForView:(UIView *)ui;
- (id)initForUIView:(UIView *)ui;
- (void)updateViewTransform;

@end
