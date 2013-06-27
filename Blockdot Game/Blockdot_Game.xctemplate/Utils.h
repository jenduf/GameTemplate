//
//  Utils.h
//  Magneto2
//
//  Created by Jennifer Duffey on 9/21/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (NSString *)getImageByName:(NSString *)name forState:(int)state;
+ (NSArray *)arrayFromFloats:(float *)floats;

@end
