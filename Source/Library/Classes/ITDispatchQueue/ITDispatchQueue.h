//
//  ITDispatchQueue.h
//  ITSources
//
//  Created by Ivan Tsyganok on 13.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ITGCDBlock)(void);

typedef NSUInteger ITDelayInSeconds;

typedef enum {
    ITDispatchQueueHighPriority        = QOS_CLASS_USER_INITIATED,
    ITDispatchQueueDefaultPriority     = QOS_CLASS_DEFAULT,
    ITDispatchQueueLowPriority         = QOS_CLASS_UTILITY,
    ITDispatchQueueBackgroundPriority  = QOS_CLASS_BACKGROUND
} ITDispatchQueuePriority;

void ITAsyncPerformInBackgroundQueue(ITGCDBlock block);
void ITAsyncPerformInQueue(ITDispatchQueuePriority type, ITGCDBlock block);
void ITAsyncPerformInMainQueue(ITGCDBlock block);

void ITSyncPerformInBackgroundQueue(ITGCDBlock block);
void ITSyncPerformInQueue(ITDispatchQueuePriority type, ITGCDBlock block);
void ITSyncPerformInMainQueue(ITGCDBlock block);

void ITDispatchAfter(NSTimeInterval delay, ITDispatchQueuePriority type, ITGCDBlock block);

dispatch_queue_t ITGetDispatchGlobalQueueWithType(ITDispatchQueuePriority type);

