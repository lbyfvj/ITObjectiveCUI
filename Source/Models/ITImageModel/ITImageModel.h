//
//  ITImageModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITObservableObject.h"

@interface ITImageModel : ITObservableObject
@property (nonatomic, readonly)     UIImage     *image;
@property (nonatomic, readonly)     NSURL       *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

@end
