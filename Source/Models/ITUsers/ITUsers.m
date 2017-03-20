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

#import "ITDispatchQueue.h"

static const NSUInteger kITUsersCount = 10;
static NSString * const kITUsersArray  = @"UsersArray";

@interface ITUsers ()
@property (nonatomic, strong)   NSMutableArray  *users;

- (void)generateUsers;

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

- (void)load {
    NSData *userData = [[NSUserDefaults standardUserDefaults] objectForKey:kITUsersArray];
    
    @synchronized(self) {
        NSUInteger state = self.state;
        
        if (ITArrayModelLoaded == state || ITArrayModelLoading == state) {
            [self notifyOfState:state];
            return;
        }
        
        self.state = ITArrayModelLoading;
    }
    
    ITAsyncPerformInBackgroundQueue(^{
        if (userData) {
            NSArray *objects = [NSKeyedUnarchiver unarchiveObjectWithData:userData];
            for (id object in objects) {
                [self addObject:object];
            }
        }
        
        [self generateUsers];
        
        self.state = ITArrayModelLoaded;
    });
}

- (void)save {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.users] forKey:kITUsersArray];
    [userDefaults synchronize];
    
}

#pragma mark -
#pragma mark - Private

- (void)generateUsers {
    for (NSUInteger i = 0; i < kITUsersCount; i++) {
        [self addObject:[ITUser new]];
    }
}

@end
