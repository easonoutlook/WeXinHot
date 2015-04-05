//
//  TTPlistFileManager.m
//  QVOD
//
//  Created by Eason on 23/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "TTPlistFileManager.h"

#define kTTCoinPlist @"coin.plist"

@implementation TTPlistFileManager

#pragma Init Singleton

+ (id)sharedManager
{
    static TTPlistFileManager* sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] initSingleton];
    });
    return sharedMyManager;
}

// init singleton call init from NSObject
- (id)initSingleton
{
    self = [super init];
    if (self) {
        TTDEBUGLOG(@"shared plist file manager create.");
    }
    return self;
}

- (id)init
{
    return [TTPlistFileManager sharedManager];
}

- (NSString*)sandboxDocumentsPath
{
    // get paths from root direcory
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString* documentsPath = [paths objectAtIndex:0];

    return documentsPath;
}

#pragma Data Manipulate
- (BOOL)writePlistFileWithName:(NSString*)pName data:(NSDictionary*)pData
{
    NSString* plistPath = [[self sandboxDocumentsPath] stringByAppendingPathComponent:pName];

    // This writes the array to a plist file. If this file does not already exist, it creates a new one.
    return [pData writeToFile:plistPath atomically:TRUE];
}

- (NSDictionary*)readPlistFileWithName:(NSString*)pName
{
    NSString* plistPath = [[self sandboxDocumentsPath] stringByAppendingPathComponent:pName];

    return [NSDictionary dictionaryWithContentsOfFile:plistPath];
}

- (void)writeNewCoinValueToPlist:(int)nCoin
{
    NSDictionary* coinDictionary = @{ @"coin" :
                                          [NSNumber numberWithInt:nCoin] };
    [self writePlistFileWithName:kTTCoinPlist data:coinDictionary];
}

- (int)readNewCoinValueFromPlist
{
    NSString* coinPlistPath = [[self sandboxDocumentsPath] stringByAppendingPathComponent:kTTCoinPlist];
    if (![[NSFileManager defaultManager] fileExistsAtPath:coinPlistPath]) {
        // plist file exist
        [self writeNewCoinValueToPlist:0];
    }
    NSDictionary* coinDictionary = [self readPlistFileWithName:kTTCoinPlist];
    return [[coinDictionary objectForKey:@"coin"] intValue];
}

@end
