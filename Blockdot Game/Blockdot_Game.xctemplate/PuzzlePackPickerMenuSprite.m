//
//  PuzzlePackPickerSprite.m
//  Dingbats_Cocos
//
//  Created by Jennifer Duffey on 8/31/11.
//  Copyright 2011 Blockdot. All rights reserved.
//

#import "PuzzlePackPickerMenuSprite.h"
#import "Utils.h"
#import "Constants.h"
#import "PuzzlePackCell.h"
#import "TableHeaderSprite.h"
#import "CCUIViewWrapper.h"

@implementation PuzzlePackPickerMenuSprite
@synthesize puzzlePackTableView = _puzzlePackTableView;
@synthesize tableViewWrapper = _tableViewWrapper;

- (void)createMenu
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
     
	CCLabelTTF *label = [CCLabelTTF labelWithString:TEXT_PUZZLE_PACK_HEADER fontName:@"Helvetica-Bold" fontSize:MENU_PUZZLE_PACK_TITLE_FONT_SIZE];
	[label setPosition:CGPointMake(screenSize.width / 2, screenSize.height - MENU_PUZZLE_PACK_LABEL_OFFSET)];
	[self addChild:label];
	
	self.puzzlePackTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MENU_PUZZLE_PACK_TABLE_WIDTH, MENU_PUZZLE_PACK_TABLE_HEIGHT) style:UITableViewStylePlain];
	self.puzzlePackTableView.delegate = self;
	self.puzzlePackTableView.dataSource = self;
	self.puzzlePackTableView.separatorColor = [UIColor blackColor];
	self.puzzlePackTableView.rowHeight = MENU_PUZZLE_PACK_TABLE_ROW_HEIGHT;
  //   [self addChild:puzzlePackTableView];
	//[[[CCDirector sharedDirector] openGLView] addSubview:puzzlePackTableView];
	self.tableViewWrapper = [CCUIViewWrapper wrapperForView:self.puzzlePackTableView];
	self.tableViewWrapper.contentSize = CGSizeMake(MENU_PUZZLE_PACK_TABLE_WIDTH, MENU_PUZZLE_PACK_TABLE_HEIGHT);
	self.tableViewWrapper.position = ccp(screenSize.width/2, MENU_CONTENT_Y);
	//[tableViewWrapper setRotation:90.0];
	[self addChild:self.tableViewWrapper];
	[self.puzzlePackTableView reloadData];
     
}

- (void)clean
{
	[super clean];
	
	[self removeChild:self.tableViewWrapper cleanup:YES];
}

- (void)addOverlayBox
{
     CGSize screenSize = [[CCDirector sharedDirector] winSize];
     
     CCSprite *menuInterior = [CCSprite spriteWithFile:IMAGE_MENU_PUZZLE_INTERIOR_OVERLAY];
     [menuInterior setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
     [self addChild:menuInterior];
     
     TableHeaderSprite *tableHeaderSprite = [[TableHeaderSprite alloc] initWithFile:IMAGE_TABLE_HEADER];
	[tableHeaderSprite addTextForFirstColumn:TEXT_PUZZLE_PACK_PUZZLE_PACKS andSecond:TEXT_PUZZLE_PACK_STATUS];
     [tableHeaderSprite setPosition:CGPointMake(screenSize.width/2, menuInterior.textureRect.origin.y + menuInterior.textureRect.size.height + tableHeaderSprite.textureRect.size.height + (MENU_PADDING * 2))];
     [self addChild:tableHeaderSprite z:1 tag:0];
}

- (void)doCloseButtonSelected
{
	[self.actionTarget performSelector:@selector(closeMenu:) withObject:self];
}

- (void)doPlayButtonSelected:(id)sender
{
	[self.actionTarget performSelector:@selector(play:) withObject:self];
}

- (void)transform
{
	[self.tableViewWrapper updateViewTransform];
	[super transform];
}

#pragma mark -
#pragma mark TableView DataSource and Delegate Methods
// Tells the data source to return the number of rows in a given section of a table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	static NSString *CellIdentifier = @"PuzzlePackCell";
	
	PuzzlePackCell *cell = (PuzzlePackCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) 
	{
		cell = [[PuzzlePackCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	
	NSString *name = [NSString stringWithFormat:@"  Puzzle Pack %i", indexPath.row + 1];
	
	[cell setNameOfGame:name];
	[cell setButtonToTypePlayTag:indexPath.row target:self action:@selector(doPlayButtonSelected:)];
	
	return cell;
}


- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//[_target performSelector:_action withObject:[NSNumber numberWithInt:indexPath.row] afterDelay:0.0];
	return nil;
}

@end
