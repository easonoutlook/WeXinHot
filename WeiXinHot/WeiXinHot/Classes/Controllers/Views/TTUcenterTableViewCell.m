//
//  TTUcenterTableViewCell.m
//  QVOD
//
//  Created by Eason on 15/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "TTUcenterTableViewCell.h"

@implementation TTUcenterTableViewCell
@synthesize centerIconImageView = _centerIconImageView;
@synthesize centerTitleLabel = _centerTitleLabel;
@synthesize centerDesLabel = _centerDesLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:[self centerIconImageView]];
        [self addSubview:[self centerTitleLabel]];
        [self addSubview:[self centerDesLabel]];
    }

    return self;
}

#pragma Init Views
- (UIImageView*)centerIconImageView
{
    if (!_centerIconImageView) {
        CGRect frame = CGRectMake(10.f, 10.f, 60.f, 60.f);
        _centerIconImageView = [[UIImageView alloc] initWithFrame:frame];
    }

    return _centerIconImageView;
}

- (UILabel*)centerTitleLabel
{
    if (!_centerTitleLabel) {
        CGRect frame = CGRectMake(80.f, 15.f, 220.f, 20.f);
        _centerTitleLabel = [[UILabel alloc] initWithFrame:frame];
        [_centerTitleLabel setFont:TTSystemBoldFont(18)];
    }

    return _centerTitleLabel;
}

- (UILabel*)centerDesLabel
{
    if (!_centerDesLabel) {
        CGRect frame = CGRectMake(80.f, 45.f, 220.f, 20.f);
        _centerDesLabel = [[UILabel alloc] initWithFrame:frame];
        [_centerDesLabel setTextColor:TTOrangeColor];
    }

    return _centerDesLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
