//
//  ITLoadingView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 17.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ITComletionBlock)(void);

@interface ITLoadingView : UIView
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView  *spinner;
@property (nonatomic, assign, getter=isVisible)     BOOL visible;

+ (instancetype)viewOnSuperView:(UIView *)superView;

- (void)setVisible:(BOOL)visible animated:(BOOL)animated;

- (void)setVisible:(BOOL)visible
          animated:(BOOL)animated
 completionHandler:(void (^)(BOOL finished))block;

@end
