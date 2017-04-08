//
//  ITFBUserCell.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 04.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBUserCell.h"

#import "ITUser.h"

#import "ITImageView.h"

@implementation ITFBUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

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
    self.fullNameLabel.text = user.fullName;
    
    self.userImageView.imageModel = user.imageModel;
}

@end
