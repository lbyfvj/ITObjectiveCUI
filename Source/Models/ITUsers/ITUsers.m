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

static const NSUInteger kITUsersCount = 10;

@interface ITUsers ()
@property (nonatomic, strong)   NSMutableArray  *users;

- (void)generateUsers;

@end

@implementation ITUsers

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.users = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Public


#pragma mark -
#pragma mark - Private

- (void)generateUsers {
    for (NSUInteger i = 0; i < kITUsersCount; i++) {
        [self addObject:[ITUser new]];
    }
}

#pragma mark -
#pragma mark - ITAbstractModel Override

- (void)performLoading {
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[self path]];
    if (fileExists) {
        NSMutableArray *users = [[NSMutableArray alloc] initWithContentsOfFile:[self path]];        
        for (ITUser *user in users) {
            [self addObject:user];
        }
    } else {
        [self generateUsers];
    }
    
    sleep(1);
    
    self.state = ITAbstractModelLoaded;
}

@end
