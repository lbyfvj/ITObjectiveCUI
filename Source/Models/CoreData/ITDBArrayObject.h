//
//  ITDBArrayObject.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 22.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "ITArrayModel.h"

@interface ITDBArrayObject : ITArrayModel <NSFetchedResultsControllerDelegate>

- (instancetype)initFetchedResultsControllerWithManagedObject:(NSManagedObject *)managedObject;

@end
