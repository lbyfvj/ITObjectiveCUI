//
//  ITFBFriendView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 09.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBFriendView.h"

#import "ITDispatchQueue.h"

@interface ITFBFriendView ()
@property (nonatomic, strong)   ITImageModel    *imageModel;

- (void)fillWithUser:(ITDBUser *)user;

@end

@implementation ITFBFriendView

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITDBUser *)user {
    if (_user != user) {
        [_user removeObserverObject:self];
        _user = user;
        [_user addObserverObject:self];
    }
    
    [self fillWithUser:user];
}


#pragma mark -
#pragma mark Private

- (void)fillWithUser:(ITDBUser *)user {
    self.firstNameLabel.text = user.firstName;
    self.lastNameLabel.text = user.lastName;
    //self.userImageView.imageModel = user.imageModel;
}

#pragma mark -
#pragma mark - ITModelObserver

- (void)modelDidLoad:(ITModel *)model {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    ITAsyncPerformInMainQueue(^{
        self.loadingViewVisible = NO;
    });
}

- (void)modelWillLoad:(ITModel *)model {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    ITAsyncPerformInMainQueue(^{
        self.loadingViewVisible = YES;
    });
}

@end
