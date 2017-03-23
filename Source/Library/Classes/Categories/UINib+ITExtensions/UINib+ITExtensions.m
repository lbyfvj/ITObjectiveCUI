//
//  UINib+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "UINib+ITExtensions.h"

@implementation UINib (ITExtensions)

#pragma mark -
#pragma mark Class Methods

+ (UINib *)nibWithClass:(Class)class {
    return [self nibWithClass:class bundle:nil];
}

+ (UINib *)nibWithClass:(Class)class
                 bundle:(NSBundle *)bundle
{
    return [UINib nibWithNibName:NSStringFromClass(class)
                          bundle:bundle];
}

+ (id)objectWithClass:(Class)class {
    return [self objectWithClass:class
                          bundle:nil];
}

+ (id)objectWithClass:(Class)class bundle:(NSBundle *)bundle {
    return [self objectWithClass:class
                          bundle:bundle
                       withOwner:nil
                     withOptions:nil];
}

+ (id)objectWithClass:(Class)class
               bundle:(NSBundle *)bundle
            withOwner:(id)owner
          withOptions:(NSDictionary *)options
{
    UINib *nib = [self nibWithClass:class bundle:bundle];
    NSArray *objects = [nib instantiateWithOwner:owner
                                         options:options];
    
    for (id object in objects) {
        if ([object isMemberOfClass:class]) {
            return object;
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)class {
    return [self objectWithClass:class
                       withOwner:nil];
}

- (id)objectWithClass:(Class)class
            withOwner:(id)owner
{
    return [self objectWithClass:class
                       withOwner:owner
                     withOptions:nil];
}

- (id)objectWithClass:(Class)class
            withOwner:(id)owner
          withOptions:(NSDictionary *)options
{
    NSArray *objects = [self instantiateWithOwner:owner
                                          options:options];
    
    for (id object in objects) {
        if ([object isMemberOfClass:class]) {
            return object;
        }
    }
    
    return nil;
}

@end
