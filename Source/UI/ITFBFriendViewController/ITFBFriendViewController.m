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
#import "ITFBUserContext.h"

@interface ITFBFriendViewController ()
@property (nonatomic, strong)           ITFBUserContext        *friendContext;

@end

ITViewControllerSynthesizeRootView(ITFBFriendViewController, fbFriendView, ITFBFriendView)

@implementation ITFBFriendViewController

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        _user = user;
        [_user addObserver:self];
        self.friendContext = [ITFBUserContext new];
    }
}

- (void)setFriendContext:(ITFBUserContext *)friendContext {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    if (_friendContext != friendContext) {
        [_friendContext cancel];
        _friendContext = friendContext;
        _friendContext.model = self.user;
        [_friendContext execute];
    }
}

#pragma mark -
#pragma mark LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fbFriendView.model = self.user;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark ITUserObserver

- (void)userDidLoad:(ITUser *)user {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    ((ITUser *)self.user).state = ITModelLoaded;
}


@end
