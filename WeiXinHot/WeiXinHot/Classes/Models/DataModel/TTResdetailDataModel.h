//
//  TTResdetailDataModel.h
//  QVOD
//
//  Created by Eason on 08/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "JSONModel.h"

@interface TTResdetailDataModel : JSONModel

@property (assign, nonatomic) int resId;
@property (assign, nonatomic) int coin;
@property (strong, nonatomic) NSString<Optional>* name;

@end
