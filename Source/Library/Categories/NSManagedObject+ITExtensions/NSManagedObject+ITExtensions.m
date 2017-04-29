//
//  NSManagedObject+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSManagedObject+ITExtensions.h"

@implementation NSManagedObject (ITExtensions)

+ (NSFetchRequest *)fetchRequestWithPredicate:(NSPredicate *)predicate
                              sortDescriptors:(NSArray *)sortDescriptors
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([self class])];
    fetchRequest.predicate = predicate;
    fetchRequest.sortDescriptors = sortDescriptors;
    
    return fetchRequest;
}

@end
