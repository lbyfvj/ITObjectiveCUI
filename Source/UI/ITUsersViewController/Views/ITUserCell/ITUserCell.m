//
//  ITUserCell.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUserCell.h"

#import "ITUser.h"
#import "ITImageView.h"
#import "ITMacro.h"
#import "ITDispatchQueue.h"

@interface ITUserCell ()

- (void)fillWithUserModel:(ITUser *)data;

@end

@implementation ITUserCell

#pragma mark -
#pragma mark Initializations and Deallocations


#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITUser *)user {
    if (_user != user) {
        
        _user = user;
        
        [self fillWithUserModel:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithUserModel:(ITUser *)user {
    self.userLabel.text = user.name;
    self.userImageView.imageModel = user.imageModel;
}

@end
