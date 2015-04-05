//
//  TTResdetailViewController.m
//  QVOD
//
//  Created by Eason on 08/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "TTResdetailViewController.h"
#import "TTResdetailTableViewCell.h"
#import "TTResdetailDataModel.h"

#define kTTResdetailRequestURL @"https://qvod.bb800.com/getvideo.do?cid=%ld"
#define kTTResdetailTableViewCellHeight 60.f

@interface TTResdetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) NSInteger detailId;

@property (nonatomic, strong) UITableView* resDetailTableView;

@property (nonatomic, strong) NSArray* resDetailArray;

@end

@implementation TTResdetailViewController
@synthesize resDetailTableView = _resDetailTableView;

- (id)initWithId:(NSInteger)cId
{
    self = [super init];
    if (self) {
        _detailId = cId;

        [self requestServerData];
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"资源";
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:[self resourceTableView]];
}

- (UITableView*)resourceTableView
{
    if (!_resDetailTableView) {
        CGRect frame = CGRectMake(self.view.origin.x, self.view.origin.y, self.view.width, self.view.height);
        _resDetailTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _resDetailTableView.delegate = self;
        _resDetailTableView.dataSource = self;
        _resDetailTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }

    return _resDetailTableView;
}

#pragma UITableViewDelegate
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // other actions
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return kTTResdetailTableViewCellHeight;
}

#pragma UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.resDetailArray count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* cellId = @"CellIdentifier";
    TTResdetailTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[TTResdetailTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    if (_resDetailArray.count > 0) {
        TTResdetailDataModel* detailModel = _resDetailArray[indexPath.row];
        [cell.resDetailTitleLabel setText:detailModel.name];
        [cell.resDetailCoinLabel setText:[NSString stringWithFormat:@"所需金币数量:%d", detailModel.coin]];
        //        [cell.resIconImageView sd_setImageWithURL:[NSURL URLWithString:typeModel.icon] placeholderImage:[UIImage imageNamed:@"loading_default_cell_img.png"]];
    }

    return cell;
}

#pragma Request Server Data
- (void)requestServerData
{
    NSString* urlString = [NSString stringWithFormat:kTTResdetailRequestURL, self.detailId];
    TTDEBUGLOG(@"url %@", urlString);
    [JSONHTTPClient postJSONFromURLWithString:urlString
                                       params:nil
                                   completion:^(id json, JSONModelError* err) {

                                           //check err, process json ...
                                       TTDEBUGLOG(@"json %@", json);

                                       TTDEBUGLOG(@"err is %@", err);

                                       NSError *error = nil;

                                       _resDetailArray = [TTResdetailDataModel arrayOfModelsFromDictionaries:json error:&error];

                                       [self showResourceData];
                                       
                                       TTDEBUGLOG(@"res list %@", _resDetailArray);

                                   }];
}

- (void)showResourceData
{
    [_resDetailTableView reloadData];
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
