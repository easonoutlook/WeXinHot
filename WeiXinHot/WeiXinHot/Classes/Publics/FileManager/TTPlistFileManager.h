//
//  TTPlistFileManager.h
//  QVOD
//
//  Created by Eason on 23/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTPlistFileManager : NSObject

+ (id)sharedManager;

- (BOOL)writePlistFileWithName:(NSString*)pName data:(NSDictionary*)pData;

- (NSDictionary*)readPlistFileWithName:(NSString*)pName;

- (void)writeNewCoinValueToPlist:(int)nCoin;

- (int)readNewCoinValueFromPlist;

@end
