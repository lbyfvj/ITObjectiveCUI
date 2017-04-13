//
//  ITLoginViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITLoginViewController.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ITFBLoginContext.h"
#import "ITFBUsersViewController.h"
#import "ITDispatchQueue.h"


@interface ITLoginViewController ()

- (void)pushViewControllerWithUser:(ITUser *)user withAnimation:(BOOL)animation;

@end

@implementation ITLoginViewController

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        
        _user = user;
        
        [_user addObserver:self];
    }
}

#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ITUser *user = [ITFBLoginContext user];
    
    if (user) {
        [self pushViewControllerWithUser:user withAnimation:NO];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark Private

- (void)pushViewControllerWithUser:(ITUser *)user withAnimation:(BOOL)animation {
    ITFBUsersViewController *controller = [ITFBUsersViewController new];
    controller.user = user;
    
    [self.navigationController pushViewController:controller animated:animation];
}

#pragma mark -
#pragma mark Public

- (IBAction)onLoginButtonClicked:(id)sender {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    ITUser *user  = [ITUser new];
    self.user = user;
    
    ITFBLoginContext *context = [[ITFBLoginContext alloc] initWithUser:user];
    
    [context execute];
}

#pragma mark -
#pragma mark ITUserObserver

- (void)userDidLoad:(ITUser *)user {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    ITAsyncPerformInMainQueue(^{
        [self pushViewControllerWithUser:user withAnimation:YES];
    });
}

@end
