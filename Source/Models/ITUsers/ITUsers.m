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
static const NSUInteger kITSectionIndex = 0;

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
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.users count] - 1 inSection:kITSectionIndex];

    [self setState:ITUsersAdded withObject:indexPath];
}

- (void)insertUser:(ITUser*)user atIndex:(NSUInteger)index {
    [self.users insertObject:user atIndex:index];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    [self.users removeObjectAtIndex:index];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:kITSectionIndex];
    
    [self setState:ITUsersDeleted withObject:indexPath];
}

- (void)moveUserAtIndex:(NSUInteger)index toIndex:(NSUInteger)newIndex {
    [self.users removeObjectAtIndex:index];
    [self.users insertObject:self.users[index] atIndex:newIndex];
    
    NSIndexPath *actualPath = [NSIndexPath indexPathForRow:index inSection:kITSectionIndex];
    NSIndexPath *newPath = [NSIndexPath indexPathForRow:newIndex inSection:kITSectionIndex];
    NSMutableArray *indexPaths = [NSMutableArray arrayWithObjects:actualPath, newPath, nil];
    
    [self setState:ITUsersReordered withObject:indexPaths];
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
#pragma mark ITObservableObject Overload

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        
        case ITUsersAdded:
            return @selector(users:didAddedWithPath:);
            
        case ITUsersDeleted:
            return @selector(users:didDeletedWithPath:);
        
        case ITUsersReordered:
            return @selector(users:didReorderedWithPaths:);
            
        default:
            [super selectorForState:state];
    }
    
    return NULL;
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)length {
    return [self.users countByEnumeratingWithState:state objects:buffer count:length];
}

@end
