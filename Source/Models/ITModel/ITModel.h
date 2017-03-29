//
//  ITModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITObservableObject.h"

typedef NS_ENUM(NSUInteger, ITModelState) {
    ITModelUnloaded,
    ITModelLoaded,
    ITModelLoading,
    ITModelFailedLoading,
    ITModelStateCount
};

@interface ITModel : ITObservableObject
@property (nonatomic, readonly)     NSString    *path;

- (NSString *)path;

- (void)load;
- (void)save;

// this method for subclassing only. it should never called directly
- (void)performLoading;

@end

@protocol ITModelObserver <NSObject>
@optional
- (void)modelDidUnload:(ITModel *)model;
- (void)modelDidLoad:(ITModel *)model;
- (void)modelWillLoad:(ITModel *)model;
- (void)modelDidFailLoading:(ITModel *)model;

@end
