//
//  TTMoreViewController.m
//  QVOD
//
//  Created by Eason on 12/11/2014.
//  Copyright (c) 2014 www.xyzs.com. All rights reserved.
//

#import "TTMoreViewController.h"

#import "TTAboutusViewController.h"
#import "TTFeedbackViewController.h"

#define kTTMoreTableViewCellHeight 44.f

@interface TTMoreViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* moreTableView;

@property (nonatomic, strong) NSArray* moreArray;

@property (nonatomic, strong) NSArray* featureArray;

@property (nonatomic, strong) NSArray* functionArray;

@end

@implementation TTMoreViewController
@synthesize moreTableView = _moreTableView;
@synthesize moreArray = _moreArray;
@synthesize featureArray = _featureArray;
@synthesize functionArray = _functionArray;

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // [self loadYouMiAdView];
        self.tabBarItem.title = @"更多";

        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"menu_ico_more_click"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = [[UIImage imageNamed:@"menu_ico_more_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

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
    self.title = @"更多";
    // self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:3];

    _featureArray = [NSArray arrayWithObjects:@"允许3G网络下载网络视频", @"同时下载任务数", nil];

    _functionArray = [NSArray arrayWithObjects:@"单手操作", @"4D播放", @"优先使用硬解码播放(省电)", @"快进/快退时间", nil];

    _moreArray = [NSArray arrayWithObjects:@"关于", @"反馈", nil];

    [self.view addSubview:[self moreTableView]];
}

- (UITableView*)moreTableView
{
    if (!_moreTableView) {
        CGRect frame = CGRectMake(self.view.origin.x, self.view.origin.y, self.view.width, self.view.height);
        _moreTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        _moreTableView.delegate = self;
        _moreTableView.dataSource = self;
        _moreTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }

    return _moreTableView;
}

#pragma UITableViewDelegate
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // other actions
    if (indexPath.row == 0 && indexPath.section == 2) {
        TTAboutusViewController* aboutusController = [[TTAboutusViewController alloc] init];
        aboutusController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:aboutusController animated:YES];
    }
    else if (indexPath.row == 1 && indexPath.section == 2) {
        TTFeedbackViewController* feedbackController = [[TTFeedbackViewController alloc] init];
        feedbackController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:feedbackController animated:YES];
    }
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return kTTMoreTableViewCellHeight;
}

#pragma UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {

    case 0: {
        return _featureArray.count;
    }

    case 1: {
        return _functionArray.count;
    }

    case 2: {
        return _moreArray.count;
    }

    default:
        break;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* cellId = @"CellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }

    switch (indexPath.section) {

    case 0: {
        if (_featureArray.count > 0) {
            [cell.textLabel setText:[NSString stringWithFormat:@"%@", _featureArray[indexPath.row]]];

            if (indexPath.row == 0) {
                UISwitch* switchButton = [[UISwitch alloc] init];
                cell.accessoryView = switchButton;
                [switchButton setOn:NO animated:NO];
            }

            if (indexPath.row == 1) {
                [cell.detailTextLabel setText:@"2"];
                [cell.detailTextLabel setTextColor:TTBlueColor];
            }
        }
        break;
    }

    case 1: {

        if (_functionArray.count > 0) {
            [cell.textLabel setText:[NSString stringWithFormat:@"%@", _functionArray[indexPath.row]]];

            UISwitch* switchButton = [[UISwitch alloc] init];
            cell.accessoryView = switchButton;
            [switchButton setOn:YES animated:NO];

            if (indexPath.row == 3) {
                [cell.detailTextLabel setText:@"15秒"];
                [cell.detailTextLabel setTextColor:TTBlueColor];
                cell.accessoryView = nil;
            }
        }
        break;
    }

    case 2: {
        if (_moreArray.count > 0) {
            [cell.textLabel setText:[NSString stringWithFormat:@"%@", _moreArray[indexPath.row]]];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        break;
    }

    default:
        break;
    }

    return cell;
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
