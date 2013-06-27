//
//  Constants.h
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

// Flurry Events
#define FLURRY_API_KEY		@"REP1EJUPWFQNHRKUYQPT"	

// Game Name
#define GAME_NAME			@"Magneto"

// URLs
#define GET_MORE_GAMES_URL  @"http://www.blockdot.com/mobile"
#define VISIT_OUR_SITE_URL  @"http://m.blockdot.com/"
#define FAN_PAGE_URL @"http://www.facebook.com/#!/Blockdot"
#define ADVERTISEMENT_URL @"http://www.blockdot.com/mobile/mobileadservice.aspx?gameID=437&platformID=3&version=1&sizeID=3&orientationID=2"

// Fonts
#define FONT_HELVETICA			@"Helvetica"
#define FONT_HELVETICA_BOLD		@"Helvetica-Bold"

// Game Transition Style
#define GAME_TRANSITION_STYLE     0

// sprite image names

/** 
 * TITLE
 **/

// layout
#define APP_WIDTH				1024
#define APP_HEIGHT				768
#define NAV_BAR_HEIGHT			44
#define SCREEN_TOP_POSITION		-140



// Default Image
#define IMAGE_DEFAULT		@"Default-Landscape~ipad.png"

// background
#define IMAGE_TITLE_BACKGROUND     @"Background.jpg"
#define IMAGE_TITLE_OVERLAY        @"Title_Overlay.png"

// button names
#define TITLE_BUTTON_MENU			@"Title_Menu"
#define TITLE_BUTTON_PLAY			@"Title_Play"
#define TITLE_BUTTON_STATS			@"Title_Stats"

// button states
#define kButtonStateUp	0
#define kButtonStateDown	1


// TITLE 

// layout
#define TITLE_Y						222

#define FLOAT_COUNT 11

/** 
 * MENU
 **/

// background
#define IMAGE_MENU_BACKGROUND           @"Menu_Background.png"
#define IMAGE_MENU_INTERIOR_OVERLAY     @"Menu_InteriorOverlay.png"
#define IMAGE_MENU_HRULE                @"Menu_HRule.png"
#define IMAGE_TABLE_HEADER              @"Table_Header.png"

// button names
#define MENU_BUTTON_ACHIEVEMENTS		@"Menu_Achievements"
#define MENU_BUTTON_CHALLENGE			@"Menu_ChallengeAFriend"
#define MENU_BUTTON_CLOSE			@"Menu_Close"
#define MENU_BUTTON_CREDITS			@"Menu_Credits"
#define MENU_BUTTON_FAN_PAGE			@"Menu_Fan_Page"
#define MENU_BUTTON_GAMES			@"Menu_Get_More_Games"
#define MENU_BUTTON_HIGH_SCORES		@"Menu_HighScores"
#define MENU_BUTTON_RULES			@"Menu_Rules"
#define MENU_BUTTON_SOCIAL			@"Menu_Social"
#define MENU_BUTTON_START			@"Menu_Start"
#define MENU_BUTTON_PUZZLE_PLAY		@"Menu_Puzzle_Play"
#define MENU_BUTTON_PUZZLE_PLAY_AGAIN	@"Menu_Puzzle_Play_Again"
#define MENU_BUTTON_PUZZLE_PURCHASE	@"Menu_Puzzle_Purchase"

// button tags
#define kNavMenuTagValue			99
#define kTitleMenuTagValue		98

// MENU Layout
#define MENU_BACKGROUND_WIDTH                974
#define MENU_BACKGROUND_HEIGHT               712
#define MENU_PADDING					8.0
#define MENU_SPACING					30.0
#define MENU_INTERIOR_WIDTH				735
#define MENU_INTERIOR_HEIGHT				445
#define MENU_CONTENT_Y					-110
#define MENU_LABEL_WIDTH					430
#define MENU_LABEL_HEIGHT				75
#define MENU_LABEL_OFFSET				190.0f
#define MENU_PUZZLE_PACK_LABEL_OFFSET		180
#define MENU_PUZZLE_PACK_TABLE_WIDTH		795
#define MENU_PUZZLE_PACK_TABLE_HEIGHT		346
#define MENU_PUZZLE_PACK_TABLE_ROW_HEIGHT	57
#define MENU_PUZZLE_PACK_LABEL_WIDTH		510
#define MENU_PUZZLE_PACK_LABEL_HEIGHT		31
#define MENU_PUZZLE_PACK_BUTTON_WIDTH		115
#define MENU_PUZZLE_PACK_BUTTON_HEIGHT		34
#define MENU_PUZZLE_PACK_BUTTON_SHADOW_WIDTH	131

// Menu Font
#define MENU_TITLE_FONT_SIZE				36.0
#define MENU_LABEL_FONT_SIZE				18.0
#define MENU_SMALL_TEXT_FONT_SIZE			14.0
#define MENU_PUZZLE_PACK_TITLE_FONT_SIZE	28.0


// PUZZLE PICKER
// Text
#define TEXT_PUZZLE_PACK_HEADER			@"Pick A Puzzle Pack"
#define TEXT_PUZZLE_PACK_PUZZLE_PACKS		@"Puzzle Packs"
#define TEXT_PUZZLES					@"Puzzles"
#define TEXT_PUZZLE_PACK_STATUS			@"Status"
#define TEXT_PUZZLE_HEADER				@"Pick A Puzzle"

// Images
#define IMAGE_MENU_PUZZLE_INTERIOR_OVERLAY	@"Menu_Puzzle_Interior_Overlay.png"

// CREDITS
// Text
#define TEXT_CREDITS_HEADER				@"Credits"
#define TEXT_CREDITS_THANKS				@"Thanks for playing, we hope you enjoyed the game."
#define TEXT_CREDITS_PLUG				@"Be sure to check out our site or 'Like Us' on Facebook to receive updates to our newest releases."

// Buttons
#define MENU_BUTTON_VISIT_WEB				@"Menu_VisitWebSite"
#define MENU_BUTTON_FACEBOOK				@"Menu_VisitFacebook"

// Images
#define IMAGE_BLOCKDOT_LOGO				@"Blockdot_Logo.png"

// RULES
// Text 
#define TEXT_RULES_HEADER				@"Rules"

// Files
#define FILENAME_RULES_HTML				@"Rules.html"
#define BASE_URL						@"Rules"

// SOCIAL
// Text
#define TEXT_SOCIAL_HEADER				@"Connect With Social"
#define TEXT_FACEBOOK_CONNECT				@"Connect and play along with your friends through Facebook."
#define TEXT_GAMECENTER_CONNECT			@"Compete with other Apple Game Center players, earn achievements and track your ranking on the scoreboards."

// Buttons
#define MENU_BUTTON_CONNECT_FACEBOOK		@"Menu_Facebook_Connect"
#define MENU_BUTTON_CONNECT_GAMECENTER		@"Menu_GameCenter"

// Images
#define IMAGE_FACEBOOK_LOGO				@"Logo_Facebook.png"
#define IMAGE_GAMECENTER_LOGO				@"Logo_GameCenter.png"

/** 
 * GAME
 **/

#define kTimerThreshold			1.0

// Layout
#define GAME_NAV_WIDTH			300
#define GAME_NAV_HEIGHT			70
#define GAME_TIMER_LABEL_X		130

// Images
#define IMAGE_GAME_BACKGROUND      @"Background.jpg"
#define IMAGE_GAME_BOARD           @"Game_Board.png"
#define IMAGE_GAME_LOGO            @"Game_Logo.png"
#define IMAGE_GAME_HUD             @"Game_HUD.png"
#define IMAGE_GAME_TIMER			@"Game_Timer.png"

// Buttons
#define BUTTON_GAME_MENU			@"Title_Menu"
#define BUTTON_GAME_MUTE			@"Game_Mute"

// Text
#define TEXT_TIMER_START			@"4:00"
#define TEXT_CLUE				@"Hit CBS Show for Nerds"

// Game Font
#define GAME_TIMER_FONT_SIZE		28.0
#define GAME_CLUE_FONT_SIZE		40.0

// Movies
#define MOVIE_LOADER			@"blockdot_animated"

// Sound Effects
#define SOUND_BUTTON_CLICK		@"sfx_buttonClick.wav"
#define MUSIC_GAME				@"mzk_gameMusic.wav"

// Sound Effect Keys
#define SOUND_BUTTON_CLICK_KEY	@"buttonClick"
#define MUSIC_GAME_KEY			@"gameMusic"

#define AUDIO_MAX_WAITTIME	150

typedef enum
{
	kAudioManagerUninitialized=0,
	kAudioManagerFailed=1,
	kAudioManagerInitializing=2,
	kAudioManagerInitialized=100,
	kAudioManagerLoading=200,
	kAudioManagerReady=300
} SceneManagerSoundState;

#define PLAYSOUNDEFFECT(...)\
[[GameManager sharedGameManager] playSoundEffect:@#__VA_ARGS__]

#define STOPSOUNDEFFECT(...)\
[[GameManager sharedGameManager] stopSoundEffect:__VA_ARGS__]

typedef enum 
{
     Intro = 0,
	Title = 1,
	Menu = 2,
	Game = 3
} SceneType;

typedef enum 
{
	MainMenu = 1,
	PuzzlePackMenu = 3,
	PuzzleMenu = 2,
	OverlayMenu = 4,
	PuzzlePackOverlayMenu = 5,
     StatsMenu = 0
} MenuType;

typedef enum
{
	LeftRight = 0,
	TopBottom = 1
} GameTransitionStyle;
