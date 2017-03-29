//
//  ITImageModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITModel.h"

#import "ITMacro.h"

@interface ITImageModel : ITModel
@property (nonatomic, strong)     UIImage     *image;
@property (nonatomic, strong)     NSURL       *url;

@property (nonatomic, readonly, getter=isLoaded)    BOOL    loaded;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

- (void)dump;

- (void)save;

- (void)performLoadingWithCompletionBlock:(void(^)(UIImage *image, id error))block;

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error;

- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error;

@end
