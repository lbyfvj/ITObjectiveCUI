//
//  ITFBUserDetailsContext.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 09.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBUserDetailsContext.h"

#import "ITDBUser.h"
#import "ITDBImage.h"

@interface ITFBUserDetailsContext ()
@property (nonatomic, readonly)     ITDBUser      *user;

@end

@implementation ITFBUserDetailsContext

@dynamic user;

#pragma mark -
#pragma mark Accessors

- (ITDBUser *)user {
    return (ITDBUser *)self.model;
}

#pragma mark -
#pragma mark Public

- (NSString *)graphPath {
    return [NSString stringWithFormat:@"%@?fields=id,first_name,last_name,picture", self.user.ID];
}

- (NSDictionary *)requestParameters {
    return @{@"fields":[NSString stringWithFormat:@"%@, %@, %@, %@",
                        @"id",
                        @"first_name",
                        @"last_name",
                        @"picture.type(large)"]};;
}

- (FBSDKGraphRequest *)graphRequest {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath
                                             parameters:self.requestParameters];
}

- (void)resultHandler:(NSDictionary *)result {    
    ITDBUser *user = self.user;
    user.ID = result[@"id"];
    user.firstName = result[@"first_name"];
    user.lastName = result[@"last_name"];
    user.picture = [ITDBImage managedObjectWithID:result[@"picture"][@"data"][@"url"]];
    
    user.state = ITDBObjectDidLoadDetails;
}

@end
