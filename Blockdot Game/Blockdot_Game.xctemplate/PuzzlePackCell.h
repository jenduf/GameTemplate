//
//  PuzzlePackCell.h
//  Dingbats_Cocos
//
//  Created by Jennifer Duffey on 8/31/11.
//  Copyright 2011 Blockdot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PuzzlePackCell : UITableViewCell
{

}

@property (nonatomic, strong) UILabel *gameName;
@property (nonatomic, strong) UILabel *gameDescription;
@property (nonatomic, strong) UILabel *gameStatus;
@property (nonatomic, strong) UIView *underButton;
@property (nonatomic, strong) UIView *customBackgroundView;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, assign) int whichOne;

- (void)setNameOfGame:(NSString *)aName;
- (void)setDescription:(NSString *)description;
- (void)setStatus:(NSString *)aStatus;
- (void)setButtonToTypePlayTag:(int)aTag target:(id)aTarget action:(SEL)anAction;
- (void)setButtonToTypePlayAgainTag:(int)aTag target:(id)aTarget action:(SEL)anAction;
- (void)setButtonToTypePurchaseTag:(int)aTag target:(id)aTarget action:(SEL)anAction;

@end
