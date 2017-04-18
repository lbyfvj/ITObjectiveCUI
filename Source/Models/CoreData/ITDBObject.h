//
//  ITDBObject.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 18.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "ITObservableObject.h"

typedef NS_ENUM(NSUInteger, ITDBObjectState) {
    ITDBObjectDidUnload,
    ITDBObjectDidLoad,
    ITDBObjectDidFailLoading,
    ITDBObjectDidLoadID,
    ITDBObjectDidLoadFriends,
    ITDBObjectDidLoadDetails
};

@interface ITDBObject : NSManagedObject <ITObservableObjectMixin>
@property (nonatomic, strong)   NSString    *ID;

+ (id)managedObjectWithID:(NSString *)ID;

@end
