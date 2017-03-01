//
//  ITUserCell.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUserCell.h"

#import "ITUser.h"

@implementation ITUserCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITUser *)user {
    if (_user != user) {
        _user = user;
    }
    
    [self fillWithUserModel:user];
}

#pragma mark -
#pragma mark Public

- (void)fillWithUserModel:(ITUser *)user {
    self.stringLabel.text = user.name;
    self.image.image = user.userImage;
}

@end
