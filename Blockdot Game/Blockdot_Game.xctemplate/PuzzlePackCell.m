//
//  PuzzlePackCell.m
//  Dingbats_Cocos
//
//  Created by Jennifer Duffey on 8/31/11.
//  Copyright 2011 Blockdot. All rights reserved.
//

#import "PuzzlePackCell.h"
#import "Utils.h"
#import "Constants.h"

@implementation PuzzlePackCell
@synthesize gameName = _gameName;
@synthesize gameStatus = _gameStatus;
@synthesize underButton = _underButton;
@synthesize playButton = _playButton;
@synthesize gameDescription = _gameDescription;
@synthesize whichOne = _whichOne;
@synthesize customBackgroundView = _customBackgroundView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	if (self)
	{
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		
		self.customBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,MENU_PUZZLE_PACK_TABLE_WIDTH, MENU_PUZZLE_PACK_TABLE_ROW_HEIGHT)];
		self.customBackgroundView.backgroundColor = [UIColor blackColor];
		self.customBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		
		self.gameName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MENU_PUZZLE_PACK_LABEL_WIDTH, MENU_PUZZLE_PACK_LABEL_HEIGHT)];
		self.gameName.backgroundColor = [UIColor whiteColor];
		[self.customBackgroundView addSubview:self.gameName];
		
		self.gameDescription = [[UILabel alloc] initWithFrame:CGRectMake(0, MENU_PUZZLE_PACK_LABEL_HEIGHT, MENU_PUZZLE_PACK_LABEL_WIDTH, MENU_PUZZLE_PACK_LABEL_HEIGHT)];
		self.gameDescription.backgroundColor = [UIColor whiteColor];
		[self.customBackgroundView addSubview:self.gameDescription];
		
		self.gameStatus = [[UILabel alloc] initWithFrame:CGRectMake(MENU_PUZZLE_PACK_LABEL_WIDTH, 0, MENU_PUZZLE_PACK_TABLE_WIDTH / 4, MENU_PUZZLE_PACK_TABLE_ROW_HEIGHT)];
		self.gameStatus.backgroundColor = [UIColor whiteColor];
		self.gameStatus.textAlignment = UITextAlignmentCenter;
		[self.customBackgroundView addSubview:self.gameStatus];
		
		self.underButton = [[UIView alloc] initWithFrame:CGRectMake(MENU_PUZZLE_PACK_TABLE_WIDTH - MENU_PUZZLE_PACK_TABLE_WIDTH / 4, 0, MENU_PUZZLE_PACK_TABLE_WIDTH / 4, MENU_PUZZLE_PACK_TABLE_ROW_HEIGHT)];
		self.underButton.backgroundColor = [UIColor whiteColor];
		[self.customBackgroundView addSubview:self.underButton];
		
		self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
		self.playButton.frame = CGRectMake((_underButton.frame.size.width - MENU_PUZZLE_PACK_BUTTON_WIDTH)/2, (self.underButton.frame.size.height - MENU_PUZZLE_PACK_BUTTON_HEIGHT)/2, MENU_PUZZLE_PACK_BUTTON_WIDTH, MENU_PUZZLE_PACK_BUTTON_HEIGHT);
		
		[self.underButton addSubview:self.playButton];
		
		[self.contentView addSubview:self.customBackgroundView];
	}
	
	return self;
}

- (void)setDescription:(NSString *)description
{ 
	UIFont *font = [UIFont fontWithName:@"Helvetica" size:15.0];
	_gameDescription.font = font;
	_gameDescription.text = description;
	_gameDescription.textColor = [UIColor colorWithWhite:0.2 alpha:1.0];
}

- (void)setNameOfGame:(NSString *)aName 
{
	UIFont *font = [UIFont fontWithName:@"Helvetica" size:18.0];
	_gameName.font = font;
	_gameName.text = aName;
	_gameName.textColor = [UIColor colorWithWhite:0.2 alpha:1.0];
}

- (void)setStatus:(NSString *)aStatus
{
	UIFont *font = [UIFont fontWithName:@"Helvetica" size:18.0];
	_gameStatus.font = font;
	_gameStatus.text = aStatus;
	_gameStatus.textColor = [UIColor colorWithWhite:0.2 alpha:1.0];
}

- (void)setButtonToTypePlayTag:(int)aTag target:(id)aTarget action:(SEL)anAction 
{
	_whichOne = 0;
	_playButton.tag = aTag;
	
	[_playButton setImage:[UIImage imageNamed:[Utils getImageByName:MENU_BUTTON_PUZZLE_PLAY forState:kButtonStateUp]] forState:UIControlStateNormal];
	[_playButton setImage:[UIImage imageNamed:[Utils getImageByName:MENU_BUTTON_PUZZLE_PLAY forState:kButtonStateDown]] forState:UIControlStateHighlighted];
	[_playButton addTarget:aTarget action:anAction forControlEvents:UIControlEventTouchUpInside];
}

- (void)setButtonToTypePlayAgainTag:(int)aTag target:(id)aTarget action:(SEL)anAction 
{
	_whichOne = 1;
	_playButton.tag = aTag;
	
	[_playButton setImage:[UIImage imageNamed:[Utils getImageByName:MENU_BUTTON_PUZZLE_PLAY_AGAIN forState:kButtonStateUp]] forState:UIControlStateNormal];
	[_playButton setImage:[UIImage imageNamed:[Utils getImageByName:MENU_BUTTON_PUZZLE_PLAY_AGAIN forState:kButtonStateDown]] forState:UIControlStateHighlighted];
	[_playButton addTarget:aTarget action:anAction forControlEvents:UIControlEventTouchUpInside];
}

- (void)setButtonToTypePurchaseTag:(int)aTag target:(id)aTarget action:(SEL)anAction
{
	_whichOne = 0;
	_playButton.tag = aTag;
	
	[_playButton setImage:[UIImage imageNamed:[Utils getImageByName:MENU_BUTTON_PUZZLE_PURCHASE forState:kButtonStateUp]] forState:UIControlStateNormal];
	[_playButton setImage:[UIImage imageNamed:[Utils getImageByName:MENU_BUTTON_PUZZLE_PURCHASE forState:kButtonStateDown]] forState:UIControlStateHighlighted];
	[_playButton addTarget:aTarget action:anAction forControlEvents:UIControlEventTouchUpInside];
}

@end
