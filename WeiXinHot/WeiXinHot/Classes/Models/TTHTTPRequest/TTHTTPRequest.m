//
//  TTHTTPRequest.m
//  WeiXinHot
//
//  Created by Eason on 06/04/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "TTHTTPRequest.h"

@implementation TTHTTPRequest

+ (STHTTPRequest*)requestWithURLString:(NSString*)urlString
{
    STHTTPRequest* r = [STHTTPRequest requestWithURLString:urlString];

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

    return r;
}

@end
