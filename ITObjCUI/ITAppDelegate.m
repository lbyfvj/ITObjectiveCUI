//
//  ITAppDelegate.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 20.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITAppDelegate.h"

#import "ITSquareViewController.h"

#import "ITUsersViewController.h"

#import "UIWindow+ITExtensions.h"

@interface ITAppDelegate ()

@end

@implementation ITAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [UIWindow window];
    self.window = window;
    
//    ITSquareViewController *controller = [ITSquareViewController new];
    ITUsersViewController *controller = [ITUsersViewController new];
    //controller.users = [ITUsers new];
    controller.users = [ITUsers sharedUsers];
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[ITUsers sharedUsers] save];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[ITUsers sharedUsers] save];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[ITUsers sharedUsers] save];
}

@end
