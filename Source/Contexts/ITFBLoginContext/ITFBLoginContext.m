//
//  ITFBLoginContext.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBLoginContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

static NSString * const kITFBPublicPermission = @"public_profile";
static NSString * const kITFBUserFriendsPermission = @"user_friends";

@interface ITFBLoginContext ()
@property (nonatomic, readonly)     FBSDKLoginManager   *loginManager;
@property (nonatomic, readonly)     FBSDKAccessToken    *accessToken;

- (void)loginAtFacebook;
- (void)completeLogin;

@end

@implementation ITFBLoginContext

@dynamic accessToken;

#pragma mark -
#pragma mark Initializatiions and Deallocations

- (instancetype)initWithUser:(ITUser *)user {
    self = [super initWithModel:user];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (FBSDKLoginManager *)loginManager {
    return [FBSDKLoginManager new];
}

- (FBSDKAccessToken *)accessToken {
    return [FBSDKAccessToken currentAccessToken];
}

#pragma mark -
#pragma mark Public

- (void)execute {
    if (self.accessToken.userID) {
        [self completeLogin];
    } else {
        [self loginAtFacebook];
    }
}

#pragma mark -
#pragma mark Private

- (void)loginAtFacebook {
    FBSDKLoginManager *loginManager = self.loginManager;
    
    [loginManager logInWithReadPermissions:@[kITFBPublicPermission, kITFBUserFriendsPermission]
                        fromViewController:nil
                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                       if (error) {
                                           NSLog(@"Process error");
                                       } else if (result.isCancelled) {
                                           NSLog(@"Cancelled");
                                       } else {
                                           NSLog(@"Logged in");
                                           [self completeLogin];
                                       }
                                   }];
}

- (void)completeLogin {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    FBSDKAccessToken *accessToken = self.accessToken;
    
    if (accessToken) {
        ITUser *user = self.model;
        user.userId = accessToken.userID;
    }
}

@end
