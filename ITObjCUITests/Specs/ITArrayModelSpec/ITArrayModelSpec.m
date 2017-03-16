//
//  ITArrayModelSpec.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 15.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "Kiwi.h"

#import "ITArrayModel.h"

static const NSUInteger kITArrayModelCount = 8;

SPEC_BEGIN(ITArrayModelSpec)

describe(@"ITArrayModel", ^{
    __block ITArrayModel *modelArray = [ITArrayModel new];
    
    context(@"After object at index 2 move to index 5", ^{
        beforeAll(^{
            for(NSUInteger i = 0; i < kITArrayModelCount; i++) {
                [modelArray addObject:@(i)];
            }

            [modelArray moveObjectAtIndex:2 toIndex:5];
            
        });
        
        it(@"should have count of 8", ^{
            [[modelArray should] haveCountOf:(NSUInteger)kITArrayModelCount];
        });
        
        it(@"should contain @(2) at index 5", ^{
            
            [[modelArray[5] should] equal:@(2)];
        });
        
        it(@"should contain @(3) at index 2", ^{
            [[modelArray[2] should] equal:@(3)];
        });
        
        it(@"should contain @(7) at index 7", ^{
            [[modelArray[7] should] equal:@(7)];
        });
    });
});

SPEC_END
