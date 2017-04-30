//
//  ITImageView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITImageView.h"

#import "ITMacro.h"
#import "ITDispatchQueue.h"

@interface ITImageView ()

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

- (void)initSubviews {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
        |  UIViewAutoresizingFlexibleWidth
        |  UIViewAutoresizingFlexibleHeight;
    
    self.contentImageView = imageView;
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
        self.contentImageView.image = nil;
        
        [_imageModel removeObserverObject:self];
        
        _imageModel = imageModel;
        
        [_imageModel addObserverObject:self];
        
        [imageModel load];
    }
}

#pragma mark -
#pragma mark ITModelObserver

- (void)modelDidLoad:(ITImageModel *)imageModel {
    //ITPrintDebugLog;
    ITWeakify(self);
    ITAsyncPerformInMainQueue(^{
        ITStrongifyAndReturnIfNil(self);
        self.contentImageView.image = imageModel.image;
        [self.spinner stopAnimating];
    });
}

- (void)modelWillLoad:(ITImageModel *)imageModel {
    //ITPrintDebugLog;
    ITWeakify(self);
    ITAsyncPerformInMainQueue(^{
        ITStrongifyAndReturnIfNil(self);
        [self.spinner startAnimating];
    });
}

- (void)modelDidFailLoading:(ITImageModel *)imageModel {
    //ITPrintDebugLog;
    ITWeakify(self);
    ITAsyncPerformInMainQueue(^{
        ITStrongifyAndReturnIfNil(self);
        [self.imageModel load];
    });
}

@end
