//
//  IntroLayer.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "IntroLayer.h"
#import "Constants.h"
#import "GameManager.h"

@implementation IntroLayer
@synthesize moviePlayer = _moviePlayer;

- (id)init
{
	self = [super init];
	
	if(self != nil)
	{
		// Register to receive a notification that the movie is now in memory and ready to play
		[[NSNotificationCenter defaultCenter] addObserver:self 
										 selector:@selector(moviePreloadDidFinish:) 
											name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification 
										   object:nil];
		
		// Register to receive a notification when the movie has finished playing. 
		[[NSNotificationCenter defaultCenter] addObserver:self 
										 selector:@selector(moviePlayBackDidFinish:) 
											name:MPMoviePlayerPlaybackDidFinishNotification 
										   object:nil];
		
		
		[self playMovie];
	}
	
	return self;
}

- (void)playMovie
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	NSString *moviePath = [[NSBundle mainBundle] pathForResource:MOVIE_LOADER ofType:@"mov"];
	NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
	// Initialize a movie player object with the specified URL
	self.moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];
	[self.moviePlayer.view setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
	[self.moviePlayer.moviePlayer setFullscreen:YES];
	[self.moviePlayer shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
	self.moviePlayer.moviePlayer.controlStyle = MPMovieControlStyleNone;
	self.moviePlayer.moviePlayer.view.backgroundColor = [UIColor whiteColor];
	
	[[[CCDirector sharedDirector] openGLView] addSubview:self.moviePlayer.moviePlayer.view];
	
	// Play the movie!
	[self.moviePlayer.moviePlayer play];
}

#pragma mark -
#pragma mark Movie Player
//  Notification called when the movie finished preloading.
- (void) moviePreloadDidFinish:(NSNotification*)notification
{
     /* 
	 < add your code here >
	 
	 MPMoviePlayerController* moviePlayerObj=[notification object];
	 etc.
	 */
}


//  Notification called when the movie finished playing.
- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self
					        name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
					      object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self
					        name:MPMoviePlayerPlaybackDidFinishNotification
					      object:nil];

	[self.moviePlayer.moviePlayer.view removeFromSuperview];
	[[GameManager sharedGameManager] runSceneWithID:Title];
}


@end
