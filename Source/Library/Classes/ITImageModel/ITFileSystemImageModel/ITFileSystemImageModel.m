//
//  ITFileSystemImageModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFileSystemImageModel.h"

#import "NSFileManager+ITExtensions.h"
#import "NSString+ITExtensions.h"

@interface ITFileSystemImageModel ()

@end

@implementation ITFileSystemImageModel

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletionBlock:(void (^)(UIImage *image, id error))block {
    NSData *data = [NSData dataWithContentsOfURL:self.url
                                         options:NSDataReadingMappedIfSafe
                                           error:nil];
    
    UIImage *image = [UIImage imageWithData:data];
    
    ITDispatchBlock(block, image, nil);
}

#pragma mark -
#pragma mark Private

@end
