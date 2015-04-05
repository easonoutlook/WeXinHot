//
//  TTApplicationListViewController.m
//  QVOD
//
//  Created by Eason on 12/11/2014.
//  Copyright (c) 2014 www.xyzs.com. All rights reserved.
//

#import "TTApplicationListViewController.h"
#import "TTApplistTableViewCell.h"

#define kTTApplistTableViewCellHeight 80.f

@interface TTApplicationListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* applistTableView;

@property (nonatomic, strong) NSArray* applistArray;

@end

@implementation TTApplicationListViewController
@synthesize applistTableView = _applistTableView;

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // [self loadYouMiAdView];
        self.tabBarItem.title = NSLocalizedString(@"赚钱金币", nil);

        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"menu_ico_program_click"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = [[UIImage imageNamed:@"menu_ico_program_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

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
    self.title = @"赚取金币";
    //self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:1];

    [self.view addSubview:[self applistTableView]];

    [self requestServerData];
}

- (UITableView*)applistTableView
{
    if (!_applistTableView) {
        CGRect frame = CGRectMake(self.view.origin.x, self.view.origin.y, self.view.width, self.view.height);
        _applistTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _applistTableView.delegate = self;
        _applistTableView.dataSource = self;
        _applistTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }

    return _applistTableView;
}

#pragma UITableViewDelegate
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // other actions
    TTDEBUGLOG(@"click install app.");
    if (_applistArray.count > 0) {
        // log
        YouMiWallAppModel* appModel = _applistArray[indexPath.row];
        TTDEBUGLOG(@"url is %@", appModel.linkURL);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appModel.linkURL]];
    }
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return kTTApplistTableViewCellHeight;
}

#pragma UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.applistArray count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* cellId = @"CellIdentifier";
    TTApplistTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[TTApplistTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }

    if (_applistArray.count > 0) {
        YouMiWallAppModel* appModel = _applistArray[indexPath.row];
        [cell.appTitleLabel setText:appModel.name];
        [cell.appDesLabel setText:appModel.desc];
        [cell.appTaskLabel setText:appModel.task_brief];
        [cell.appIconImageView sd_setImageWithURL:[NSURL URLWithString:appModel.largeIconURL] placeholderImage:[UIImage imageNamed:@"loading_default_cell_img.png"]];
        [cell.installButton addTarget:self action:@selector(clickedInstallAppButton:) forControlEvents:UIControlEventTouchUpInside];
        cell.installButton.tag = indexPath.row;
    }

    return cell;
}

#pragma Request Server Data
- (void)requestServerData
{
    [SVProgressHUD showWithStatus:@"正在加载中..."];
    [YouMiWall requestOffersOpenData:YES page:1 count:50 revievedBlock:^(NSArray* theApps, NSError* error) {
            // theApps 是 YouMiWallAppModel 的对象列表
        [SVProgressHUD dismiss];
        if (!error) {
            TTDEBUGLOG(@"file is %@", theApps);
            _applistArray = theApps;
        }else{
            [SVProgressHUD showErrorWithStatus:@"网络出错!"];
        }
    }];

    //    [JSONHTTPClient postJSONFromURLWithString:@""
    //                                       params:nil
    //                                   completion:^(id json, JSONModelError* err) {
    //
    //                                           //check err, process json ...
    //                                       TTDEBUGLOG(@"json %@", json);
    //
    //                                       TTDEBUGLOG(@"err is %@", err);
    //
    //                                       NSError *error = nil;
    //
    //                                       _resourceArray = [TTRestypeDataModel arrayOfModelsFromDictionaries:json error:&error];
    //
    //                                       [self showResourceData];
    //
    //                                       TTDEBUGLOG(@"res list %@", _resourceArray);
    //
    //                                   }];
}

- (void)showResourceData
{
    [_applistTableView reloadData];
}

#pragma Actions
- (void)clickedInstallAppButton:(UIButton*)btn
{
    TTDEBUGLOG(@"btn tag %ld", btn.tag);
    if (_applistArray.count > 0) {
        // log
        YouMiWallAppModel* appModel = _applistArray[btn.tag];
        TTDEBUGLOG(@"url is %@", appModel.linkURL);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appModel.linkURL]];
    }
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
