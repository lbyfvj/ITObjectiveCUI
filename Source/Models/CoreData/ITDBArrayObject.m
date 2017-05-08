
//
//  ITDBArrayObject.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 22.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDBArrayObject.h"

#import "ITModelChange.h"

#import "IDPCoreDataManager.h"
#import "NSManagedObject+IDPExtensions.h"
#import "NSManagedObjectContext+IDPExtensions.h"
#import "NSManagedObjectID+IDPExtensions.h"

#import "NSManagedObject+ITExtensions.h"
#import "ITArrayModel+ITExtensions.h"

#import "ITMacro.h"
#import "ITDispatchQueue.h"

kITStaticConst(kITDefaultCacheName);

@interface ITDBArrayObject ()
@property (nonatomic, strong)       NSManagedObject                 *managedObject;
@property (nonatomic, readonly)     NSManagedObjectContext          *managedObjectContext;
@property (nonatomic, strong)       NSFetchedResultsController      *fetchedController;
@property (nonatomic, strong)       NSString                        *keyPath;

- (ITModelChange *)changeModelAtIndexPath:(NSIndexPath *)indexPath
                            forChangeType:(NSFetchedResultsChangeType)type
                             newIndexPath:(NSIndexPath *)newIndexPath;

@end

@implementation ITDBArrayObject

@dynamic managedObjectContext;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithManagedObject:(NSManagedObject *)managedObject
                              keyPath:(NSString *)keyPath
                      sortDescriptors:(NSArray *)sortDescriptors
                            predicate:(NSPredicate *)predicate
{
    self = [super init];
    
    self.managedObject = managedObject;
    self.keyPath = keyPath;
    
    NSFetchRequest *fetchRequest = [[self.managedObject class] fetchRequestWithPredicate:predicate
                                                                        sortDescriptors:sortDescriptors];
    
    self.fetchedController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                 managedObjectContext:self.managedObjectContext
                                                                   sectionNameKeyPath:nil
                                                                            cacheName:kITDefaultCacheName];

    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSManagedObjectContext *)managedObjectContext {
    return [NSManagedObjectContext context];
}

- (void)setFetchedController:(NSFetchedResultsController *)fetchedController {
    if (_fetchedController != fetchedController) {
        _fetchedController.delegate = nil;
        _fetchedController = fetchedController;
        _fetchedController.delegate = self;
    }
}

- (NSArray *)objects {
    return self.fetchedController.fetchedObjects;
}

- (NSUInteger)count {
    return self.objects.count;
}

#pragma mark -
#pragma mark Public

- (void)performLoading {
    ITAsyncPerformInMainQueue(^{
        NSError *error = nil;
        if (![self.fetchedController performFetch:&error]) {
            NSLog(@"ERROR in %@: %@", [self.class description], [error description]);
        }
    });
}

- (id)objectAtIndex:(NSUInteger)index {
    @synchronized(self) {
        return self.objects[index];
    }
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)object {
    @synchronized(self) {
        return [self.objects indexOfObject:object];
    }
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    [self insertObject:object atIndex:index];
}

- (void)addObjects:(NSArray *)objects {
    @synchronized(self) {
        for (id object in objects) {
            [self addObject:object];
        }
    }
}

- (void)addObject:(id)object {
    @synchronized(self) {
        [self.managedObject addCustomValue:object
                        inMutableSetForKey:self.keyPath];
    }
}

- (void)removeObjects:(NSArray *)objects {
    @synchronized(self) {
        for (id object in objects) {
            [self removeObject:object];
        }
    }
}

- (void)removeObject:(id)object {
    @synchronized(self) {
        [self.managedObject removeCustomValue:object
                           inMutableSetForKey:self.keyPath];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized(self) {
        id object = self[index];
        
        [self removeObject:object];
    }
}

#pragma mark -
#pragma mark Private

- (ITModelChange *)changeModelAtIndexPath:(NSIndexPath *)indexPath
                            forChangeType:(NSFetchedResultsChangeType)type
                             newIndexPath:(NSIndexPath *)newIndexPath
{
    NSInteger row = indexPath.row;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            return [ITModelChange insertModelAtIndex:row];
            
        case NSFetchedResultsChangeUpdate:
            return [ITModelChange insertModelAtIndex:row];
            
        case NSFetchedResultsChangeDelete:
            return [ITModelChange deleteModelAtIndex:row];
            
        case NSFetchedResultsChangeMove:
            return [ITModelChange moveModelAtIndex:row toIndex:newIndexPath.row];
            
        default:
            return nil;
    }
}

#pragma mark -
#pragma mark NSFetchedResultsControllerDelegate

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)object
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    ITPrintDebugLog;
    ITModelChange *model = [self changeModelAtIndexPath:indexPath
                                          forChangeType:type
                                           newIndexPath:newIndexPath];
    
    [self updateModelWithModelChange:model];
}

@end
