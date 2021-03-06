//
//  DTCoreTextFontCollection.m
//  CoreTextExtensions
//
//  Created by Oliver Drobnik on 5/23/11.
//  Copyright 2011 Drobnik.com. All rights reserved.
//

#import "DTCoreTextFontCollection.h"
#import "DTCoreTextFontDescriptor.h"

#import <CoreText/CoreText.h>

#ifndef DT_USE_THREAD_SAFE_INITIALIZATION
#ifndef DT_USE_THREAD_SAFE_INITIALIZATION_NOT_AVAILABLE
//#warning Thread safe initialization is not enabled.
#endif
#endif


@interface DTCoreTextFontCollection ()

@property (nonatomic, strong) NSArray *fontDescriptors;
@property (nonatomic, strong) DTCache *fontMatchCache;

@end

static DTCoreTextFontCollection *_availableFontsCollection = nil;


@implementation DTCoreTextFontCollection

+ (DTCoreTextFontCollection *)availableFontsCollection
{
#ifdef DT_USE_THREAD_SAFE_INITIALIZATION
	static dispatch_once_t predicate;
	dispatch_once(&predicate, ^{
		_availableFontsCollection = [[DTCoreTextFontCollection alloc] initWithAvailableFonts];
	});
#else
	if (!_availableFontsCollection)
	{
		_availableFontsCollection = [[DTCoreTextFontCollection alloc] initWithAvailableFonts];
	}
#endif
	
	return _availableFontsCollection;
}

- (id)initWithAvailableFonts
{
	self = [super init];
	
	if (self)
	{
		
	}
	
	return self;
}

- (DTCoreTextFontDescriptor *)matchingFontDescriptorForFontDescriptor:(DTCoreTextFontDescriptor *)descriptor
{
	DTCoreTextFontDescriptor *firstMatch = nil;
	NSNumber *cacheKey = [NSString stringWithFormat:@"fontFamily BEGINSWITH[cd] %@ and boldTrait == %d and italicTrait == %d", descriptor.fontFamily, descriptor.boldTrait, descriptor.italicTrait];
	
	// try cache
	firstMatch = [self.fontMatchCache objectForKey:cacheKey];
	
	if (firstMatch)
	{
		DTCoreTextFontDescriptor *retMatch = [firstMatch copy];
		retMatch.pointSize = descriptor.pointSize;
		return retMatch;
	}
	
	// need to search
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"fontFamily BEGINSWITH[cd] %@ and boldTrait == %d and italicTrait == %d", descriptor.fontFamily, descriptor.boldTrait, descriptor.italicTrait];
	
	NSArray *matchingDescriptors = [self.fontDescriptors filteredArrayUsingPredicate:predicate];
	
	//NSLog(@"%@", matchingDescriptors);
	
	if ([matchingDescriptors count])
	{
		firstMatch = [matchingDescriptors objectAtIndex:0];
		[self.fontMatchCache setObject:firstMatch forKey:cacheKey];
		
		DTCoreTextFontDescriptor *retMatch = [firstMatch copy];
		
		retMatch.pointSize = descriptor.pointSize;
		return retMatch;
	}
	
	return nil;
}

#pragma mark Properties

- (NSArray *)fontDescriptors
{
	if (!_fontDescriptors)
	{
		// try caches
		
		NSString *cachesPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"FontDescriptors.cache"];
		
		self.fontDescriptors = nil;//[NSKeyedUnarchiver unarchiveObjectWithFile:cachesPath];
		
		if (!_fontDescriptors)
		{
			CTFontCollectionRef fonts = CTFontCollectionCreateFromAvailableFonts(NULL);
			
			CFArrayRef matchingFonts = CTFontCollectionCreateMatchingFontDescriptors(fonts);
			
			if (matchingFonts)
			{
				
				// convert all to our objects
				NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
				
				for (NSInteger i=0; i<CFArrayGetCount(matchingFonts); i++)
				{
					CTFontDescriptorRef fontDesc = CFArrayGetValueAtIndex(matchingFonts, i);
					
					
					DTCoreTextFontDescriptor *desc = [[DTCoreTextFontDescriptor alloc] initWithCTFontDescriptor:fontDesc];
					[tmpArray addObject:desc];
				}
				
				
				CFRelease(matchingFonts);
				
				self.fontDescriptors = tmpArray;
			}
		}
		
		// cache that
		[NSKeyedArchiver archiveRootObject:self.fontDescriptors toFile:cachesPath];
	}
	
	return _fontDescriptors;
}

- (DTCache *)fontMatchCache
{
	if (!fontMatchCache)
	{
		fontMatchCache = [[DTCache alloc] init];
	}
	
	return fontMatchCache;
}

- (NSArray *)fontFamilyNames
{
	NSMutableArray *tmpArray = [NSMutableArray array];
	
	for (DTCoreTextFontDescriptor *oneDescriptor in [self fontDescriptors])
	{
		NSString *familyName = oneDescriptor.fontFamily;
		
		if (![tmpArray containsObject:familyName])
		{
			[tmpArray addObject:familyName];
		}
	}
	
	return [tmpArray sortedArrayUsingSelector:@selector(compare:)];
}

@synthesize fontDescriptors = _fontDescriptors;
@synthesize fontMatchCache;

@end
