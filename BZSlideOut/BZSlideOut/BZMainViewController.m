//
//  BZMainViewController.m
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
