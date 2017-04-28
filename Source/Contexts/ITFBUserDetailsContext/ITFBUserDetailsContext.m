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
    return [NSString stringWithFormat:@"%@?%@=%@,%@,%@,%@", self.user.ID, kITFields, kITId, kITFirstName, kITLargePicture, kITPicture];
}

- (NSDictionary *)requestParameters {
    return @{kITFields:[NSString stringWithFormat:@"%@, %@, %@, %@",
                        kITId,
                        kITFirstName,
                        kITLastName,
                        kITLargePicture]};;
}

- (FBSDKGraphRequest *)graphRequest {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath
                                             parameters:self.requestParameters];
}

- (void)resultHandler:(NSDictionary *)result {    
    ITDBUser *user = self.user;
    user.ID = result[kITId];
    user.firstName = result[kITFirstName];
    user.lastName = result[kITLastName];
    user.picture = [ITDBImage managedObjectWithID:result[kITPicture][kITData][kITURL]];
    
    user.state = ITDBObjectDidLoadDetails;
}

@end
