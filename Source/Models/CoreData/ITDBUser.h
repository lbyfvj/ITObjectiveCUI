//
//  ITDBUser.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 18.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDBObject.h"

@class ITDBImage;

@interface ITDBUser : ITDBObject
@property (nonatomic, strong)   NSString    *firstName;
@property (nonatomic, strong)   NSString    *lastName;
@property (nonatomic, strong)   NSSet       *friends;
@property (nonatomic, strong)   NSSet       *images;

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
