//
//  ITFBFriendView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 09.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITView.h"

#import "ITImageView.h"

@interface ITFBFriendView : ITView
@property (nonatomic, strong)               ITModel             *model;

@property (nonatomic, strong)   IBOutlet    UILabel             *firstNameLabel;
@property (nonatomic, strong)   IBOutlet    UILabel             *lastNameLabel;
@property (nonatomic, strong)   IBOutlet    UILabel             *genderLabel;
@property (nonatomic, strong)   IBOutlet    ITImageView         *userImageView;

@end
