//
//  ITDBImage.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 18.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDBImage.h"

@implementation ITDBImage

@dynamic url;
@dynamic imageModel;

#pragma mark -
#pragma mark Accessores

- (NSURL *)url {
    return [NSURL URLWithString:self.ID];
}

- (ITImageModel *)imageModel {
    return [ITImageModel imageWithURL:self.url];
}

@end
