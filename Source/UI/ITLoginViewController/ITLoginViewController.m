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

#import "ActiveRecordKit.h"

#import "UIViewController+ITExtensions.h"

@interface ITLoginViewController ()
@property (nonatomic, strong)   ITFBLoginContext   *loginContext;

- (void)pushViewControllerWithUser:(ITDBUser *)user withAnimation:(BOOL)animation;

@end

@implementation ITLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations


#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITDBUser *)user {
    if (_user != user) {
        [_user removeObserverObject:self];
        
        _user = user;
        
        [_user addObserverObject:self];
    }
}

#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ITDBUser *user = [ITFBLoginContext user];
    
    if (user) {
        [self pushViewControllerWithUser:user withAnimation:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark Private

- (void)pushViewControllerWithUser:(ITDBUser *)user withAnimation:(BOOL)animation {
    ITFBUsersViewController *controller = [ITFBUsersViewController viewController];
    controller.user = user;
    
    [self.navigationController pushViewController:controller animated:animation];
}

#pragma mark -
#pragma mark Public

- (IBAction)onLoginButtonClicked:(id)sender {
    ITDBUser *user  = [ITDBUser managedObject];
    self.user = user;
    
    ITFBLoginContext *loginContext = [[ITFBLoginContext alloc] initWithUser:user];
    self.loginContext = loginContext;
    
    [loginContext execute];
}

#pragma mark -
#pragma mark ITDBObjectObserver

- (void)objectDidLoadID:(ITDBUser *)user {
    ITPrintDebugLog;
    ITAsyncPerformInMainQueue(^{
        [self pushViewControllerWithUser:user withAnimation:YES];
    });
}

@end
