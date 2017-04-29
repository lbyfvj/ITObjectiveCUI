//
//  ITFBUserInteraction.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBUserInteraction.h"
#import "ITFBConstants.h"
#import "ITDBImage.h"

@implementation ITFBUserInteraction

#pragma mark -
#pragma mark Class Methods

+ (ITDBUser *)userWithId:(NSString *)userID parseObjectInteraction:(NSDictionary *)object {
    ITFBUserInteraction *userInteraction = [self new];
    
    ITDBUser *user = [userInteraction userWithId:userID];
    
    user.ID = object[kITId];
    user.firstName = object[kITFirstName];
    user.lastName = object[kITLastName];
    user.picture = [ITDBImage managedObjectWithID:object[kITPicture][kITData][kITURL]];
    
    return user;
}

#pragma mark -
#pragma mark Public Methods

- (ITDBUser *)userWithId:(NSString *)userID {
    return [ITDBUser managedObjectWithID:userID];;
}

@end
