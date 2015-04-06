//
//  TTHTTPRequest.h
//  WeiXinHot
//
//  Created by Eason on 06/04/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHTTPRequest : STHTTPRequest

+ (STHTTPRequest*)requestWithURLString:(NSString*)urlString;

@end
