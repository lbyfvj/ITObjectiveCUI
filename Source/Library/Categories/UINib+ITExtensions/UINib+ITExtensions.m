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

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls
                 bundle:(NSBundle *)bundle
{
    return [UINib nibWithNibName:NSStringFromClass(cls)
                          bundle:bundle];
}

+ (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls
                          bundle:nil];
}

+ (id)objectWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [self objectWithClass:cls
                          bundle:bundle
                       withOwner:nil
                     withOptions:nil];
}

+ (id)objectWithClass:(Class)cls
               bundle:(NSBundle *)bundle
            withOwner:(id)owner
          withOptions:(NSDictionary *)options
{
    UINib *nib = [self nibWithClass:cls bundle:bundle];
    
    return [nib objectWithClass:cls withOwner:owner withOptions:options];
}

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls
                       withOwner:nil];
}

- (id)objectWithClass:(Class)cls
            withOwner:(id)owner
{
    return [self objectWithClass:cls
                       withOwner:owner
                     withOptions:nil];
}

- (id)objectWithClass:(Class)cls
            withOwner:(id)owner
          withOptions:(NSDictionary *)options
{
    for (id object in [self objectsWithOwner:owner withOptions:options]) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

- (NSArray *)objectsWithOwner:(id)owner withOptions:(NSDictionary *)options {
    return [self instantiateWithOwner:owner options:nil];
}

@end
