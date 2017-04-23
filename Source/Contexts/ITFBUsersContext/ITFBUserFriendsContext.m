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
    return [NSString stringWithFormat:@"%@/friends", self.user.ID];
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
    NSArray *array = [result objectForKey:@"data"];
    ITDBArrayObject *friends = self.user.friends;
    
    for (NSDictionary *object in array) {
        ITDBUser *friend = [ITDBUser managedObjectWithID:object[@"id"]];
        friend.ID = object[@"id"];
        friend.firstName = object[@"first_name"];
        friend.lastName = object[@"last_name"];
        friend.picture = [ITDBImage managedObjectWithID:object[@"picture"][@"data"][@"url"]];
        friend.state = ITDBObjectDidLoadID;
        
        [friends performBlockWithoutNotifications:^{
            [friends addObject:friend];
        }];
    }
    
    [self.user saveManagedObject];
    
    [friends performLoading];

    self.user.state = ITDBObjectDidLoadFriends;
}

@end
