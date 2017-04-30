//
//  ITFBFriendViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 08.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBFriendViewController.h"

#import "ITMacro.h"
#import "ITFBFriendView.h"
#import "ITFBUserDetailsContext.h"

@interface ITFBFriendViewController ()
@property (nonatomic, strong)           ITFBUserDetailsContext        *friendContext;

- (void)loadFriendDetails;

@end

ITViewControllerSynthesizeRootView(ITFBFriendViewController, fbFriendView, ITFBFriendView)

@implementation ITFBFriendViewController

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITDBUser *)user {
    if (_user != user) {
        [_user removeObserverObject:self];
        _user = user;
        [_user addObserverObject:self];
        
        if (self.isViewLoaded) {
            self.fbFriendView.user = self.user;
        }
    }
}

- (void)setFriendContext:(ITFBUserDetailsContext *)friendContext {
    ITPrintDebugLog;
    if (_friendContext != friendContext) {
        [_friendContext cancel];
        _friendContext = friendContext;
    }
}

#pragma mark -
#pragma mark LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadFriendDetails];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark Private

- (void)loadFriendDetails {
    ITPrintDebugLog;
    self.friendContext = [ITFBUserDetailsContext new];
    self.friendContext.model = self.user;
    [self.friendContext execute];
}
 
#pragma mark -
#pragma mark ITDBObjectObserver

- (void)objectDidLoadDetails:(ITDBUser *)user {
    ITPrintDebugLog;
    self.fbFriendView.user = self.user;
}


@end
