//
//  ITDBUser.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 18.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDBUser.h"

#import "ITDBImage.h"
#import "NSManagedObject+IDPExtensions.h"

static NSString * const kITId = @"id";

@interface ITDBUser ()

@end

@implementation ITDBUser

@synthesize friends = _friends;

@dynamic firstName;
@dynamic lastName;
@dynamic fullName;
@dynamic friendsSet;
@dynamic picture;
@dynamic photos;

#pragma mark -
#pragma mark Initializations and Deallocations

- (NSManagedObject *)initWithEntity:(NSEntityDescription *)entity
     insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if (self) {
        self.friends = [[ITDBArrayObject alloc] initFetchedResultsControllerWithManagedObject:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (ITDBArrayObject *)friends {
    return _friends;
}

- (void)setFriends:(ITDBArrayObject *)friends {
    if (_friends != friends) {
        _friends = nil;
        
        _friends = friends;
    }
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

#pragma mark -
#pragma mark Public

- (void)addFriend:(ITDBUser *)value {
    [self addCustomValue:value inMutableSetForKey:NSStringFromSelector(@selector(friends))];
}

- (void)removeFriend:(ITDBUser *)value {
    [self removeCustomValue:value inMutableSetForKey:NSStringFromSelector(@selector(friends))];
}

- (void)addImage:(ITDBImage *)value {
    [self addCustomValue:value inMutableSetForKey:NSStringFromSelector(@selector(images))];
}

- (void)removeImage:(ITDBImage *)value {
    [self addCustomValue:value inMutableSetForKey:NSStringFromSelector(@selector(images))];
}

@end
