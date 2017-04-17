//
//  ITUser.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUser.h"

#import "ITMacro.h"

ITStaticConst(kITCoderUserId);
ITStaticConst(kITCoderFirstName);
ITStaticConst(kITCoderLastName);
ITStaticConst(kITCoderGender);
ITStaticConst(kITCoderImageURL);

static NSString * const kITImageURL = @"http://www.head.com/fileadmin/content/sports/ski/category_page/desktop/HEAD_Desktop_SKI_Landing_Page_05_50_50_Supershapev3.jpg";

@implementation ITUser

@dynamic fullName;
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
#define decode(field, key) field = [aDecoder decodeObjectForKey:key]
        decode(self.userId, kITCoderUserId);
        decode(self.firstName, kITCoderFirstName);
        decode(self.lastName, kITCoderLastName);
        decode(self.gender, kITCoderGender);
        decode(self.imageURL, kITCoderImageURL);
#undef decode
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
#define encode(field, key) [aCoder encodeObject:field forKey:key]
    encode(self.userId, kITCoderUserId);
    encode(self.firstName, kITCoderFirstName);
    encode(self.lastName, kITCoderLastName);
    encode(self.gender, kITCoderGender);
    encode(self.imageURL, kITCoderImageURL);
#undef encode
}

#pragma mark -
#pragma mark ITModel

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = NULL;
    
    switch (state) {
        case ITUserDidLoadFullInfo:
            selector = @selector(userDidLoadFullInfo:);
            break;
            
        default:
            selector = [super selectorForState:state];
            break;
    }
    
    return selector;
}

@end
