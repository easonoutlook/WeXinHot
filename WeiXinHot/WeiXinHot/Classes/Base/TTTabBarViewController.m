//
//  TTTabBarViewController.m
//  QVOD
//
//  Created by Eason on 12/11/2014.
//  Copyright (c) 2014 www.xyzs.com. All rights reserved.
//

#import "TTTabBarViewController.h"
#import "TTResourceListViewController.h"
#import "TTApplicationListViewController.h"
#import "TTUCenterViewController.h"
#import "TTMoreViewController.h"
#import "TTNavgationBarController.h"

@interface TTTabBarViewController ()

@end

@implementation TTTabBarViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self initControllers];
        self.view.backgroundColor = [UIColor whiteColor];
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initControllers
{
    TTNavgationBarController* resourceController = [[TTNavgationBarController alloc] initWithRootViewController:[[TTResourceListViewController alloc] init]];

        // [resourceController.tabBarItem setSelectedImage:[UIImage imageNamed:@"menu_ico_home_normal@2x.png"]];

    TTNavgationBarController* applicationController = [[TTNavgationBarController alloc] initWithRootViewController:[[TTApplicationListViewController alloc] init]];
    TTNavgationBarController* ucenterController = [[TTNavgationBarController alloc] initWithRootViewController:[[TTUCenterViewController alloc] init]];
    TTNavgationBarController* moreController = [[TTNavgationBarController alloc] initWithRootViewController:[[TTMoreViewController alloc] init]];

    self.viewControllers = @[ resourceController, applicationController, ucenterController, moreController ];

    self.selectedIndex = 0;
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
