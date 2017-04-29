//
//  NSManagedObject+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (ITExtensions)

+ (NSFetchRequest *)fetchRequestWithPredicate:(NSPredicate *)predicate
                              sortDescriptors:(NSArray *)sortDescriptors;

@end
