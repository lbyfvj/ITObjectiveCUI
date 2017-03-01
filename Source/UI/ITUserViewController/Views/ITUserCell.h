//
//  ITUserCell.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ITUser;

@interface ITUserCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet    UILabel         *stringLabel;
@property (nonatomic, strong)   IBOutlet    UIImageView     *image;

@property (nonatomic, strong)   ITUser    *user;

- (void)fillWithUserModel:(ITUser *)data;

@end
