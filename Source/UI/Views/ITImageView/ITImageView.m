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
        [_imageModel dump];
        
        [_imageModel removeObserver:self];
        
        _imageModel = imageModel;
        
        [_imageModel addObserver:self];
        
        [imageModel load];
    }
}

#pragma mark -
#pragma mark ITAbstractModelObserver

- (void)abstractModelDidUnload:(ITImageModel *)imageModel {
    ITWeakify(self);
    ITAsyncPerformInMainQueue(^{
        ITStrongifyAndReturnIfNil(self);
        self.contentImageView.image = imageModel.image;
    });
}

- (void)abstractModelDidLoad:(ITImageModel *)imageModel {
    ITWeakify(self);
    ITAsyncPerformInMainQueue(^{
        ITStrongifyAndReturnIfNil(self);
        self.contentImageView.image = imageModel.image;
    });
    [self hideLoadingView];
}

- (void)abstractModelWillLoad:(ITImageModel *)imageModel {
    [self showLoadingView];
}

- (void)abstractModelDidFailLoading:(ITImageModel *)imageModel {
    ITWeakify(self);
    ITAsyncPerformInMainQueue(^{
        ITStrongifyAndReturnIfNil(self);
        [self.imageModel load];
    });
}

@end
