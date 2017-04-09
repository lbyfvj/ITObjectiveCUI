//
//  ITFBUserContext.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 09.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBUserContext.h"

#import "ITUser.h"

@interface ITFBUserContext ()
@property (nonatomic, readonly)     ITUser      *user;

@end

@implementation ITFBUserContext

@dynamic user;

#pragma mark -
#pragma mark Accessors

- (ITUser *)user {
    return (ITUser *)self.model;
}

#pragma mark -
#pragma mark Public

- (NSString *)graphPath {
    return @"me?fields=id,first_name,last_name,gender,picture";
}

- (void)resultHandler:(NSDictionary *)result {    
    ITUser *user = self.user;
    user.userId = result[@"id"];
    user.firstName = result[@"first_name"];
    user.lastName = result[@"last_name"];
    user.gender = result[@"gender"];
    user.imageURL = [NSURL URLWithString:result[@"picture"][@"data"][@"url"]];
}

@end
