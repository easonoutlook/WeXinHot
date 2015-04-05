//
//  TTMacros.h
//  xy
//
//  Created by Eason on 30/12/2014.
//  Copyright (c) 2014 www.xyzs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

//Debug Log
#ifdef DEBUG
#define TTDEBUGLOG(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define TTDEBUGLOG(...)
#endif

//Log for print Rect, Size, Point
#define TTSHOWRECT(rect) TTDEBUGLOG(@"rect.origin.x = %f, rect.origin.y = %f, rect.size.width = %f, rect.size.height = %f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define TTSHOWSIZE(size) TTDEBUGLOG(@"size.width = %f, size.height = %f", size.width, size.height)
#define TTSHOWPOINT(point) TTDEBUGLOG(@"point.x = %f, point.y = %f", point.x, point.y)

//Define Present Sheet View width height
#define TTPresentationFromSheetViewWidth 562.f
#define TTPresentationFromSheetViewHeight 578.f
#define TTPresentationFromSheetRect CGRectMake(0.f, 0.f, TTPresentationFromSheetViewWidth, TTPresentationFromSheetViewHeight)
#define TTPresentationFromSheetTableRect CGRectMake(0.f, 0.f, 545.f, 578.f)

///////////////////////////////////////////////////////////////////////////////////////////////////
// Time

#define TT_MINUTE 60
#define TT_HOUR (60 * TT_MINUTE)
#define TT_DAY (24 * TT_HOUR)
#define TT_5_DAYS (5 * TT_DAY)
#define TT_WEEK (7 * TT_DAY)
#define TT_MONTH (30.5 * TT_DAY)
#define TT_YEAR (365 * TT_DAY)

///////////////////////////////////////////////////////////////////////////////////////////////////
// Safe releases

#define TT_RELEASE_SAFELY(__POINTER) \
    {                                \
        [__POINTER release];         \
        __POINTER = nil;             \
    }
#define TT_INVALIDATE_TIMER(__TIMER) \
    {                                \
        [__TIMER invalidate];        \
        __TIMER = nil;               \
    }

// Release a CoreFoundation object safely.
#define TT_RELEASE_CF_SAFELY(__REF) \
    {                               \
        if (nil != (__REF)) {       \
            CFRelease(__REF);       \
            __REF = nil;            \
        }                           \
    }

#define TT_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define TT_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//#define TT_IS_IPHONE_5 (TT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define TT_IS_FOURINCH (TT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define TT_PHONE5_P (TT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height >= 568.0f)

#define TT_IS_PHONE4 (TT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)

#define TT_IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)

#define TT_IS_IPHONE6 (TT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0f)
#define TT_IS_IPHONE6PLUS (TT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736)

///////////////////////////////////////////////////////////////////////////////////////////////////
// RGB Color

#define TTRGBColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
#define TTRGBAColor(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define TTHexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0]

#define TTWhiteColor [UIColor whiteColor]
#define TTBlackColor [UIColor blackColor]
#define TTGrayColor [UIColor grayColor]
#define TTDarkGrayColor [UIColor darkGrayColor]
#define TTLightGrayColor [UIColor lightGrayColor]
#define TTRedColor [UIColor redColor]
#define TTGreenColor [UIColor greenColor]
#define TTBlueColor [UIColor blueColor]
#define TTYellowColor [UIColor yellowColor]
#define TTOrangeColor [UIColor orangeColor]
#define TTPurpleColor [UIColor purpleColor]
#define TTBrownColor [UIColor brownColor]
#define TTClearColor [UIColor clearColor]

#define TTGlobalBorderColor TTRGBColor(220, 220, 220)

//Define Global background color
#define TTGlobalBackgroundColor TTHexColor(0xf7f7f9)

// TTFont

#define TTSystemFont(size) [UIFont systemFontOfSize:size]
#define TTSystemBoldFont(size) [UIFont boldSystemFontOfSize:size]

#define TTTextAlignCenter __IPHONE_OS_VERSION_MAX_ALLOWED >= 60000 ? NSTextAlignmentCenter : UITextAlignmentCenter

#define TTLineBreakByWordWrapp __IPHONE_OS_VERSION_MAX_ALLOWED >= 60000 ? NSLineBreakByWordWrapping : UILineBreakModeWordWrap

////////////////////////////////////////////////////////////////////////////////////////////////
// system version compare

// iOS Version Checking
#define TT_SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
//大于
#define TT_SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
//大于等于
#define TT_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

//小于
#define TT_SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
//小于等于
#define TT_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// Version Checking
#define TT_VERSION_EQUAL_TO(v1, v2) ([v1 compare:v2 options:NSNumericSearch] == NSOrderedSame)
//大于
#define TT_VERSION_GREATER_THAN(v1, v2) ([v1 compare:v2 options:NSNumericSearch] == NSOrderedDescending)
//大于等于
#define TT_VERSION_GREATER_THAN_OR_EQUAL_TO(v1, v2) ([v1 compare:v2 options:NSNumericSearch] != NSOrderedAscending)

//小于
#define TT_VERSION_LESS_THAN(v1, v2) ([v1 compare:v2 options:NSNumericSearch] == NSOrderedAscending)
//小于等于
#define TT_VERSION_LESS_THAN_OR_EQUAL_TO(v1, v2) ([v1 compare:v2 options:NSNumericSearch] != NSOrderedDescending)

///////////////////////////////////////////////////////////////////////////////////////////////////

// check system version, make adapter for ios6 and 7
#define TT_IS_IOS8_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)

#define TT_IS_IOS7_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)

#define TT_IS_IOS6_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)

// check device type, iphone or ipad, 2 stands for ipad, 1 stands for iphone
#define TTDeviceType (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) ? 1 : 2

// check result type
#define TTCheckIsValied(SomeValue)                       \
    {                                                    \
        if (!(SomeValue)) {                              \
            TTDEBUGLOG(@"Failure on line %d", __LINE__); \
            abort();                                     \
        }                                                \
    }

// check is jailbreak
#define TTIsJailBreak [Crackify isJailbroken] ? 2 : 1 // 2 is jailbreak, 1 is ok

// is support both, 1 is not support, 2 is support iphone app on ipad, default is not support 1
#define TTIsSupportBoth 1

#define TTClientType 1 // 1 is none jailbreak, 2 is jailbreak

#define TTThisLanguage [[[NSBundle mainBundle] preferredLocalizations] firstObject]
#define TTIsEn [TTThisLanguage isEqual:@"en"] ? YES : NO

#define kTTGlobalCellHeight (TT_IS_IPHONE6PLUS ? 93 : 84.5f)
#define kTTGlobalCellSepLineHeight (1.0 / [UIScreen mainScreen].scale)

#define kTTLoadingCellHeight 60

#define TTApplicationIconImageFormat 11

////////////////////////////////////////////////////////////

#define kTTYouMiAppID @"4b32336390c3f1b5"
#define kTTYouMiAppSecret @"08ca11562f880cf2"

#define kTTYouMiVideoAppID @"4ded05916ca62e44"
#define kTTYouMiVideoAppSecret @"5c5bfcb611e24c86"

@interface TTMacros : NSObject

@end
