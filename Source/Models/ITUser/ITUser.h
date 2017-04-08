//
//  ITUser.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITModel.h"
#import "ITImageModel.h"
#import "ITArrayModel.h"

typedef NS_ENUM(NSUInteger, ITUserState) {
    ITUserDidLoad = ITModelStateCount,
    ITUserStateCount
};

@interface ITUser : ITModel <NSCoding>
@property (nonatomic, strong)       NSString        *userId;
@property (nonatomic, strong)       NSString        *firstName;
@property (nonatomic, strong)       NSString        *lastName;
@property (nonatomic, readonly)     NSString        *fullName;
@property (nonatomic, readonly)     ITImageModel    *imageModel;
@property (nonatomic, strong)       ITArrayModel    *friends;
@property (nonatomic, copy)         NSURL           *imageURL;

@end

@protocol ITUserObserver <NSObject, ITModelObserver>

@optional
- (void)userDidLoad:(ITUser *)user;

@end
