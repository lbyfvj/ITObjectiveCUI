//
//  ITSquareView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 21.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ITSquarePosition){
    ITTopLeftCorner,
    ITTopRightCorner,
    ITBottomRightCorner,
    ITBottomLeftCorner
};

@interface ITSquareView : UIView
@property (nonatomic, strong)   IBOutlet    UILabel     *label;
@property (nonatomic, strong)   IBOutlet    UIButton    *nextButton;

@property (nonatomic, assign)	ITSquarePosition		squarePosition;

- (void)setSquarePosition:(ITSquarePosition)squarePosition
                 animated:(BOOL)animated;

- (void)setSquarePosition:(ITSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(void(^)(void))block;

- (void)moveToNextPosition;

@end
