//
//  ITModelChange.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 13.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITModelChange : NSObject

+ (id)insertAtIndex:(NSUInteger)index;
+ (id)deleteAtIndex:(NSUInteger)index;
+ (id)moveAtIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;

@end
