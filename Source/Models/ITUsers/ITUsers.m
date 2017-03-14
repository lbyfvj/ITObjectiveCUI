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
        [self generateUsers];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Private

- (void)generateUsers {
    for (NSUInteger i = 0; i < kITUsersCount; i++) {
        [self addObject:[ITUser new]];
    }
}

@end
