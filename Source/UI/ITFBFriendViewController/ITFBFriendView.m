//
//  ITFBFriendView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 09.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBFriendView.h"

#import "ITUser.h"
#import "ITDispatchQueue.h"

@interface ITFBFriendView ()
@property (nonatomic, strong)   ITImageModel    *imageModel;

- (void)fillWithUser:(ITUser *)user;

@end

@implementation ITFBFriendView

#pragma mark -
#pragma mark Accessors

- (void)setModel:(ITUser *)user {
    if (_model != user) {
        [_model removeObserver:self];
        _model = user;        
        [_model addObserver:self];
    }
    
    [self fillWithUser:user];
}


#pragma mark -
#pragma mark Private

- (void)fillWithUser:(ITUser *)user {
    self.firstNameLabel.text = user.firstName;
    self.lastNameLabel.text = user.lastName;
    self.genderLabel.text = user.gender;
    self.userImageView.imageModel = user.imageModel;    
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
