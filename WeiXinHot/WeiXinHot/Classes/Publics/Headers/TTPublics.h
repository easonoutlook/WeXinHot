//
//  TTPublics.h
//  xy
//
//  Created by Eason on 30/12/2014.
//  Copyright (c) 2014 www.xyzs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

// define width, height
#define TTScreenHeight [[UIScreen mainScreen] bounds].size.height
#define TTScreenWidth [[UIScreen mainScreen] bounds].size.width
#define TTMainScale [UIScreen mainScreen].scale

#define TTSegmentedControlHeight 29.f
#define TTSegmentedControlIndictorHeight 3.f
#define TTTabBarHeight 50.f

#define TTRecommendPageSegmentCount 3
#define TTSoftwarePageSegmentCount 4
#define TTGamesPageSegmentCount 4
#define TTUpdatePageSegmentCount 4

// global colors
#define TTGlobalColor TTRGBColor(220, 55, 58) // global color

#define TTGlobalInstallColor TTRGBColor(114, 174, 41)
#define TTGlobalDownloadColor TTRGBColor(108, 172, 21)
#define TTGlobalDownloadingColor TTRGBColor(128, 183, 211)
#define TTGlobalUpdateColor TTHexColor(0x00c75a)
#define TTGlobalPauseColor TTRGBColor(206, 94, 94)

// recommend type

#define kTTHotRecommendPositon 1
#define kTTSoftRecommendPositon 2
#define kTTSoftDailyRecommendPositon 3
#define kTTSoftEssentialRecommendPositon 4
#define kTTGameRecommendPositon 5
#define kTTGameDailyRecommendPositon 6
#define kTTGameEssentialRecommendPositon 7
#define kTTCrackedRecommendPositon 8
#define kTTCategoryLadyRecommendPositon 9
#define kTTCategoryDiaosRecommendPositon 10
#define kTTPopularMensRecommendPositon 11
#define kTTPopularWomensRecommendPositon 12
#define kTTPopularCoolRunRecommendPositon 13
#define kTTPopularZoombieRecommendPositon 14

// common use initial values
#define kTTMaxDownloadingTaskCount 2
#define kTTSwitch3GNetworkStopDownload YES
#define kTTFinishDownloadAutoInstall YES
#define kTTInstallingNotice YES
#define kTTDownloadingForbidLockScreen YES
#define kTTAfterInstalledDeleteIpa NO // for bug test
#define kTTShowTipsBubbleOnTabBar YES
#define kTTfestivalViewBecomeForeground NO // for View Become Foreground
#define kTTActivitiesPromoteKey NO

// values for iphone 3.0
#define kTTActivitieValue YES
#define kTTSwithJustWiFiWorkDownload YES

#define kTTSwithWiFiAutoInstalledDownload YES

#ifdef DEBUG
#define kTTShowGuidelineOnFirstEnter YES //no is for debug, not show guide view
#define kTTShowAuthViewIfNotAuthorized YES // yes is for debug, not show auth view
#else
#define kTTShowGuidelineOnFirstEnter YES
#define kTTShowAuthViewIfNotAuthorized NO
#endif

// ui values

#define kTTGlobalCornerRadius TT_IS_IPHONE ? 14.f : 11.5f

///////////////////////////////////////////////////////////////////////
// request url
// 222.73.208.67 interface.xyzs.com

//  http://interface.xyzs.com/ios/datacenter.php?timestamp=%d&devicetype=%d&systemversion=%@deviceimei=%@&isjailbreak=%d&sign=%@
// interface.ipauu.com

#ifdef DEBUG // test domain
#define TTBaseRequestUrl @"http://interface.xyzs.com/ios/datacenter.php?" //@"http://interface.ipauu.com/ios/datacenter.php?"
#else // real domain

#define TTBaseRequestUrl @"http://interface.xyzs.com/ios/datacenter.php?"
#endif

#define TTBaseRequestUrlEx @"http://interface.xyzs.com/v2/ios/3.0.0/app/"

//#define TTBaseRequestUrl      @"http://interface.ipauu.com/ios/datacenter.php?"

#define TTFixCrashReuqestUrl @"http://www.xyzs.com/ios/authorized?is_auth=1"
#define TTAuthAfterReuqestUrl @"http://www.xyzs.com/ios/authorized"
#define TTPromotingActivitiesReuqestUrl @"http://xyzs.com/ios/promoting"

#define TTActivitiesReuqestUrl(versionNum, skuNum, uniqueString, mdString) [NSString stringWithFormat:@"http://act.xyzs.com/?version=%@&sku=%@&uniqueNum=%@&MD5Num=%@", versionNum, skuNum, uniqueString, mdString]

// folder path

#define TTDocumentsFolderPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#define TTTemporaryFolderPath NSTemporaryDirectory()

#define TTInstallFilesFolder @"TTInstallFiles"
#define TTInstallFilesDirectory [TTDocumentsFolderPath stringByAppendingPathComponent:TTInstallFilesFolder]

#define TTTaskFilesFolder @"TTTaskFiles"
#define TTTaskFilesFolderDirectory [TTDocumentsFolderPath stringByAppendingPathComponent:TTTaskFilesFolder]

#define TTFestivalAdvFilesFolder @"TTFestivalAdvFiles"
#define TTFestivalAdvFilesDirectory [TTDocumentsFolderPath stringByAppendingPathComponent:TTFestivalAdvFilesFolder]

#define TTItemsServicePath [[NSString stringWithFormat:@"itms-services://?action=download-manifest&url=file://localhost%@", [fullPlistPath stringByReplacingOccurrencesOfString:@".ipa" withString:@".plist"]] stringByReplacingOccurrencesOfString:@" " withString:@"\%20"]

// for iPad
#define kTTHDContentViewWidth 475.f
#define kTTHDContentViewHeight TT_IS_IOS7_AND_UP ? 688 : 748
#define kTTHDTableViewCellHeight 100.f
#define kTTHDHeaderViewHeight 80.f

//#define kTTHDContentViewHeight  TT_IS_IOS7_AND_UP ? 768:748

#define DEFAULT_SPLIT_WD 210

//for ipad newVersion

#define NewHDTopSeqLineColor TTRGBColor(206, 206, 213)

#define NewHDCellSeqLineColor TTHexColor(0xd5d5db)

#define NewkTTGlobalCornerRadius 14

#define kTTHDNewLeftMenuWidth 210

#define kTTHDNewContentViewWidth (1024 - kTTHDNewLeftMenuWidth)
#define kTTHDNewContentViewHeight 768

#define kTTNewAppCellHeight 91

@interface TTPublics : NSObject

@end
