//
//  NSMutableArray+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 26.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ITExtensions)

- (void)moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)newIndex;

@end
