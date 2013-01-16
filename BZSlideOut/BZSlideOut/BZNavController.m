//
//  BZNavController.m
//  BZSlideOut
//
//  MIT License
//
//	Copyright (c) 2013 Bob Shijun Zhou
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

#import "BZNavController.h"
#import "BZRootViewController.h"

@interface BZNavController ()

@end

@implementation BZNavController
@synthesize rootVC;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    originX = [touch locationInView:self.rootVC.view].x;
    originFrame = self.view.frame;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    float deltaX = originX - [touch locationInView:self.rootVC.view].x;
    runningFrame = originFrame;
    runningFrame.origin.x -= deltaX;
    
    self.view.frame = runningFrame;
    [rootVC bringToFront:(runningFrame.origin.x >0)];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self moveViewFrom:self.view.frame.origin.x];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self moveViewFrom:self.view.frame.origin.x];
}


- (void)moveViewFrom:(float)x
{
    CGRect frame = self.view.frame;
    if (x < kMainFrameXWhenRightToShow){
        frame.origin.x = kMainFrameXWhenRightIsShown;
    }
    else if (x > kMainFrameXWhenLeftToShow){
        frame.origin.x = kMainFrameXWhenLeftIsShown;
    }
    else
        frame.origin.x = 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = frame;
    }];
}

- (void)moveOrResume:(float)x
{
    if (self.view.frame.origin.x == x)
        x = 0;
    [self moveViewFrom:x];
    if (x == kMainFrameXWhenLeftIsShown){
        [rootVC bringToFront:YES];
    }
    else if (x == kMainFrameXWhenRightIsShown){
        [rootVC bringToFront:NO];
    }
}

@end
