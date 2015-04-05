//
//  TTApplistTableViewCell.h
//  QVOD
//
//  Created by Eason on 09/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTApplistTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* appIconImageView;

@property (nonatomic, strong) UILabel* appTitleLabel;

@property (nonatomic, strong) UILabel* appDesLabel;

@property (nonatomic, strong) UILabel* appTaskLabel;

@property (nonatomic, strong) UILabel* coinLabel;

@property (nonatomic, strong) UIButton *installButton;

@property (nonatomic, strong) NSString *installLinkURL;

@end
