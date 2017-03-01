//
//  ITImageModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITImageModel.h"

@interface ITImageModel ()
@property (nonatomic, strong)     UIImage     *image;
@property (nonatomic, strong)     NSURL       *url;

@end

@implementation ITImageModel

#pragma mark - 
#pragma marl Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    
    return [[self alloc] initWithURL:url];
}

#pragma mark - 
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}


@end
