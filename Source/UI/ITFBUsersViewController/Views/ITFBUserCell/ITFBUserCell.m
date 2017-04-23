//
//  ITFBUserCell.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 04.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBUserCell.h"

#import "ITDBUser.h"

#import "ITImageView.h"

@implementation ITFBUserCell

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITDBUser *)user {
    if (_user != user) {
        
        _user = user;
        
        [self fillWithUserModel:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithUserModel:(ITDBUser *)user {
    self.fullNameLabel.text = user.fullName;
    
    //self.userImageView.imageModel = user.picture.imageModel;
}

@end
