//
//  CCUIViewWrapper.m
//  Dingbats_Cocos
//
//  Created by Jennifer Duffey on 9/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CCUIViewWrapper.h"


@implementation CCUIViewWrapper
@synthesize uiViewWrapper = _uiViewWrapper;

+ (id)wrapperForView:(UIView *)ui
{
	return [[self alloc] initForUIView:ui];
}

- (id)initForUIView:(UIView *)ui
{
	self = [self init];
	
	if(self)
	{
		self.uiViewWrapper = ui;
	}
	
	return self;
}

- (void)updateViewTransform
{
	float thisAngle, pAngle;
	CGAffineTransform	transform = CGAffineTransformMakeTranslation(0, [[UIScreen mainScreen] bounds].size.height);
	
	for(CCNode *p = self; p != nil; p = p.parent)
	{
		thisAngle = CC_DEGREES_TO_RADIANS(p.rotation);
		
		if(!p.isRelativeAnchorPoint)
			transform = CGAffineTransformTranslate(transform, p.anchorPointInPoints.x, p.anchorPointInPoints.y);
		
		if(p.parent != nil)
		{
			pAngle = CC_DEGREES_TO_RADIANS(p.parent.rotation);
			
			transform = CGAffineTransformTranslate(transform,
										    (p.position.x * cosf(pAngle)) + (p.position.y * sinf(pAngle)),
										    (-p.position.y * cosf(pAngle)) + (p.position.x * sinf(pAngle)));
		}
		else
			transform = CGAffineTransformTranslate(transform, p.position.x, -p.position.y);
		
		transform = CGAffineTransformRotate(transform, thisAngle);
		transform = CGAffineTransformScale(transform, p.scaleX, p.scaleY);
		
		transform = CGAffineTransformTranslate(transform, -p.anchorPointInPoints.x, -p.anchorPointInPoints.y);
	}
	
	[self.uiViewWrapper setTransform:transform];
}

- (void)setParent:(CCNode *)parent
{
	if(parent == nil)
		[self.uiViewWrapper removeFromSuperview];
	else if(self.uiViewWrapper != nil)
		[[[CCDirector sharedDirector] openGLView] addSubview:self.uiViewWrapper];
	
	[super setParent:parent];
}

- (void)setVisible:(BOOL)v
{
	[super setVisible:v];
	[self.uiViewWrapper setHidden:!v];
}

- (void)setRotation:(float)protation
{
	[super setRotation:protation];
	[self updateViewTransform];
}

- (void)setScaleX:(float)sx
{
	[super setScaleX:sx];
	[self updateViewTransform];
}

- (void)setScaleY:(float)sy
{
	[super setScaleY:sy];
	[self updateViewTransform];
}

- (void)setOpacity:(GLubyte)opacity
{
	[self.uiViewWrapper setAlpha:opacity/255.0f];
	[super setOpacity:opacity];
}

- (void)setContentSize:(CGSize)size
{
	[super setContentSize:size];
	self.uiViewWrapper.frame	= CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
	self.uiViewWrapper.bounds = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
}

- (void)setAnchorPoint:(CGPoint)pnt
{
	[super setAnchorPoint:pnt];
	[self updateViewTransform];
}

- (void)setPosition:(CGPoint)pnt
{
	[super setPosition:pnt];
	[self updateViewTransform];
}

@end
