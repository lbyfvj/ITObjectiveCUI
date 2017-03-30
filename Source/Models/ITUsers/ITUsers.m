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

- (NSArray *)randomUsers;
- (NSArray *)savedUsers;

@end

@implementation ITUsers

#pragma mark -
#pragma mark Public

- (NSString *)path {
    NSString *fileName = [NSString stringWithFormat:@"%@.plist", NSStringFromClass([self class])];
    NSURL *appDirectory = [NSFileManager documentsDirectory];
    
    return [[appDirectory path] stringByAppendingString:fileName];
}

- (void)save {
    NSLog(@"%@", self.path);
    [NSKeyedArchiver archiveRootObject:self.objects toFile:self.path];
}

#pragma mark -
#pragma mark Private

- (NSArray *)randomUsers {
    return [ITUser objectsWithCount:kITUsersCount];
}

- (NSArray *)savedUsers {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
}

- (void)performLoading {
    sleep(1);
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:self.path];
    NSArray *users = fileExists ? self.savedUsers : self.randomUsers;
    
    [self performBlockWithoutNotifications:^{
        [self addObjects:users];
    }];
    
    self.state = ITModelLoaded;
}

@end
