//
//  ITImageView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITImageView.h"

#import "ITObservableObject.h"

@interface ITImageView ()
@property (nonatomic, strong)   ITObservableObject  *observer;

- (void)initSubviews;

@end

@implementation ITImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.contentImageView = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.contentImageView) {
        [self initSubviews];
    }
}

#pragma mark -
#pragma mark Accessors

- (void)setContentImageView:(UIImageView *)contentImageView {
    if (_contentImageView != contentImageView) {
        [_contentImageView removeFromSuperview];
        _contentImageView = contentImageView;
        [self addSubview:contentImageView];
    }
}

- (void)setImageModel:(ITImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
        
        _imageModel = imageModel;
        
        [_imageModel addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle


#pragma mark -
#pragma mark Private

- (void)initSubviews {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
                              |  UIViewAutoresizingFlexibleLeftMargin
                              |  UIViewAutoresizingFlexibleWidth
                              |  UIViewAutoresizingFlexibleRightMargin
                              |  UIViewAutoresizingFlexibleTopMargin
                              |  UIViewAutoresizingFlexibleHeight
                              |  UIViewAutoresizingFlexibleBottomMargin;
    self.contentImageView = imageView;

}


@end
