//
//  ITUser.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUser.h"

static NSString * const kITCoderUserId = @"CoderUserId";
static NSString * const kITCoderFirstName = @"CoderFirstName";
static NSString * const kITCoderLastName = @"CoderLastName";
static NSString * const kITCoderImageURL = @"CoderImageURL";
static NSString * const kITImageURL = @"http://www.head.com/fileadmin/content/sports/ski/category_page/desktop/HEAD_Desktop_SKI_Landing_Page_05_50_50_Supershapev3.jpg";

@implementation ITUser

@dynamic imageModel;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.friends = [ITArrayModel new];
    }
    return self;
}

#pragma mark - 
#pragma mark Accessors

- (void)setUserId:(NSString *)userId {
    if (_userId != userId) {
        _userId = userId;
        
        self.state = ITUserDidLoad;
    }
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (ITImageModel *)imageModel {
    return [ITImageModel imageWithURL:self.imageURL];
}

#pragma mark -
#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _userId = [aDecoder decodeObjectForKey:kITCoderUserId];
        _firstName = [aDecoder decodeObjectForKey:kITCoderFirstName];
        _lastName = [aDecoder decodeObjectForKey:kITCoderLastName];
        _imageURL = [aDecoder decodeObjectForKey:kITCoderImageURL];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_userId forKey:kITCoderUserId];
    [aCoder encodeObject:_firstName forKey:kITCoderFirstName];
    [aCoder encodeObject:_lastName forKey:kITCoderLastName];
    [aCoder encodeObject:_imageURL forKey:kITCoderImageURL];
}

#pragma mark -
#pragma mark ITModel

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = NULL;
    
    switch (state) {
        case ITUserDidLoad:
            selector = @selector(userDidLoad:);
            break;
            
        default:
            selector = [super selectorForState:state];
            break;
    }
    
    return selector;
}

@end
