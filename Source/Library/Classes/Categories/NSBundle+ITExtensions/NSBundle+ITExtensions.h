//
//  NSBundle+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 15.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSBundle (ITExtensions)

- (id)objectWithClass:(Class)class;
- (id)objectWithClass:(Class)class withOwner:(id)owner;
- (id)objectWithClass:(Class)class withOwner:(id)owner withOptions:(NSDictionary *)options;

@end
