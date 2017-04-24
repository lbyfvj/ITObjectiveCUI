//
//  ITDBObject.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 18.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDBObject.h"

#import "NSManagedObject+IDPExtensions.h"

static NSString * const kITId = @"id";

@interface ITDBObject ()
@property (nonatomic, strong)   ITObservableObject      *object;

@end

@implementation ITDBObject

@synthesize object = _object;

@dynamic ID;

#pragma mark -
#pragma mark Initializations and Deallocations

- (NSManagedObject *)initWithEntity:(NSEntityDescription *)entity
     insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if (self) {
        self.object = [ITObservableObject observableObjectWithTarget:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Class Methods

+ (id)managedObjectWithID:(NSString *)ID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.id like %@", ID];
    NSArray *objects = [self fetchEntityWithSortDescriptors:nil
                                                  predicate:predicate
                                              prefetchPaths:nil];
    
    if (objects.count > 0) {
        return [objects firstObject];
    }
    
    ITDBObject *object = [self managedObject];
    object.ID = ID;
    
    return object;
}

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (void)setID:(NSString *)ID {    
    [self setCustomValue:ID forKey:kITId];
}

- (NSString *)ID {
    return [self customValueForKey:kITId];
}

- (void)removeID:(NSString *)ID {
    [self removeCustomValue:ID inMutableSetForKey:kITId];
}

#pragma mark -
#pragma mark Forwading

- (id)forwardingTargetForSelector:(SEL)aSelector {
    ITObservableObject *object = self.object;
    
    return [object respondsToSelector:aSelector] ? object : nil;
}

#pragma mark -
#pragma mark ITDBObjectObserver

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ITDBObjectDidUnload:
            return @selector(objectDidUnload:);
            
        case ITDBObjectDidLoad:
            return @selector(objectDidLoad:);
            
        case ITDBObjectDidFailLoading:
            return @selector(objectDidFailLoading:);
            
        case ITDBObjectDidLoadID:
            return @selector(objectDidLoadID:);
            
        case ITDBObjectDidLoadFriends:
            return @selector(objectDidLoadFriends:);
            
        case ITDBObjectDidLoadDetails:
            return @selector(objectDidLoadDetails:);
            
        default:
            return [self.object selectorForState:state];
    }
}

@end
