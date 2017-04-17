//
//  ITUsers.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsers.h"

#import "ITUser.h"
#import "NSObject+ITExtensions.h"
#import "ITDispatchQueue.h"
#import "NSFileManager+ITExtensions.h"

static const NSUInteger kITUsersCount = 10;

@interface ITUsers ()

- (void)subscribeAtAppNotifications:(NSArray *)notifications;

- (NSArray *)randomUsers;
- (NSArray *)savedUsers;

@end

@implementation ITUsers

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    [self subscribeAtAppNotifications:@[UIApplicationWillResignActiveNotification,
                                        UIApplicationWillTerminateNotification]];
    return self;
}

#pragma mark -
#pragma mark Public

- (NSString *)path {
    NSString *fileName = [NSString stringWithFormat:@"%@.plist", NSStringFromClass([self class])];
    NSURL *appDirectory = [NSFileManager documentsDirectoryURL];
    
    return [[appDirectory path] stringByAppendingString:fileName];
}

- (void)save {
    NSLog(@"%@", self.path);
    [NSKeyedArchiver archiveRootObject:self.objects toFile:self.path];
}

#pragma mark -
#pragma mark Private

- (void)subscribeAtAppNotifications:(NSArray *)notifications {
    NSNotificationCenter *noticationCenter = [NSNotificationCenter defaultCenter];
    
    for (id notification in notifications) {
        [noticationCenter addObserver:self
                             selector:@selector(save)
                                 name:notification
                               object:nil];
    }
}

- (NSArray *)randomUsers {
    return [ITUser objectsWithCount:kITUsersCount];
}

- (NSArray *)savedUsers {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
}

- (void)performLoading {
    NSArray *users = self.savedUsers;
    users = users ?: self.randomUsers;
    
    [self performBlockWithoutNotifications:^{
        [self addObjects:users];
    }];
    
    self.state = ITModelLoaded;
}

@end
