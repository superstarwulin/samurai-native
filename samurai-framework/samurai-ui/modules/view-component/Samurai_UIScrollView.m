//
//     ____    _                        __     _      _____
//    / ___\  /_\     /\/\    /\ /\    /__\   /_\     \_   \
//    \ \    //_\\   /    \  / / \ \  / \//  //_\\     / /\/
//  /\_\ \  /  _  \ / /\/\ \ \ \_/ / / _  \ /  _  \ /\/ /_
//  \____/  \_/ \_/ \/    \/  \___/  \/ \_/ \_/ \_/ \____/
//
//	Copyright Samurai development team and other contributors
//
//	http://www.samurai-framework.com
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "Samurai_UIScrollView.h"

#import "_pragma_push.h"

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "Samurai_Metric.h"

// ----------------------------------
// Source code
// ----------------------------------

#pragma mark -

@implementation UIScrollView(Samurai)

+ (id)createInstanceWithRenderer:(SamuraiRenderObject *)renderer identifier:(NSString *)identifier
{
	return [super createInstanceWithRenderer:renderer identifier:identifier];
}

#pragma mark -

- (id)serialize
{
	return nil;
}

- (void)unserialize:(id)obj
{
}

- (void)zerolize
{
}

#pragma mark -

- (void)applyFrame:(CGRect)frame
{
	[super applyFrame:frame];
	
	CGSize contentSize = frame.size;
	
	for ( UIView * subview in self.subviews )
	{
		if ( subview.renderer )
		{
			if ( CGRectGetMaxX(subview.frame) > contentSize.width )
			{
				contentSize.width = CGRectGetMaxX(subview.frame);
			}
			
			if ( CGRectGetMaxY(subview.frame) > contentSize.height )
			{
				contentSize.height = CGRectGetMaxY(subview.frame);
			}
		}
	}
	
	if ( contentSize.width > self.frame.size.width && contentSize.height > self.frame.size.height )
	{
		self.alwaysBounceVertical = YES;
		self.showsVerticalScrollIndicator = YES;
		
		self.alwaysBounceHorizontal = YES;
		self.showsHorizontalScrollIndicator = YES;
		
		self.bounces = YES;
		self.scrollEnabled = YES;
	}
	else if ( contentSize.width <= self.frame.size.width && contentSize.height <= self.frame.size.height )
	{
		self.alwaysBounceVertical = YES;
		self.showsVerticalScrollIndicator = YES;
		
		self.alwaysBounceHorizontal = NO;
		self.showsHorizontalScrollIndicator = NO;
		
		self.bounces = YES;
		self.scrollEnabled = YES;
	}
	else if ( contentSize.width > self.frame.size.width && contentSize.height <= self.frame.size.height )
	{
		self.alwaysBounceVertical = NO;
		self.showsVerticalScrollIndicator = NO;
		
		self.alwaysBounceHorizontal = YES;
		self.showsHorizontalScrollIndicator = YES;
		
		self.bounces = YES;
		self.scrollEnabled = YES;
	}
	else if ( contentSize.width <= self.frame.size.width && contentSize.height > self.frame.size.height )
	{
		self.alwaysBounceVertical = YES;
		self.showsVerticalScrollIndicator = YES;
		
		self.alwaysBounceHorizontal = NO;
		self.showsHorizontalScrollIndicator = NO;
		
		self.bounces = YES;
		self.scrollEnabled = YES;
	}
	else
	{
		self.alwaysBounceVertical = YES;
		self.showsVerticalScrollIndicator = YES;
		
		self.alwaysBounceHorizontal = NO;
		self.showsHorizontalScrollIndicator = NO;
		
		self.bounces = YES;
		self.scrollEnabled = YES;
	}
	
	self.contentSize = contentSize;
}

#pragma mark -

- (CGSize)computeSizeBySize:(CGSize)size
{
	return [super computeSizeBySize:size];
}

- (CGSize)computeSizeByWidth:(CGFloat)width
{
	return [super computeSizeByWidth:width];
}

- (CGSize)computeSizeByHeight:(CGFloat)height
{
	return [super computeSizeByHeight:height];
}

@end

// ----------------------------------
// Unit test
// ----------------------------------

#pragma mark -

#if __SAMURAI_TESTING__

TEST_CASE( UI, UIScrollView )
{
}
TEST_CASE_END

#endif	// #if __SAMURAI_TESTING__

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "_pragma_pop.h"
