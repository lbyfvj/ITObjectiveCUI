//
//  ITRandomDataCell.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITRandomDataCell.h"

#import "ITRandomData.h"

@implementation ITRandomDataCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark -
#pragma mark Accessors

- (void)setRandomData:(ITRandomData *)randomData {
    if (_randomData != randomData) {
        _randomData = randomData;
    }
    
    [self fillWithDataModel:randomData];
}

#pragma mark -
#pragma mark Public

- (void)fillWithDataModel:(ITRandomData *)data {
    self.stringLabel.text = data.string;
    self.image.image = data.image;
}

@end
