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
@property (nonatomic, strong)   ITUsersViewController   *controller;

- (void)saveModel;
           
@end

@implementation ITAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    ITUsersViewController *controller = self.controller;
    controller = [ITUsersViewController new];
    controller.usersModel = [ITUsers new];
    
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self saveModel];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveModel];
}

#pragma mark -
#pragma mark Private

- (void)saveModel {
    [self.controller.usersModel save];
}

@end
