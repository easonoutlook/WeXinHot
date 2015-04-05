//
//  TTUCenterViewController.m
//  QVOD
//
//  Created by Eason on 12/11/2014.
//  Copyright (c) 2014 www.xyzs.com. All rights reserved.
//

#import "TTUCenterViewController.h"
#import "TTUcenterTableViewCell.h"
#import "TTApplicationListViewController.h"

#define kTTUCenterTableViewCellHeight 80.f

@interface TTUCenterViewController ()<UITableViewDelegate, UITableViewDataSource, YouMiDelegate, GADInterstitialDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) UITableView *ucenterTableView;

@property (nonatomic, strong) UIView *accountView;

@property (nonatomic, strong) UIView *receiptView;

@property (nonatomic, strong) UIView *noticeView;

@property (nonatomic, strong) UILabel *amountLabel;

@property (nonatomic, strong) UILabel *dailyCoinLabel;

@property (nonatomic, strong) NSArray *imageArray;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) NSArray *desArray;

@property(nonatomic, strong) GADInterstitial *interstitial;

@end

@implementation TTUCenterViewController
@synthesize ucenterTableView = _ucenterTableView;
@synthesize accountView = _accountView;
@synthesize receiptView = _receiptView;
@synthesize noticeView = _noticeView;
@synthesize amountLabel = _amountLabel;
@synthesize dailyCoinLabel = _dailyCoinLabel;
@synthesize interstitial = _interstitial;

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            // [self loadYouMiAdView];
        self.tabBarItem.title = NSLocalizedString(@"我的", nil);

        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"menu_ico_mine_click"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = [[UIImage imageNamed:@"menu_ico_mine_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [self.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.f], NSForegroundColorAttributeName:TTGlobalColor} forState:UIControlStateSelected];
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";

    [self.view addSubview:[self ucenterTableView]];

    _imageArray = @[@"ucenter_app", @"ucenter_splash", @"ucenter_video"];

    _titleArray = @[@"做任务", @"看视频", @"广告墙"];

    _desArray =  @[@"下载列表中的App获取金币", @"看你想看的", @"打开广告墙下载App获取金币"];

    [self.ucenterTableView addSubview:[self noticeView]];

    self.ucenterTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    [self interstitial];
}

#pragma Init
- (UITableView *)ucenterTableView
{
    if (!_ucenterTableView) {
        CGRect frame = CGRectMake(self.view.origin.x, self.view.origin.y, self.view.width, self.view.height);
        _ucenterTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _ucenterTableView.delegate = self;
        _ucenterTableView.dataSource = self;
    }

    return _ucenterTableView;
}

- (UIView *)accountView
{
    if (!_accountView) {
        CGRect frame = CGRectMake(0.f, 0.f, TTScreenWidth, 100.f);
        _accountView = [[UIView alloc] initWithFrame:frame];
        _accountView.backgroundColor = TTHexColor(0x4876FF);
            // _accountView.backgroundColor = TTGlobalColor;

        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20.f, 15.f, 100.f, 20.f)];
        title.text = @"当前金币数:";
        title.textColor = TTWhiteColor;
        [_accountView addSubview:title];

        UILabel *dollar = [[UILabel alloc] initWithFrame:CGRectMake(20.f, 50.f, 50.f, 30.f)];
        dollar.text = @"￥";
        dollar.font =  TTSystemBoldFont(40);
        dollar.textColor = TTWhiteColor;
        [_accountView addSubview:dollar];

        [_accountView addSubview:[self amountLabel]];

        UILabel *rmb = [[UILabel alloc] initWithFrame:CGRectMake(TTScreenWidth - 35.f, 55.f, 35.f, 20.f)];
        rmb.text = @"金币";
        rmb.textColor = TTWhiteColor;
        [_accountView addSubview:rmb];
    }

    return _accountView;
}

- (UILabel *)amountLabel
{
    if (!_amountLabel) {
        _amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(TTScreenWidth - 160.f, 45.f, 110.f, 35.f)];
        _amountLabel.text = @"15.00";
        _amountLabel.font =  TTSystemBoldFont(42);
        _amountLabel.textColor = TTWhiteColor;
        _amountLabel.textAlignment = NSTextAlignmentRight;
    }

    return _amountLabel;
}

- (UIView *)receiptView
{
    if (!_receiptView) {
        CGRect frame = CGRectMake(0.f, 0.f, TTScreenWidth, 30.f);
        _receiptView = [[UIView alloc] initWithFrame:frame];
        _receiptView.backgroundColor = TTHexColor(0x436EEE);
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20.f, 5.f, 120.f, 20.f)];
        title.text = @"收入概况";
        title.textColor = TTWhiteColor;
        [_receiptView addSubview:title];

        [_receiptView addSubview:[self dailyCoinLabel]];
    }

    return _receiptView;
}

- (UILabel *)dailyCoinLabel
{
    if (!_dailyCoinLabel) {
        _dailyCoinLabel = [[UILabel alloc] initWithFrame:CGRectMake(TTScreenWidth - 170.f, 5.f, 160.f, 20.f)];
        _dailyCoinLabel.text = [NSString stringWithFormat:@"今日已赚取15金币"];
        _dailyCoinLabel.textColor = TTWhiteColor;
    }

    return _dailyCoinLabel;
}

- (UIView *)noticeView
{
    if (!_noticeView) {

        CGRect frame = CGRectMake(0.f, self.view.frame.size.height - 49.f - 63.f - 35.f, TTScreenWidth, 35.f);
        _noticeView = [[UIView alloc] initWithFrame:frame];
        _noticeView.layer.borderColor = TTGrayColor.CGColor;
        _noticeView.layer.borderWidth = 0.5f;
            //_noticeView.backgroundColor = TTHexColor(0x1874CD);

        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(6.f, 0.f, TTScreenWidth - 10.f, 35.f)];
        title.text = @"我们的服务器托管在美国, 需要大量带宽的成本, 请支持并点击我们的广告, 以便我们提供更好的服务.";
        title.numberOfLines = 0;
        title.font = TTSystemBoldFont(13);
        title.textColor = TTLightGrayColor;
        [_noticeView addSubview:title];
    }

    return _noticeView;
}

- (GADInterstitial *)interstitial
{
    _interstitial = [[GADInterstitial alloc] init];
    _interstitial.adUnitID = @"ca-app-pub-4718515065945388/5239032951";
    _interstitial.delegate = self;

    GADRequest *request = [GADRequest request];
        // Request test ads on devices you specify. Your test device ID is printed to the console when
        // an ad request is made. GADInterstitial automatically returns test ads when running on a
        // simulator.
    request.testDevices = @[@"2f7271941380925d689a68a7a5567ced"];
    [_interstitial loadRequest:request];

    return _interstitial;
}


#pragma UITableViewDelegate
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // other actions
    if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
            {
                [self.tabBarController setSelectedIndex:1];
                break;
            }
            case 1:
            {
            // [self performSelector:@selector(loadYouMiVideoView) withObject:nil afterDelay:2];
                [self loadYouMiVideoView];
                break;
            }
            case 2:
            {
                [self adMobInterstitial];
                break;
            }

            default:
                break;
        }
    }
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return kTTUCenterTableViewCellHeight;
}

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 100.f;
    }else if (section ==1){
        return 30.f;
    }

    return 0.f;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    if (section == 2){
//        return 60.f;
//    }
//
//    return 0.f;
//}

#pragma UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 3;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* cellId = @"CellIdentifier";
    TTUcenterTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[TTUcenterTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    if (indexPath.section == 2) {
        [cell.centerIconImageView setImage: [UIImage imageNamed:_imageArray[indexPath.row]]];
        cell.centerTitleLabel.text = [NSString stringWithFormat:@"%@", _titleArray[indexPath.row]];
        cell.centerDesLabel.text = [NSString stringWithFormat:@"%@", _desArray[indexPath.row]];
    }
    
    return cell;
}

- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return [self accountView];
    }else if (section == 1){
        return [self receiptView];
    }
    return nil;
}

#pragma Ad Actions
- (void)adMobInterstitial
{
    if (self.interstitial.isReady) {
        [self.interstitial presentFromRootViewController:self];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"请稍后点击"
                                    message:@"请检查网络之后, 稍后点击查看"
                                   delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}


#pragma GADInterstitialDelegate
- (void)interstitial:(GADInterstitial *)interstitial didFailToReceiveAdWithError:(GADRequestError *)error
{
    TTDEBUGLOG(@"interstitialDidFailToReceiveAdWithError: %@", [error localizedDescription]);
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial
{
    TTDEBUGLOG(@"interstitialDidDismissScreen");
}

- (void)loadYouMiVideoView
{
    [CocoBVideo cBVideoPlay:self cBVideoPlayFinishCallBackBlock:^(BOOL isFinishPlay) {
        TTDEBUGLOG(@"视频播放结束");
    } cBVideoPlayConfigCallBackBlock:^(BOOL isLegal) {
        TTDEBUGLOG(@"此次播放是否有效：%d",isLegal);
    }];
}


#pragma YouMiDelegate
- (void)didReceiveAd:(YouMiView*)adView
{
    TTDEBUGLOG(@"...");
}

- (void)didFailToReceiveAd:(YouMiView*)adView error:(NSError*)error
{
    TTDEBUGLOG(@"...");
}

- (void)willPresentScreen:(YouMiView*)adView
{
    TTDEBUGLOG(@"...");
}

- (void)didPresentScreen:(YouMiView*)adView
{
    TTDEBUGLOG(@"...");
}

- (void)willDismissScreen:(YouMiView*)adView
{
    TTDEBUGLOG(@"...");
}

- (void)didDismissScreen:(YouMiView*)adView
{
    TTDEBUGLOG(@"...");
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
