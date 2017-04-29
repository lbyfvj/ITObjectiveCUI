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

kITStaticConstWithValue(kITId, @"id");
kITStaticConstWithValue(kITFriends, @"friends");
kITStaticConstWithValue(kITFirstName, @"firstName");

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
        
        NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                                  initWithKey:kITFirstName
                                  ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sort];
        
        self.friends = [[ITDBArrayObject alloc] initWithManagedObject:self
                                                              keyPath:kITFriends
                                                      sortDescriptors:sortDescriptors
                                                            predicate:nil];
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
