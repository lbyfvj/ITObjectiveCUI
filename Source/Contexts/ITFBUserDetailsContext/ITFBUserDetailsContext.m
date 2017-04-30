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

#import "ITFBUserInteraction.h"

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
    ITDBUser *user = [ITFBUserInteraction userWithId:result[kITId]
                              parseObjectInteraction:result];
    
    [user saveManagedObject];
    
    user.state = ITDBObjectDidLoadDetails;
}

- (void)failedLoadingData {
    ITDBUser *user = [ITDBUser managedObjectWithID:self.user.ID];
    
    user.state = ITDBObjectDidLoadDetails;
}

@end
