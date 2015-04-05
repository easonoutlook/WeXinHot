//
//  TTResdetailTableViewCell.m
//  QVOD
//
//  Created by Eason on 08/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "TTResdetailTableViewCell.h"

@implementation TTResdetailTableViewCell
@synthesize resDetailTitleLabel = _resDetailTitleLabel;
@synthesize resDetailCoinLabel = _resDetailCoinLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:[self resDetailTitleLabel]];
        [self addSubview:[self resDetailCoinLabel]];
    }

    return self;
}

#pragma Init Views
//- (UIImageView*)resIconImageView
//{
//    if (!_resIconImageView) {
//        CGRect frame = CGRectMake(10.f, 10.f, 100.f, 100.f);
//        _resIconImageView = [[UIImageView alloc] initWithFrame:frame];
//    }
//
//    return _resIconImageView;
//}

- (UILabel*)resDetailTitleLabel
{
    if (!_resDetailTitleLabel) {
        CGRect frame = CGRectMake(20.f, 10.f, 300.f, 20.f);
        _resDetailTitleLabel = [[UILabel alloc] initWithFrame:frame];
        [_resDetailTitleLabel setFont:TTSystemBoldFont(18)];
    }

    return _resDetailTitleLabel;
}

- (UILabel*)resDetailCoinLabel
{
    if (!_resDetailCoinLabel) {
        CGRect frame = CGRectMake(20.f, 35.f, 300.f, 20.f);
        _resDetailCoinLabel = [[UILabel alloc] initWithFrame:frame];
        [_resDetailCoinLabel setTextColor:TTOrangeColor];
        [_resDetailCoinLabel setFont:TTSystemFont(13)];
    }

    return _resDetailCoinLabel;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
