//
//  TTReslistTableViewCell.h
//  QVOD
//
//  Created by Eason on 08/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTReslistTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* resIconImageView;

@property (nonatomic, strong) UILabel* resTitleLabel;

@property (nonatomic, strong) UILabel* resCoinLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier;

@end
