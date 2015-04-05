//
//  TTApplistTableViewCell.m
//  QVOD
//
//  Created by Eason on 09/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "TTApplistTableViewCell.h"

@implementation TTApplistTableViewCell
@synthesize appIconImageView = _appIconImageView;
@synthesize appTitleLabel = _appTitleLabel;
@synthesize appDesLabel = _appDesLabel;
@synthesize appTaskLabel = _appTaskLabel;
@synthesize coinLabel = _coinLabel;
@synthesize installButton = _installButton;
@synthesize installLinkURL = _installLinkURL;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:[self appIconImageView]];
        [self addSubview:[self appTitleLabel]];
        [self addSubview:[self appDesLabel]];
        [self addSubview:[self appTaskLabel]];

        [self addSubview:[self coinLabel]];
        [self addSubview:[self installButton]];
    }

    return self;
}

#pragma Init Views
- (UIImageView*)appIconImageView
{
    if (!_appIconImageView) {
        CGRect frame = CGRectMake(10.f, 10.f, 60.f, 60.f);
        _appIconImageView = [[UIImageView alloc] initWithFrame:frame];
        _appIconImageView.layer.cornerRadius = 12.0f;
        _appIconImageView.layer.masksToBounds = YES;
        _appIconImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _appIconImageView.layer.borderWidth = 0.5f;
    }

    return _appIconImageView;
}

- (UILabel*)appTitleLabel
{
    if (!_appTitleLabel) {
        CGRect frame = CGRectMake(80.f, 10.f, 200.f, 18.f);
        _appTitleLabel = [[UILabel alloc] initWithFrame:frame];
        [_appTitleLabel setFont:TTSystemBoldFont(18)];
    }

    return _appTitleLabel;
}

- (UILabel*)appDesLabel
{
    if (!_appDesLabel) {
        CGRect frame = CGRectMake(80.f, 35.f, 235.f, 15.f);
        _appDesLabel = [[UILabel alloc] initWithFrame:frame];
        [_appDesLabel setTextColor:TTRGBColor(168, 168, 168)];
        [_appDesLabel setFont:TTSystemFont(13)];
    }

    return _appDesLabel;
}

- (UILabel*)appTaskLabel
{
    if (!_appTaskLabel) {
        CGRect frame = CGRectMake(80.f, 55.f, 235.f, 15.f);
        _appTaskLabel = [[UILabel alloc] initWithFrame:frame];
        [_appTaskLabel setTextColor:TTRGBColor(205, 74, 63)];
        [_appTaskLabel setFont:TTSystemFont(15)];
    }

    return _appTaskLabel;
}

- (UILabel*)coinLabel
{
    if (!_coinLabel) {

        CGRect frame = CGRectMake(TTScreenWidth - 65.f, 50.f, 60.f, 20.f);
        _coinLabel = [[UILabel alloc] initWithFrame:frame];
        [_coinLabel setTextColor:TTOrangeColor];
        [_coinLabel setFont:TTSystemBoldFont(16)];
        [_coinLabel setText:@"+5金币"];
    }

    return _coinLabel;
}

- (UIButton *)installButton
{
    if (!_installButton) {

        CGRect frame = CGRectMake(TTScreenWidth - 70.f, 12.f, 60.f, 30.f);
        _installButton = [[UIButton alloc] initWithFrame:frame];
        [_installButton setTitle:@"安装" forState:UIControlStateNormal];
        [_installButton setBackgroundImage:[UIImage imageNamed:@"applist_install_btn"] forState:UIControlStateNormal];
        [_installButton setTitleColor:TTWhiteColor forState:UIControlStateNormal];
        _installButton.layer.cornerRadius = 5.f;
        _installButton.layer.masksToBounds = YES;
    }

    return _installButton;
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
