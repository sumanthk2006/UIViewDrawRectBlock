//
//  UIView+UIView_DrawRectBlock.m
//  UIViewAdditions
//
//  Created by Hans Sjunnesson on 1/5/12.
//  Copyright (c) 2012 Hans Sjunnesson
//	
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


#import "UIView+DrawRectBlock.h"


#pragma mark An internal wrapper class

@interface HSDrawRectBlockView : UIView {
@private
  __strong UIViewDrawRectBlock drawRectBlock_;
}

- (void)setDrawRectBlock:(UIViewDrawRectBlock)drawRectBlock;

@end


@implementation HSDrawRectBlockView	

- (void)setDrawRectBlock:(UIViewDrawRectBlock)drawRectBlock {
  drawRectBlock_ = [drawRectBlock copy];
}

- (void)drawRect:(CGRect)rect {
  if (drawRectBlock_)
    drawRectBlock_(rect);
}

@end


#pragma mark - Category with a class method to create a wrapper UIView with a draw rect block

@implementation UIView (UIView_DrawRectBlock)


// Creates and return a UIView (of frame CGRectZero) with a block that gets called on drawRect.
+ (UIView *)viewWithDrawRectBlock:(UIViewDrawRectBlock)block {
  return [self viewWithFrame:CGRectZero drawRectBlock:block];
}

// Creates and return a UIView with a block that gets called on drawRect.
+ (UIView *)viewWithFrame:(CGRect)frame drawRectBlock:(UIViewDrawRectBlock)block {
  HSDrawRectBlockView *view = [[HSDrawRectBlockView alloc] initWithFrame:frame];
  [view setDrawRectBlock:block];
  
  return view;
}

@end

