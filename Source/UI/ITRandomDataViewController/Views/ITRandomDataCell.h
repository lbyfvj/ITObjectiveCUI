//
//  ITRandomDataCell.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ITRandomData;

@interface ITRandomDataCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet    UILabel         *stringLabel;
@property (nonatomic, strong)   IBOutlet    UIImageView     *image;

@property (nonatomic, strong)   ITRandomData    *randomData;

- (void)fillWithDataModel:(ITRandomData *)data;

@end
