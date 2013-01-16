//
//  BZRootViewController.m
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
