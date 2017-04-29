//
//  ITDBObject.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 18.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "ActiveRecordKit.h"

#import "ITMacro.h"

typedef NS_ENUM(NSUInteger, ITDBObjectState) {
    ITDBObjectDidUnload,
    ITDBObjectDidLoad,
    ITDBObjectDidFailLoading,
    ITDBObjectDidLoadID,
    ITDBObjectDidLoadFriends,
    ITDBObjectDidLoadDetails
};

@class ITDBUser;

@protocol ITDBObjectObserver <NSObject>

@optional
- (void)objectDidUnload:(ITDBUser *)user;
- (void)objectDidLoad:(ITDBUser *)user;
- (void)objectDidLoadID:(ITDBUser *)user;
- (void)objectDidFailLoading:(ITDBUser *)user;
- (void)objectDidLoadFriends:(ITDBUser *)user;
- (void)objectDidLoadDetails:(ITDBUser *)user;

@end

@interface ITDBObject : NSManagedObject <ITObservableObject>
@property (nonatomic, strong)   NSString    *ID;

+ (id)managedObjectWithID:(NSString *)ID;

@end
