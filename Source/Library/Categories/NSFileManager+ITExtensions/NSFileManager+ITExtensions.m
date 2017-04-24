//
//  NSFileManager+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 25.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSFileManager+ITExtensions.h"

#import "ITMacro.h"

@implementation NSFileManager (ITExtensions)

+ (NSURL *)directoryPathWithType:(NSSearchPathDirectory)type {
    return [[[NSFileManager defaultManager] URLsForDirectory:type
                                                   inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)documentsDirectoryURL {
    ITReturnSharedInstance(^{ return [self directoryPathWithType:NSDocumentDirectory]; });
}

+ (NSURL *)libraryDirectoryURL {
    ITReturnSharedInstance(^{ return [self directoryPathWithType:NSLibraryDirectory]; });
}

+ (NSURL *)applicationDirectoryURL {    
    ITReturnSharedInstance(^{ return [self directoryPathWithType:NSApplicationSupportDirectory]; });
}

- (void)copyItemAtURL:(NSURL *)url
                toURL:(NSURL *)toURL
{
    NSError *error = nil;
    
    NSString *path = [toURL URLByDeletingLastPathComponent].path;
    
    if (![self fileExistsAtPath:path]) {
        [self createDirectoryAtPath:path
        withIntermediateDirectories:YES
                         attributes:nil
                              error:&error];
    }
   
    [self copyItemAtURL:url toURL:toURL error:&error];
}

@end
