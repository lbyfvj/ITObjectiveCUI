//
//  ITUsers.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITUser;

@interface ITUsers : NSObject <NSFastEnumeration>

- (NSUInteger)count;

- (void)addUser;

- (void)removeUserAtIndex:(NSUInteger)index;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
