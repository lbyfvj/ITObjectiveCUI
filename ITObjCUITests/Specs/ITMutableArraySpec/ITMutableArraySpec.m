//
//  ITMutableArraySpec.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 15.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "Kiwi.h"

#import "NSMutableArray+ITExtensions.h"

static const NSUInteger kITArrayCount = 8;

SPEC_BEGIN(ITMutableArraySpec)

describe(@"ITMutableArray", ^{
    __block NSMutableArray *array = [NSMutableArray new];
    
    context(@"After object at index 2 move to index 5", ^{
        beforeAll(^{
            for(NSUInteger i = 0; i < kITArrayCount; i++) {
                [array addObject:@(i)];
            }
            //0 1 2 3 4 5 6 7
            [array moveObjectAtIndex:2 toIndex:5];
        });
        
        it(@"should have count of 8", ^{
            [[array should] haveCountOf:(NSUInteger)kITArrayCount];
        });
        
        it(@"should contain @(2) at index 5", ^{
            [[array[5] should] equal:@(2)];
        });
        
        it(@"should contain @(3) at index 2", ^{
            [[array[2] should] equal:@(3)];
        });
        
        it(@"should contain @(7) at index 7", ^{
            [[array[7] should] equal:@(7)];
        });
    });
    
    context(@"After object at index 7 move to index 6", ^{
        beforeAll(^{
            for(NSUInteger i = 0; i < kITArrayCount; i++) {
                [array addObject:@(i)];
            }
            
            [array moveObjectAtIndex:7 toIndex:6];
        });
        
        it(@"should have count of 16", ^{
            [[array should] haveCountOf:16];
        });
        
        it(@"should contain @(7) at index 6", ^{
            [[array[6] should] equal:@(7)];
        });
        
        it(@"should contain @(6) at index 7", ^{
            [[array[7] should] equal:@(6)];
        });
    });
    
    context(@"After object at index 0 move to index 1", ^{
        beforeAll(^{
            for(NSUInteger i = 0; i < kITArrayCount; i++) {
                [array addObject:@(i)];
            }
            
            [array moveObjectAtIndex:0 toIndex:1];
        });
        
        it(@"should have count of 24", ^{
            [[array should] haveCountOf:24];
        });
        
        it(@"should contain @(1) at index 0", ^{
            [[array[0] should] equal:@(1)];
        });
        
        it(@"should contain @(0) at index 1", ^{
            [[array[1] should] equal:@(0)];
        });
    });
    
    context(@"After object at index 30 move to index 31", ^{
        beforeAll(^{
            for(NSUInteger i = 0; i < kITArrayCount; i++) {
                [array addObject:@(i)];
            }
            
            [array moveObjectAtIndex:30 toIndex:31];
        });
        
        it(@"should have count of 32", ^{
            [[array should] haveCountOf:32];
        });
        
        it(@"should contain @(7) at index 30", ^{
            [[array[30] should] equal:@(7)];
        });
        
        it(@"should contain @(6) at index 31", ^{
            [[array[31] should] equal:@(6)];
        });
    });
});

SPEC_END
