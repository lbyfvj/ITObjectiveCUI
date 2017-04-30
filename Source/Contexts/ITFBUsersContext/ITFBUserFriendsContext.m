//
//  ITFBUserFriendsContext.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 06.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBUserFriendsContext.h"

#import "ITDBUser.h"
#import "ITDBImage.h"
#import "ITArrayModel.h"
#import "ITDBArrayObject.h"
#import "ITFBUserInteraction.h"

#import "ITJSONRepresentation+ITExtensions.h"

@interface ITFBUserFriendsContext ()
@property (nonatomic, strong, readonly)         ITDBUser          *user;

@end

@implementation ITFBUserFriendsContext

@dynamic user;

#pragma mark -
#pragma mark Accessors

- (ITDBUser *)user {
    return self.model;
}

#pragma mark -
#pragma mark Public

- (NSString *)graphPath {    
    return [NSString stringWithFormat:@"%@/%@", self.user.ID, kITFriends];
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
    NSArray *array = [[result objectForKey:kITData] ITJSONRepresentation];
    ITDBArrayObject *friends = self.user.friends;
    
    for (NSDictionary *object in array) {
        ITDBUser *friend = [ITFBUserInteraction userWithId:object[kITId]
                                    parseObjectInteraction:object];
        
        friend.state = ITDBObjectDidLoadID;
        
        [friends performBlockWithoutNotifications:^{
            [friends addObject:friend];
        }];
    }
    
    [self.user saveManagedObject];
    
    [friends performLoading];
    
    self.user.state = ITDBObjectDidLoadFriends;
}

- (void)failedLoadingData {
    ITDBUser *user = self.user;
    ITDBArrayObject *friends = user.friends;
    
    [friends performLoading];
    
    user.state = ITDBObjectDidLoadFriends;
}

@end
