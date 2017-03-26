//
//  ITUserCell.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITTableViewCell.h"

#import "ITAbstractModel.h"

@class ITUser;
@class ITImageView;

@interface ITUserCell : ITTableViewCell <ITAbstractModelObserver>
@property (nonatomic, strong)   IBOutlet    UILabel                     *userLabel;
@property (nonatomic, strong)   IBOutlet    ITImageView                 *userImageView;
@property (nonatomic, strong)   IBOutlet    UIActivityIndicatorView     *spinner;

@property (nonatomic, strong)   ITUser    *user;

@end
