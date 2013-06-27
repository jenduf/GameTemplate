//
//  WebSprite.h
//  Magneto2
//
//  Created by Jennifer Duffey on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CCUIViewWrapper;
@interface WebSprite : CCSprite 
<UINavigationBarDelegate>
{

}

@property (nonatomic, strong) UIView *spriteWebView;
@property (nonatomic, strong) CCUIViewWrapper *webViewWrapper;
@property (nonatomic, strong) id actionTarget;

- (id)initWithTarget:(id)target forURL:(NSString *)url;
- (void)buildViewWithURL:(NSString *)url;

@end
