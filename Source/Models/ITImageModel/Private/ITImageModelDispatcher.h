//
//  ITImageModelDispatcher.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITImageModelDispatcher : NSObject
@property (nonatomic, readonly)     NSOperationQueue    *queue;

+ (instancetype)sharedDispatcher;

@end
