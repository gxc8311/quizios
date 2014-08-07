//
//  UIWindow+Set.m
//  Answer
//
//  Created by YuJie on 8/7/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "UIWindow+Set.h"
#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "SelectViewController.h"
#import "BaseNavigationController.h"
#import "SetViewController.h"
#import "ViewController.h"

@implementation UIWindow (Set)

+ (void)setRootViewController
{
    UIViewController * leftSideDrawerViewController = [[SetViewController alloc] init];
    
    SelectViewController *centerViewController = [[SelectViewController alloc] initWithNibName:nil bundle:nil];

    UINavigationController * navigationController = [[BaseNavigationController alloc] initWithRootViewController:centerViewController];
    
    [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
    
    MMDrawerController * drawerController = NULL;
    
    if(OSVersionIsAtLeastiOS7()){
        UINavigationController * leftSideNavController = [[BaseNavigationController alloc] initWithRootViewController:leftSideDrawerViewController];
		[leftSideNavController setRestorationIdentifier:@"MMExampleLeftNavigationControllerRestorationKey"];
        drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 leftDrawerViewController:leftSideNavController
                                 rightDrawerViewController:nil];
        [drawerController setShowsShadow:NO];
    }
    else{
        drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 leftDrawerViewController:leftSideDrawerViewController
                                 rightDrawerViewController:nil];
    }
    [drawerController setRestorationIdentifier:@"MMDrawer"];
    [drawerController setMaximumRightDrawerWidth:200.0];
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    
    [APPDELEGATE.window setRootViewController:drawerController];
}

+ (void)SignOut
{
    ViewController *vc = [[ViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController * navigationController = [[BaseNavigationController alloc] initWithRootViewController:vc];
    
    [APPDELEGATE.window setRootViewController:navigationController];
}

@end
