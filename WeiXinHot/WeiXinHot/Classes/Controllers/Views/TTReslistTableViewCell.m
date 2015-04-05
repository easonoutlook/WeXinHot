//
//  TTReslistTableViewCell.m
//  QVOD
//
//  Created by Eason on 08/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "TTReslistTableViewCell.h"

@implementation TTReslistTableViewCell
@synthesize resIconImageView = _resIconImageView;
@synthesize resTitleLabel = _resTitleLabel;
@synthesize resCoinLabel = _resCoinLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:[self resIconImageView]];
        [self addSubview:[self resTitleLabel]];

        [self addSubview:[self resCoinLabel]];
    }

    return self;
}

#pragma Init Views
- (UIImageView*)resIconImageView
{
    if (!_resIconImageView) {
        CGRect frame = CGRectMake(10.f, 10.f, 100.f, 100.f);
        _resIconImageView = [[UIImageView alloc] initWithFrame:frame];
    }

    return _resIconImageView;
}

- (UILabel*)resTitleLabel
{
    if (!_resTitleLabel) {
        CGRect frame = CGRectMake(120.f, 30.f, 300.f, 20.f);
        _resTitleLabel = [[UILabel alloc] initWithFrame:frame];
        [_resTitleLabel setFont:TTSystemBoldFont(18)];
    }

    return _resTitleLabel;
}

- (UILabel*)resCoinLabel
{
    if (!_resCoinLabel) {
        CGRect frame = CGRectMake(120.f, 65.f, 300.f, 20.f);
        _resCoinLabel = [[UILabel alloc] initWithFrame:frame];
        [_resCoinLabel setTextColor:TTOrangeColor];
    }

    return _resCoinLabel;
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
