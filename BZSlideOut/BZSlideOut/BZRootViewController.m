//
//  BZRootViewController.m
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

#import "BZRootViewController.h"
#import "BZMainViewController.h"
#import "BZLeftViewController.h"
#import "BZRightViewController.h"
#import "BZNavController.h"

@interface BZRootViewController ()

@end

@implementation BZRootViewController

- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mainVC = [[[BZMainViewController alloc] init] autorelease];
    navController = [[[BZNavController alloc] initWithRootViewController:mainVC] autorelease];
    
    leftVC = [[[BZLeftViewController alloc] init] autorelease];
    rightVC = [[[BZRightViewController alloc] init] autorelease];
    
    // important to be full screen, otherwise, it will leave a 20pt blank at the top
    leftVC.wantsFullScreenLayout = YES;
    rightVC.wantsFullScreenLayout = YES;
    
    [self addChildViewController:navController];
    [self addChildViewController:leftVC];
    [self addChildViewController:rightVC];
    
    
    
    [self.view addSubview:leftVC.view];
    [self.view addSubview:rightVC.view];
    [self.view addSubview:navController.view];
    navController.rootVC = self;
}

- (void)bringToFront:(BOOL)isLeft
{
    leftVC.view.hidden = !isLeft;
    rightVC.view.hidden = !leftVC.view.hidden;
}

@end
