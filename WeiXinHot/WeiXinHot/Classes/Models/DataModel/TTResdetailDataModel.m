//
//  TTResdetailDataModel.m
//  QVOD
//
//  Created by Eason on 08/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "TTResdetailDataModel.h"

@implementation TTResdetailDataModel

+ (JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
        @"id" : @"resId"
    }];
}

+ (BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end
