//
//  BZNavController.m
//  BZSlideOut
//
// Copyright 2013, Bob Shijun Zhou
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
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
