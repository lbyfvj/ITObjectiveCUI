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
    ITUserDidLoadFullInfo = ITModelStateCount,
    ITUserStateCount
};

@interface ITUser : ITModel <NSCoding>
@property (nonatomic, copy)         NSString            *userId;

@property (nonatomic, copy)         NSString            *firstName;
@property (nonatomic, copy)         NSString            *lastName;
@property (nonatomic, readonly)     NSString            *fullName;

@property (nonatomic, copy)         NSString            *gender;

@property (nonatomic, strong)       ITArrayModel        *friends;
@property (nonatomic, copy)         NSURL               *imageURL;
@property (nonatomic, readonly)     ITImageModel        *imageModel;

@end

@protocol ITUserObserver <NSObject, ITModelObserver>

@optional
- (void)userDidLoadFullInfo:(ITUser *)user;

@end
