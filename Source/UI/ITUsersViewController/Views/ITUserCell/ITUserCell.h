//
//  ITUserCell.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITTableViewCell.h"

#import "ITModel.h"

@class ITUser;
@class ITImageView;

@interface ITUserCell : ITTableViewCell <ITModelObserver>
@property (nonatomic, strong)   IBOutlet    UILabel                     *userLabel;
@property (nonatomic, strong)   IBOutlet    ITImageView                 *userImageView;

@property (nonatomic, strong)   ITUser    *user;

@end
