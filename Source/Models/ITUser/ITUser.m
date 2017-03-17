//
//  ITUser.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUser.h"

#import "NSString+ITRandomName.h"

static NSString * const kITImageName = @"image";
static NSString * const kITImageType = @"jpg";
static NSString * const kITCoderName = @"CoderName";

@implementation ITUser

@dynamic image;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
        self.imageURL = [[NSBundle mainBundle] URLForResource:kITImageName
                                                withExtension:kITImageType];
    }
    return self;
}

#pragma mark - 
#pragma mark Accessors


- (ITImageModel *)image {
//    NSURL *url = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%@", kITImageName]
//                                         withExtension:[NSString stringWithFormat:@"%@", kITImageType]];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:kITImageName
//                                                     ofType:kITImageType];
//    
//    return [UIImage imageWithContentsOfFile:path];
    return [ITImageModel imageWithURL:self.imageURL];
    
}

#pragma mark -
#pragma mark NSCoding protocol

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:kITCoderName];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:kITCoderName];
}

@end
