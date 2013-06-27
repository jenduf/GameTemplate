//
//  MenuSprite.h
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MenuSprite : CCSprite 
{

}

@property (nonatomic, strong) id actionTarget;

- (id)initWithTarget:(id)target;
- (void)buildMenuBaseWithCloseTarget:(id)target;
- (void)createMenu;
- (void)addOverlayBox;
- (void)clean;

@end
