//
//  ITUser.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUser.h"

#import "NSString+ITRandomName.h"

static NSString * const kITCoderName = @"CoderName";
static NSString * const kITImageURL = @"http://www.head.com/fileadmin/content/sports/ski/category_page/desktop/HEAD_Desktop_SKI_Landing_Page_05_50_50_Supershapev3.jpg";

@implementation ITUser

@dynamic imageModel;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
    }
    return self;
}

#pragma mark - 
#pragma mark Accessors

- (ITImageModel *)imageModel {
    NSURL *url = [NSURL URLWithString:kITImageURL];
    
    return [ITImageModel imageWithURL:url];
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
