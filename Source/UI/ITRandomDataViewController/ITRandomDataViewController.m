//
//  ITRandomDataViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITRandomDataViewController.h"

#import "ITRandomDataView.h"

#import "ITRandomDataCell.h"

@interface ITRandomDataViewController ()
@property (nonatomic, readonly)     ITRandomDataView    *randomDataView;

@end

@implementation ITRandomDataViewController

@dynamic randomDataView;

#pragma mark -
#pragma mark Accessors

- (void)setRandomData:(ITRandomData *)randomData {
    if (_randomData != randomData) {
        _randomData = randomData;
    }
    
    self.randomDataView.randomData = randomData;
}

- (ITRandomDataView *)randomDataView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[ITRandomDataView class]]) {
        return (ITRandomDataView *)self.view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellClass = NSStringFromClass([ITRandomDataCell class]);
    
    ITRandomDataCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:cellClass bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    cell.randomData = self.randomData;
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.randomDataView.string = self.string;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
