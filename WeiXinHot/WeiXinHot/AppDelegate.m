//
//  AppDelegate.m
//  WeiXinHot
//
//  Created by Eason on 05/04/2015.
//  Copyright (c) 2015 www.kingbrites.com. All rights reserved.
//

#import "AppDelegate.h"
#import "STHTTPRequest.h"
#import "TTMacros.h"
#import "TTHeaders.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    // Override point for customization after application launch.
    [self requestSegmentData];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication*)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication*)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication*)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication*)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication*)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)requestSegmentData
{
    TTDEBUGLOG(@"request segment data.");
    __block STHTTPRequest* r = [TTHTTPRequest requestWithURLString:kTTWeiXinHotSegmentListURL];

    __weak STHTTPRequest* wr = r;

    r.completionBlock = ^(NSDictionary* headers, NSString* body) {
            // ...
        TTDEBUGLOG(@"headers %@, body %@", headers, body);

        TTSegmentsModel *segmentModel = [[TTSegmentsModel alloc] initWithString:body error:nil];

        TTDEBUGLOG(@"array %@", segmentModel.records);

    };

    r.errorBlock = ^(NSError* error) {
            // ...
        TTDEBUGLOG(@"error %@", error);
    };

    [r startAsynchronous];
}

- (void)testWeixinRequest
{
    STHTTPRequest* r = [STHTTPRequest requestWithURLString:@"http://wx.html5.qq.com/api/getrecommendlist?appId=6188615&limit=10&channelId=001203&itemCount=0&slideType=recomm&type=wx&businessId=1"];

    //g_ut=2; pgv_pvid=1093202121
    [r addCookieWithName:@"g_ut" value:@"2"];

    [r addCookieWithName:@"pgv_pvid" value:@"1093202121"];

    [r setHeaderWithName:@"User-Agent" value:@"Mozilla/5.0 (iPhone 5SGLOBAL; CPU iPhone OS 8_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/6.0 MQQBrowser/5.7 Mobile/12D508 Safari/8536.25"];
    [r setHeaderWithName:@"Accept-Encoding" value:@"gzip, deflate"];

    [r setHeaderWithName:@"Accept-Language" value:@"zh-cn"];

    [r setHeaderWithName:@"Accept" value:@"application/json"];

    [r setHeaderWithName:@"Q-AUTH" value:@"f6fcdb824ecd944b813d27baa3889d2bda0cc9a2d45e8eab"];

    [r setHeaderWithName:@"X-Requested-With" value:@"XMLHttpRequest"];

    [r setHeaderWithName:@"Referer" value:@"http://wx.html5.qq.com/?ch=001203"];

    [r setHeaderWithName:@"Q-UA" value:@"IQB57_GA/571307&IMTT_3/571307&IPH&407140&iPhone5SGLOBAL&50001&9477&iOS8.2&V3"];

    [r setHeaderWithName:@"Q-GUID" value:@"f99b8e8018db145a45ecdc37127c88cb"];

    [r setHeaderWithName:@"Q-UA2" value:@"QV=2&PL=IOS&PR=QB&DE=PHONE&VE=GA&VN=5.7.0.1307&CO=IMTT&RL=640*1136&MO=iPhone5SGLOBAL&CHID=50001&LCID=9477&OS=8.2"];

    //[r setHeaderWithName:@"X-Requested-With" value:@"XMLHttpRequest"];

    r.completionBlock = ^(NSDictionary* headers, NSString* body) {
        // ...
        TTDEBUGLOG(@"headers %@, body %@", headers, body);
    };

    r.errorBlock = ^(NSError* error) {
        // ...
        TTDEBUGLOG(@"error %@", error);
    };

    [r startAsynchronous];
}

@end
