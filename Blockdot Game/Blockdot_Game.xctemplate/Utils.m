//
//  Utils.m
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "Utils.h"
#import "Constants.h"

@implementation Utils

+ (NSArray *)arrayFromFloats:(float *)floats
{
     NSMutableArray *arr = [NSMutableArray arrayWithCapacity:FLOAT_COUNT];
     
     for(int i = 0; i < FLOAT_COUNT; i++)
     {
          [arr addObject:[NSNumber numberWithFloat:floats[i]]];
     }
     
     return (NSArray *)arr;
}

+ (NSString *)getImageByName:(NSString *)name forState:(int)state
{
	NSMutableString *returnName = [NSMutableString stringWithString:name];
	
	switch (state) 
	{
		case kButtonStateUp:
			[returnName appendString:@"_Up.png"];
			break;
			
		case kButtonStateDown:
			[returnName appendString:@"_Down.png"];
			break;
			
		default:
			break;
	}
	
	return returnName;
}

@end
