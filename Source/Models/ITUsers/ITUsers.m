//
//  ITUsers.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsers.h"

#import "ITUser.h"

#import "NSObject+ITExtensions.h"

static const NSUInteger kITUsersCount = 10;
static NSString * const kITUsersArray  = @"UsersArray";

@interface ITUsers ()
@property (nonatomic, strong)   NSMutableArray  *users;

- (void)generateUsers;
- (void)load;

@end

@implementation ITUsers

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedUsers {
    static id sharedUsers = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUsers = [self new];
    });
    
    return sharedUsers;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.users = [NSMutableArray array];
        [self load];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Public

- (void)save {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.users] forKey:kITUsersArray];
    [userDefaults synchronize];
    
}

#pragma mark -
#pragma mark - Private

- (void)load {
    NSData *userData = [[NSUserDefaults standardUserDefaults] objectForKey:kITUsersArray];
    if (userData) {
        NSArray *unarchivedObjects = [NSKeyedUnarchiver unarchiveObjectWithData:userData];
        for (id object in unarchivedObjects) {
            [self addObject:object];
        }
        
        [self setState:ITArrayModelLoaded withObject:nil];
    }
    
    [self generateUsers];
}

- (void)generateUsers {
    for (NSUInteger i = 0; i < kITUsersCount; i++) {
        [self addObject:[ITUser new]];
    }
}

@end
