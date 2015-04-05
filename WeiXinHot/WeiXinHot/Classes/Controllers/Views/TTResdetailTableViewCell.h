//
//  TTResdetailTableViewCell.h
//  QVOD
//
//  Created by Eason on 08/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTResdetailTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel* resDetailTitleLabel;

@property (nonatomic, strong) UILabel* resDetailCoinLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier;

@end
