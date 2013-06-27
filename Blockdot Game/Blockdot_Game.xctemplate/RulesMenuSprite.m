//
//  RulesSprite.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RulesMenuSprite.h"
#import "Constants.h"
#import "Utils.h"
#import "DTAttributedTextView.h"
#import "NSAttributedString+HTML.h"
#import "CCUIViewWrapper.h"

@implementation RulesMenuSprite
@synthesize rulesTextView = _rulesTextView;
@synthesize textViewWrapper = _textViewWrapper;

- (void)createMenu
{
	CGSize windowSize = CGSizeMake(MENU_INTERIOR_WIDTH, MENU_INTERIOR_HEIGHT);
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	NSString *readmePath = [[NSBundle mainBundle] pathForResource:FILENAME_RULES_HTML ofType:nil];
	NSString *html = [NSString stringWithContentsOfFile:readmePath encoding:NSUTF8StringEncoding error:NULL];
	NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
	
	CGSize maxImageSize = CGSizeMake(screenSize.width - MENU_SPACING, screenSize.height - MENU_SPACING);
	
	NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:1.0], NSTextSizeMultiplierDocumentOption, [NSValue valueWithCGSize:maxImageSize], DTMaxImageSize,
						@"Times New Roman", DTDefaultFontFamily,  @"purple", DTDefaultLinkColor, BASE_URL, NSBaseURLDocumentOption, nil]; 
	
	NSAttributedString *string = [[NSAttributedString alloc] initWithHTML:data options:options documentAttributes:NULL];
	
	CCLabelTTF *label = [CCLabelTTF labelWithString:TEXT_RULES_HEADER fontName:@"Helvetica-Bold" fontSize:MENU_TITLE_FONT_SIZE];
	
	[label setPosition:CGPointMake(screenSize.width / 2, screenSize.height - MENU_LABEL_OFFSET)];
	[self addChild:label];
	
	self.rulesTextView = [[DTAttributedTextView alloc] initWithFrame:CGRectMake(0, 0, windowSize.width - MENU_SPACING, windowSize.height - MENU_LABEL_HEIGHT - MENU_SPACING - MENU_PADDING)];
	self.rulesTextView.contentView.edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
	self.rulesTextView.attributedString = string;
	self.rulesTextView.backgroundColor = [UIColor clearColor];
	
	self.textViewWrapper = [CCUIViewWrapper wrapperForView:self.rulesTextView];
	self.textViewWrapper.contentSize = CGSizeMake(windowSize.width - MENU_SPACING, windowSize.height - MENU_LABEL_HEIGHT -  MENU_SPACING - MENU_PADDING);
	self.textViewWrapper.position = ccp(screenSize.width/2, MENU_CONTENT_Y);
	//[tableViewWrapper setRotation:90.0];
	[self addChild:self.textViewWrapper];
	
}

- (void)addOverlayBox
{
     CGSize screenSize = [[CCDirector sharedDirector] winSize];
     
     CCSprite *menuInterior = [CCSprite spriteWithFile:IMAGE_MENU_INTERIOR_OVERLAY];
     [menuInterior setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
     [self addChild:menuInterior];
}

- (void)doCloseButtonSelected
{
	[self.actionTarget performSelector:@selector(closeMenu:) withObject:self];
}

- (void)transform
{
	[self.textViewWrapper updateViewTransform];
	[super transform];
}

@end
