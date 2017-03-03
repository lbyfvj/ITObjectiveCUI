//
//  ITUsersView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsersView.h"

@implementation ITUsersView

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITUsers *)users {
    if (_users != users) {
        _users = users;
    }
}

@end
