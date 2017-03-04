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
#pragma mark Accessors

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return [self.users count];
}

- (void)addUser {
    ITUser *user = [ITUser object];
    [self.users addObject:user];
}

- (void)addUser:(ITUser*)user atIndex:(NSUInteger)index {
    [self.users insertObject:user atIndex:index];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    [self.users removeObjectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.users[index];
}

#pragma mark -
#pragma mark - Private

- (void)generateUsers {
    for (NSUInteger i = 0; i < kITUsersCount; i++) {
        [self addUser];
    }
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)length {
    return [self.users countByEnumeratingWithState:state objects:buffer count:length];
}

@end
