//
//  IntroLayer.h
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "cocos2d.h"

@interface IntroLayer : CCLayer
{
	
}

@property (nonatomic, strong) MPMoviePlayerViewController *moviePlayer;

- (void)playMovie;

@end
