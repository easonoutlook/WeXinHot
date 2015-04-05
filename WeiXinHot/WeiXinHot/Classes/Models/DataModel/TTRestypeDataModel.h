//
//  TTRestypeDataModel.h
//  QVOD
//
//  Created by Eason on 08/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "JSONModel.h"
#import "TTVideoDataModel.h"

@protocol TTRestypeDataModel
@end

@interface TTRestypeDataModel : JSONModel

@property (assign, nonatomic) int resId;
@property (strong, nonatomic) NSString<Optional>* icon;
@property (strong, nonatomic) NSString<Optional>* name;
@property (assign, nonatomic) int coin;
@property (assign, nonatomic) int type;
@property (strong, nonatomic) TTVideoDataModel<Optional>* video;

@end
