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

@interface ITDBArrayObject ()
@property (nonatomic, strong)   NSManagedObject                 *managedObject;
@property (nonatomic, strong)   NSManagedObjectContext          *managedObjectContext;
@property (nonatomic, strong)   NSFetchedResultsController      *fetchedController;
@property (nonatomic, strong)   NSString                        *keyPath;

@end

@implementation ITDBArrayObject

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
    
    
    self.fetchedController = [[NSFetchedResultsController alloc]
                              initWithFetchRequest:fetchRequest
                              managedObjectContext:self.managedObjectContext
                              sectionNameKeyPath:nil
                              cacheName:nil];

    return self;
}

- (instancetype)initFetchedResultsControllerWithManagedObject:(NSManagedObject *)managedObject {
    self = [super init];
    
    self.managedObject = managedObject;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                        initWithEntityName:NSStringFromClass([self.managedObject class])];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                                                initWithKey:@"firstName"
                                                  ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    self.fetchedController = [[NSFetchedResultsController alloc]
                                                initWithFetchRequest:fetchRequest
                                                managedObjectContext:self.managedObjectContext
                                                  sectionNameKeyPath:nil
                                                           cacheName:nil];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSManagedObjectContext *)managedObjectContext {
    return [NSManagedObjectContext context];
}

- (void)setFetchedController:(NSFetchedResultsController *)fetchedController {
    if (_fetchedController != fetchedController) {
        _fetchedController = fetchedController;
    }
    
    self.fetchedController.delegate = self;
}

- (NSArray *)objects {
    return [self.fetchedController fetchedObjects];
}

- (NSUInteger)count {
    return self.objects.count;
}

#pragma mark -
#pragma mark Public

- (void)performLoading {
    NSError *error = nil;
    if (![self.fetchedController performFetch:&error]) {
        NSLog(@"ERROR in %@: %@", [self.class description], [error description]);
    }
}

- (id)objectAtIndex:(NSUInteger)index {
    @synchronized(self) {
        return self.objects[index];
    }
}

- (NSUInteger)indexOfObject:(id)object {
    @synchronized(self) {
        return [self.objects indexOfObject:object];
    }
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    [self addObject:object];
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
                        inMutableSetForKey:@"friends"];
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
                           inMutableSetForKey:@"friends"];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized(self) {
        id object = self[index];
        
        [self removeObject:object];
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
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    ITModelChange *model = nil;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            model = [ITModelChange insertModelAtIndex:indexPath.row];
            break;
            
        case NSFetchedResultsChangeUpdate:
            model = [ITModelChange insertModelAtIndex:indexPath.row];
            break;
            
        case NSFetchedResultsChangeDelete:
            model = [ITModelChange deleteModelAtIndex:indexPath.row];
            break;
            
        case NSFetchedResultsChangeMove:
            model = [ITModelChange moveModelAtIndex:indexPath.row toIndex:newIndexPath.row];
            break;
            
        default:
            break;
    }
    
    [self updateModelWithModelChange:model];
}

@end
