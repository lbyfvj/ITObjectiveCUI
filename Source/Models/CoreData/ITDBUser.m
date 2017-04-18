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

@implementation ITDBUser

@dynamic firstName;
@dynamic lastName;
@dynamic friends;
@dynamic images;

#pragma mark -
#pragma mark Initializations and Deallocations


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
