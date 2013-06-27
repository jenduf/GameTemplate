//
//  WebSprite.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WebSprite.h"
#import "CCUIViewWrapper.h"
#import "Constants.h"
#import "GameManager.h"

@implementation WebSprite
@synthesize spriteWebView = _spriteWebView;
@synthesize webViewWrapper = _webViewWrapper;
@synthesize actionTarget = _actionTarget;

- (id)initWithTarget:(id)target forURL:(NSString *)url
{
	self = [super initWithFile:IMAGE_DEFAULT];
	
	if(self != nil)
	{
		self.actionTarget = target;
		self.spriteWebView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT)];
		[self buildViewWithURL:url];
	}
	
	return self;
}

- (void)buildViewWithURL:(NSString *)url
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	
	self.spriteWebView.backgroundColor = [UIColor clearColor];
	
	UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, NAV_BAR_HEIGHT)];
	[navBar setTintColor:[UIColor blackColor]];
	navBar.delegate = self;
	[self.spriteWebView addSubview:navBar];
	
	UINavigationItem *backItem = [[UINavigationItem alloc] initWithTitle:@"Back"];
	[navBar pushNavigationItem:backItem animated:NO];
	
	NSString *webTitle = [NSString stringWithFormat:@"%@ Web", GAME_NAME];
	UINavigationItem *titleItem = [[UINavigationItem alloc] initWithTitle:webTitle];
	[navBar pushNavigationItem:titleItem animated:NO];
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(113, 60, 804, 45)];
	label.backgroundColor = [UIColor clearColor];
	label.font = [UIFont fontWithName:@"Helvetica-Bold" size:36.0];
	label.minimumFontSize = 40.0;
	label.text = webTitle;
	label.textColor = [UIColor whiteColor];
	label.textAlignment = UITextAlignmentCenter;
	[self.spriteWebView addSubview:label];
	
	UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, navBar.bounds.origin.y + NAV_BAR_HEIGHT, APP_WIDTH, APP_HEIGHT - NAV_BAR_HEIGHT)];
	webView.backgroundColor = [UIColor whiteColor];
	webView.opaque = NO;
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
	[self.spriteWebView addSubview:webView];
	
	self.webViewWrapper = [CCUIViewWrapper wrapperForView:self.spriteWebView];
	self.webViewWrapper.contentSize = CGSizeMake(APP_WIDTH, APP_HEIGHT);
	[self.webViewWrapper setPosition:ccp(screenSize.width/2, SCREEN_TOP_POSITION)];
	
	[self addChild:self.webViewWrapper];
}

- (void)transform
{
	[self.webViewWrapper updateViewTransform];
	[super transform];
}

#pragma mark -
#pragma mark UINavigationBar Delegate Methods
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
	[[GameManager sharedGameManager] playSoundEffect:SOUND_BUTTON_CLICK_KEY];
	[self.actionTarget performSelector:@selector(closeMenu:) withObject:self];
	return NO;
}

@end
