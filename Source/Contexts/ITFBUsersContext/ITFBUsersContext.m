//
//  ITFBUsersContext.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 06.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBUsersContext.h"

#import "ITUser.h"
#import "ITArrayModel.h"

@interface ITFBUsersContext ()
@property (nonatomic, readonly)       ITArrayModel      *users;

@end

@implementation ITFBUsersContext

@dynamic users;

#pragma mark -
#pragma mark Accessors

- (ITArrayModel *)users {
    return (ITArrayModel *)self.model;
}

#pragma mark -
#pragma mark Public

- (NSString *)graphPath {
    return @"me/friends";
}

- (void)resultHandler:(NSDictionary *)result {
    NSArray *array = [result objectForKey:@"data"];    
    ITArrayModel *users = self.users;
    
    for (NSDictionary *object in array) {
        ITUser *user = [ITUser new];
        user.userId = object[@"id"];
        user.firstName = object[@"first_name"];
        user.lastName = object[@"last_name"];
        user.imageURL = [NSURL URLWithString:object[@"picture"][@"data"][@"url"]];
        
        [users performBlockWithoutNotifications:^{
            [users addObject:user];
        }];
    }
    
    users.state = ITModelLoaded;
}

@end
