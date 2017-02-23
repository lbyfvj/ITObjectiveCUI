//
//  ITRandomStringViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITRandomStringViewController.h"

#import "ITRandomStringView.h"

@interface ITRandomStringViewController ()
@property (nonatomic, readonly)     ITRandomStringView    *randomStringView;

@end

@implementation ITRandomStringViewController

@dynamic randomStringView;

#pragma mark -
#pragma mark Accessors

- (void)setRandomString:(ITRandomString *)randomString {
    if (_randomString != randomString) {
        _randomString = randomString;
    }
    
    self.randomStringView.randomString = randomString;
}

- (ITRandomStringView *)randomStringView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[ITRandomStringView class]]) {
        return (ITRandomStringView *)self.view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const kITCellName = @"cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kITCellName];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kITCellName];
    }
    
    cell.textLabel.text = self.randomString.randomString;
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.randomStringView.randomString = self.randomString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
