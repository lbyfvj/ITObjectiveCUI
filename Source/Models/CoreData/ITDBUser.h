//
//  ITDBUser.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 18.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDBObject.h"

#import "ITArrayModel.h"
#import "ITDBArrayObject.h"

#import "ITObservableObject.h"
#import "ITDBImage.h"

@interface ITDBUser : ITDBObject <ITObservableObject>
@property (nonatomic, strong)   NSString        *firstName;
@property (nonatomic, strong)   NSString        *lastName;
@property (nonatomic, readonly) NSString        *fullName;

@property (nonatomic, strong)   NSSet           *friendsSet;
@property (nonatomic, strong)   ITDBArrayObject *friends;

@property (nonatomic, strong)   ITDBImage       *picture;
@property (nonatomic, strong)   NSSet           *photos;

@end

@interface ITDBUser (CoreDataGeneratedAccessors)

- (void)addFriend:(ITDBUser *)value;
- (void)removeFriend:(ITDBUser *)value;
- (void)addFriends:(NSSet *)values;
- (void)removeFriends:(NSSet *)values;

- (void)addImage:(ITDBImage *)value;
- (void)removeImage:(ITDBImage *)value;
- (void)addImages:(NSSet *)values;
- (void)removeImages:(NSSet *)values;

@end
