//
//  ITAbstractModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITObservableObject.h"

typedef NS_ENUM(NSUInteger, ITAbstractModelState) {
    ITAbstractModelUnloaded,
    ITAbstractModelLoaded,
    ITAbstractModelLoading,
    ITAbstractModelFailedLoading
};

@interface ITAbstractModel : ITObservableObject

- (void)load;
- (void)performLoading;

@end

@protocol ITAbstractModelObserver <NSObject>
@optional
- (void)abstractModelDidLoad:(ITAbstractModel *)model;
- (void)abstractModelWillLoad:(ITAbstractModel *)model;
- (void)abstractModelDidFailLoading:(ITAbstractModel *)model;

@end
