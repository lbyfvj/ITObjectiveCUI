//
//  NSFileManager+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 25.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSFileManager+ITExtensions.h"

#import "ITMacro.h"

kITStaticConstWithValue(kITCacheDirectoryName, @"appCache");

@implementation NSFileManager (ITExtensions)

+ (NSURL *)directoryPathWithType:(NSSearchPathDirectory)type {
    return [[[NSFileManager defaultManager] URLsForDirectory:type
                                                   inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)documentsDirectoryURL {
    ITReturnSharedInstance(^{ return ITDirectoryPathWithType(NSDocumentDirectory); });
}

+ (NSURL *)libraryDirectoryURL {
    ITReturnSharedInstance(^{ return ITDirectoryPathWithType(NSLibraryDirectory); });
}

+ (NSURL *)applicationDirectoryURL {    
    ITReturnSharedInstance(^{ return ITDirectoryPathWithType(NSApplicationSupportDirectory); });
}

+ (NSURL *)appCacheDirectoryURL {
    
    ITReturnSharedInstance(^{
        NSURL *libaryDirectoryURL = [NSFileManager libraryDirectoryURL];
        
        NSURL *cacheDirectoryURL = [libaryDirectoryURL URLByAppendingPathComponent:kITCacheDirectoryName];
        
        NSFileManager *fileManager = [self defaultManager];
        
        [fileManager createDirectoryAtURL:cacheDirectoryURL];
        
        return cacheDirectoryURL;
    });
}

- (void)createDirectoryAtURL:(NSURL *)url {
    if (url.isFileURL) {
        NSString *path = url.path;
        if (![self fileExistsAtPath:path]) {
            [self createDirectoryAtPath:path
            withIntermediateDirectories:YES
                             attributes:nil
                                  error:NULL];
        }
    }
}

- (void)copyItemAtURL:(NSURL *)url
                toURL:(NSURL *)toURL
{
    NSError *error = nil;
    
    [self createDirectoryAtURL:[toURL URLByDeletingLastPathComponent]];
   
    [self copyItemAtURL:url toURL:toURL error:&error];
}

@end
