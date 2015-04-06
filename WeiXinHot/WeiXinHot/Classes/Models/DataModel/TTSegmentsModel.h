//
//  TTSegmentsModel.h
//  WeiXinHot
//
//  Created by Eason on 06/04/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "JSONModel.h"

@protocol TTSegmentModel

@end

@interface TTSegmentModel : JSONModel

@property (nonatomic, assign) long appId;

@property (nonatomic, copy) NSString* appName;

@end

@interface TTSegmentsModel : JSONModel

@property (nonatomic, strong) NSArray<TTSegmentModel, ConvertOnDemand>* records;

@property (nonatomic, assign) BOOL success;

@end
