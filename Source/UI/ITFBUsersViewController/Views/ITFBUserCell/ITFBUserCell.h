//
//  ITFBUserCell.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 04.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITTableViewCell.h"

#import "ITModel.h"

@class ITUser;
@class ITImageView;

@interface ITFBUserCell : ITTableViewCell <ITModelObserver>
@property (nonatomic, strong)   IBOutlet    UILabel                     *fullNameLabel;
@property (nonatomic, strong)   IBOutlet    ITImageView                 *userImageView;

@property (nonatomic, strong)   ITUser    *user;

- (void)fillWithUserModel:(ITUser *)user;

@end
