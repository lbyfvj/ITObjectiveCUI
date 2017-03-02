//
//  ITImageModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITObservableObject.h"

typedef NS_ENUM(NSUInteger, ITImageModelState) {
    ITImageModelUnloaded,
    ITImageModelLoading,
    ITImageModelLoaded,
    ITImageModelFailedLoading
};

@interface ITImageModel : ITObservableObject
@property (nonatomic, readonly)     UIImage     *image;
@property (nonatomic, readonly)     NSURL       *url;

@property (nonatomic, readonly, getter=isLoaded)    BOOL    loaded;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

- (void)load;

- (void)dump;

@end
