//
//  ITDispatchQueue.m
//  ITSources
//
//  Created by Ivan Tsyganok on 13.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDispatchQueue.h"

static inline dispatch_time_t ITTimeDelay(NSTimeInterval delay) {
    int64_t time = (int64_t)(NSEC_PER_SEC * delay);
    return dispatch_time(DISPATCH_TIME_NOW, time);
}

void ITAsyncPerformInBackgroundQueue(ITGCDBlock block) {
    ITAsyncPerformInQueue(ITDispatchQueueBackgroundPriority, block);
}

void ITAsyncPerformInQueue(ITDispatchQueuePriority type, ITGCDBlock block) {
    dispatch_async(ITGetDispatchGlobalQueueWithType(type), block);
}

void ITAsyncPerformInMainQueue(ITGCDBlock block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void ITSyncPerformInBackgroundQueue(ITGCDBlock block) {
    ITSyncPerformInQueue(ITDispatchQueueBackgroundPriority, block);
}

void ITSyncPerformInQueue(ITDispatchQueuePriority type, ITGCDBlock block) {
    dispatch_sync(ITGetDispatchGlobalQueueWithType(type), block);
}

void ITSyncPerformInMainQueue(ITGCDBlock block) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

dispatch_queue_t ITGetDispatchGlobalQueueWithType(ITDispatchQueuePriority type) {
    return dispatch_get_global_queue(type, 0);
}

void ITDispatchAfter(NSTimeInterval delay, ITDispatchQueuePriority type, ITGCDBlock block) {
    if (!block) {
       return; 
    }
    
    __block BOOL cancelled = NO;
    
    void (^executedBlock)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        
        if (!cancelled) {
            block();
        }
    };
    
    executedBlock = [executedBlock copy];
    
    dispatch_after(ITTimeDelay(delay), ITGetDispatchGlobalQueueWithType(type), ^{
        executedBlock(NO);
    });
}

void ITCancelDispatchBlock(ITGCDBlock block) {
    if (!block) {
       return;
    }
    
    void (^executedBlock)(BOOL) = (void(^)(BOOL))block;
    executedBlock(YES);
}

