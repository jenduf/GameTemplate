//
//  DTLazyImageView.h
//  PagingTextScroller
//
//  Created by Oliver Drobnik on 5/20/11.
//  Copyright 2011 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImageIO/ImageIO.h>

@class DTLazyImageView;

@protocol DTLazyImageViewDelegate <NSObject>
@optional
- (void)lazyImageView:(DTLazyImageView *)lazyImageView didChangeImageSize:(CGSize)size;
@end

@interface DTLazyImageView : UIImageView 
{
	NSURL *_url;
	
	NSURLConnection *_connection;
	NSMutableData *_receivedData;

	/* For progressive download */
	CGImageSourceRef _imageSource;
	CGFloat _fullHeight;
	CGFloat _fullWidth;
	NSUInteger _expectedSize;
    
    BOOL shouldShowProgressiveDownload;

}

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, assign) BOOL shouldShowProgressiveDownload;

@property (nonatomic, unsafe_unretained) id<DTLazyImageViewDelegate> delegate;

- (void)cancelLoading;

@end
