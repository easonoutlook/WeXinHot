//
//  TTResourceListViewController.m
//  QVOD
//
//  Created by Eason on 12/11/2014.
//  Copyright (c) 2014 www.xyzs.com. All rights reserved.
//

#import "TTResourceListViewController.h"
#import "TTReslistTableViewCell.h"
#import "TTResdetailViewController.h"

#define kTTReslistRequestURL @"https://qvod.bb800.com/getvcategory.do"
#define kTTReslistTableViewCellHeight 120.f

#define kTTGADAdViewAdUID @"ca-app-pub-4718515065945388/3762299758"

@interface TTResourceListViewController () <UITableViewDelegate, UITableViewDataSource, YouMiDelegate>

@property (nonatomic, strong) UITableView* resourceTableView;

@property (nonatomic, strong) NSArray* resourceArray;

@property (nonatomic, strong) GADBannerView* bannerAdView;

@end

@implementation TTResourceListViewController
@synthesize resourceTableView = _resourceTableView;
@synthesize resourceArray = _resourceArray;
@synthesize bannerAdView = _bannerAdView;

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // [self loadYouMiAdView];
        self.tabBarItem.title = NSLocalizedString(@"资源", nil);

        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"menu_ico_home_click"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = [[UIImage imageNamed:@"menu_ico_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        [self.tabBarItem setTitleTextAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.f],
            NSForegroundColorAttributeName : TTGlobalColor }
                                       forState:UIControlStateSelected];
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //    self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:0];
    //    [self.tabBarItem setTitle:@"资源"];
    self.title = @"资源";
    self.view.backgroundColor = [UIColor whiteColor];

    [self requestServerData];

    [self.view addSubview:[self resourceTableView]];
}

- (UITableView*)resourceTableView
{
    if (!_resourceTableView) {
        CGRect frame = CGRectMake(self.view.origin.x, self.view.origin.y, self.view.width, self.view.height);
        _resourceTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _resourceTableView.delegate = self;
        _resourceTableView.dataSource = self;
        _resourceTableView.clipsToBounds = YES;
        _resourceTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }

    return _resourceTableView;
}

- (GADBannerView*)bannerAdView
{
    if (!_bannerAdView) {
        _bannerAdView = [[GADBannerView alloc] initWithFrame:CGRectMake(0.f, 0.f, TTScreenWidth, 50.f)];
        _bannerAdView.adUnitID = kTTGADAdViewAdUID;
        _bannerAdView.rootViewController = self;
        GADRequest* request = [GADRequest request];
        request.testDevices = @[ @"2f7271941380925d689a68a7a5567ced" ];
        [_bannerAdView loadRequest:request];
    }

    return _bannerAdView;
}

#pragma UITableViewDelegate
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // other actions
    if (_resourceArray.count > 0) {
        TTRestypeDataModel* typeModel = _resourceArray[indexPath.row];

        TTResdetailViewController* resDetailController = [[TTResdetailViewController alloc] initWithId:typeModel.resId];
        self.navigationController.hidesBottomBarWhenPushed = YES;

        [self.navigationController pushViewController:resDetailController animated:YES];
    }
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return kTTReslistTableViewCellHeight;
}

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 50.f;
    }

    return 0.f;
}

#pragma UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.resourceArray count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* cellId = @"CellIdentifier";
    TTReslistTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[TTReslistTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    if (_resourceArray.count > 0) {
        TTRestypeDataModel* typeModel = _resourceArray[indexPath.row];
        [cell.resTitleLabel setText:typeModel.name];
        [cell.resCoinLabel setText:[NSString stringWithFormat:@"所需金币数量:%d金币", typeModel.coin]];
        [cell.resIconImageView sd_setImageWithURL:[NSURL URLWithString:typeModel.icon] placeholderImage:[UIImage imageNamed:@"loading_default_cell_img.png"]];
    }

    return cell;
}

- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {

        return [self bannerAdView];
        //        YouMiView* adView = [[YouMiView alloc] initWithContentSizeIdentifier:YouMiBannerContentSizeIdentifier320x50 delegate:self];
        //
        //        TTSHOWRECT(adView.bounds);
        //        TTDEBUGLOG(@"---- %f---%f", TTScreenWidth, TTScreenHeight);
        //        float screenWidth = TTScreenWidth;
        //        TTDEBUGLOG(@"screen %f", screenWidth);
        //        adView.frame = CGRectMake(0.f, 0.f, screenWidth, CGRectGetHeight(adView.bounds));
        //        adView.backgroundColor = TTRGBColor(246, 246, 246);
        //        [adView start];
        //
        //        return adView;
    }

    return nil;
}

#pragma Request Server Data
- (void)requestServerData
{
    [SVProgressHUD showWithStatus:@"正在加载中..."];
    __block STHTTPRequest* r = [STHTTPRequest requestWithURLString:kTTReslistRequestURL];

    __weak STHTTPRequest* wr = r;

    r.completionBlock = ^(NSDictionary* headers, NSString* body) {
        // ...
        [SVProgressHUD dismiss];
            //check err, process json ...
        TTDEBUGLOG(@"json %@", wr.requestHeaders);

        TTDEBUGLOG(@"err is %@", wr.error);

        NSError *error = nil;

        _resourceArray = [TTRestypeDataModel arrayOfModelsFromData:wr.responseData error:&error];
        if (error == nil) {
            [self showResourceData];
            TTDEBUGLOG(@"res list %@", _resourceArray);

        }else{
            [SVProgressHUD showErrorWithStatus:@"网络出错!"];
        }

    };

    r.errorBlock = ^(NSError* error) {
        // ...
        [SVProgressHUD showErrorWithStatus:@"网络出错!"];
    };

    [r startAsynchronous];

    //    [JSONHTTPClient postJSONFromURLWithString:kTTReslistRequestURL
    //                                       params:nil
    //                                   completion:^(id json, JSONModelError* err) {
    //
    //                                           //check err, process json ...
    //                                           TTDEBUGLOG(@"json %@", json);
    //
    //                                           TTDEBUGLOG(@"err is %@", err);
    //
    //                                           NSError *error = nil;
    //
    //                                           _resourceArray = [TTRestypeDataModel arrayOfModelsFromDictionaries:json error:&error];
    //
    //                                           [self showResourceData];
    //
    //                                           TTDEBUGLOG(@"res list %@", _resourceArray);
    //
    //                                   }];
}

- (void)showResourceData
{
    [_resourceTableView reloadData];
}

#pragma Ad View
- (void)loadYouMiAdView
{
    // 320x50
    YouMiView* adView = [[YouMiView alloc] initWithContentSizeIdentifier:YouMiBannerContentSizeIdentifier320x50 delegate:self];
    adView.frame = CGRectMake(self.view.origin.x, self.view.height - 50.f, CGRectGetWidth(adView.bounds), CGRectGetHeight(adView.bounds));
    adView.backgroundColor = TTBlackColor;
    [adView start];

    [self.view addSubview:adView];
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
