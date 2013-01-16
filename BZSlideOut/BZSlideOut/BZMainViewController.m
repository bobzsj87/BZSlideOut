//
//  BZMainViewController.m
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

#import "BZMainViewController.h"
#import "BZNavController.h"

#define kMoveLeftThreshold 
#define kMoveRightThreshold

@interface BZMainViewController ()

@end

@implementation BZMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    label.textAlignment = UITextAlignmentCenter;
    label.text = @"Move me";
    label.backgroundColor = [UIColor clearColor];    
    [self.view addSubview:label];

    UIBarButtonItem *leftItem = [[[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStyleBordered target:self action:@selector(leftSelected)] autorelease];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[[UIBarButtonItem alloc] initWithTitle:@"Right" style:UIBarButtonItemStyleBordered target:self action:@selector(rightSelected)] autorelease];
    self.navigationItem.rightBarButtonItem = rightItem;
    
//    UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)] autorelease];
//    [self.view addGestureRecognizer:tap];
}

#pragma mark bar item
- (void)leftSelected
{
    BZNavController *nav = (BZNavController *)self.navigationController;
    [nav moveOrResume:kMainFrameXWhenLeftIsShown];
}

- (void)rightSelected
{
    BZNavController *nav = (BZNavController *)self.navigationController;
    [nav moveOrResume:kMainFrameXWhenRightIsShown];
}
@end
