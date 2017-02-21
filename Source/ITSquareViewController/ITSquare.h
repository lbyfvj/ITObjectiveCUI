//
//  ITSquare.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 21.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ITSquarePosition){
    ITTopLeftCorner,
    ITTopRightCorner,
    ITBottomRightCorner,
    ITBottonLeftCorner
};

@interface ITSquare : NSObject
@property (nonatomic, assign)   ITSquarePosition    squarePosition;

- (instancetype)initWithSquarePosition:(ITSquarePosition)squarePosition;

@end
