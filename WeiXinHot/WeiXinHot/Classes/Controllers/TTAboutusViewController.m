//
//  TTAboutusViewController.m
//  QVOD
//
//  Created by Eason on 10/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "TTAboutusViewController.h"

@interface TTAboutusViewController ()

@property (nonatomic, strong) UILabel* titleLabel;

@property (nonatomic, strong) UILabel* versionLabel;

@property (nonatomic, strong) UILabel* contentLabel;

@property (nonatomic, strong) UILabel *copyrightLabel;

@property (nonatomic, strong) UIImageView *logoImageView;

@end

@implementation TTAboutusViewController
@synthesize titleLabel = _titleLabel;
@synthesize versionLabel = _versionLabel;
@synthesize contentLabel = _contentLabel;
@synthesize copyrightLabel = _copyrightLabel;
@synthesize logoImageView = _logoImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"关于";


    [self.view addSubview:[self titleLabel]];

    [self.view addSubview:[self versionLabel]];

    [self.view addSubview:[self contentLabel]];

    [self.view addSubview:[self copyrightLabel]];

    [self.view addSubview:[self logoImageView]];

}

- (UILabel*)titleLabel
{
    if (!_titleLabel) {
        CGRect frame = CGRectMake(0.f, self.view.frame.origin.y + 250, TTScreenWidth, 35.f);
        _titleLabel = [[UILabel alloc] initWithFrame:frame];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"快播浏览器";
        _titleLabel.font = TTSystemBoldFont(22);
    }

    return _titleLabel;
}

- (UILabel *)versionLabel
{
    if (!_versionLabel) {
        CGRect frame = CGRectMake(0.f, self.view.frame.origin.y + 280.f, TTScreenWidth, 35.f);
        _versionLabel = [[UILabel alloc] initWithFrame:frame];
        _versionLabel.textAlignment = NSTextAlignmentCenter;
        _versionLabel.text = @"Version:5.1.18";
        _versionLabel.font = TTSystemFont(13);
        _versionLabel.textColor = TTLightGrayColor;
    }

    return _versionLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        CGRect frame = CGRectMake(10.f, self.view.frame.origin.y + 300.f, TTScreenWidth - 20.f, 150.f);
        _contentLabel = [[UILabel alloc] initWithFrame:frame];
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"        快播浏览器是基于用户需求而开发的一款浏览器。它运行速度快、稳定、安全,原生态支持快播(QVOD)在线点播协议,内置播放RMVB、MPEG、AVI、WMV等600多种主流音频视频格式,是视频娱乐用户上网首先。";
        _contentLabel.font = TTSystemFont(17);
        
    }

    return _contentLabel;
}

- (UILabel *)copyrightLabel
{
    if (!_copyrightLabel) {
        CGRect frame = CGRectMake(0.f, self.view.frame.origin.y + TTScreenHeight - 150.f, TTScreenWidth, 150.f);
        _copyrightLabel = [[UILabel alloc] initWithFrame:frame];
        _copyrightLabel.textAlignment = NSTextAlignmentCenter;
        _copyrightLabel.text = @"Copyright ©2015 QVOO All Right Reserved.";
        _copyrightLabel.font = TTSystemFont(13);
        _copyrightLabel.textColor = TTLightGrayColor;
    }

    return _copyrightLabel;
}

- (UIImageView *)logoImageView
{
    if (!_logoImageView) {
        CGRect frame = CGRectMake((TTScreenWidth - 150.f) /2.f, self.view.frame.origin.y + 100, 150.f, 150.f);
        _logoImageView = [[UIImageView alloc] initWithFrame:frame];
        _logoImageView.image = [UIImage imageNamed:@"Icon@3x.png"];

    }

    return _logoImageView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
