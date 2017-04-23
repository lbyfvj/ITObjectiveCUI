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
        self.friendContext = [ITFBUserDetailsContext new];
    }
}

- (void)setFriendContext:(ITFBUserDetailsContext *)friendContext {
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
 
#pragma mark -
#pragma mark ITDBObjectObserver

- (void)objectDidLoadDetails:(ITDBUser *)user {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    self.fbFriendView.user = self.user;
}


@end
