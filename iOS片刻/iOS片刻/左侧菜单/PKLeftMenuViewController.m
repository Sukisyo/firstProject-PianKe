//
//  PKLeftMenuViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKLeftMenuViewController.h"
#import "PKLeftHeadView.h"
#import "PKLeftTableView.h"
#import "PKLeftMusicView.h"
#import "PKLoginViewController.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "ZJPNavigationController.h"
#import "PKHomeViewController.h"//首页
#import "PKSettingViewController.h"//设置
#import "PKGoodProductsViewController.h"//良品
#import "PKCommunityViewController.h"//社区
#import "PKReadViewController.h"//阅读
#import "PKRadioViewController.h"//电台
#import "PKSuiPianViewController.h"//碎片

@interface PKLeftMenuViewController ()<PKLoginViewControllerDelegate,PKLeftTableViewSelectRow>

@property (strong,nonatomic) PKLeftHeadView *headView;
@property (strong,nonatomic) PKLeftMusicView *musicView;
@property (strong,nonatomic) PKLeftTableView *leftTableView;
@property (strong,nonatomic) NSArray *tableViewDataSource;

@end

@implementation PKLeftMenuViewController

- (NSArray *)tableViewDataSource {
    if (!_tableViewDataSource) {
        _tableViewDataSource = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品",@"设置"];
    }
    return _tableViewDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:RGB(51, 51, 51)];
    [self.view addSubview:self.headView];
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.musicView];
    WS(weakself);
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.view.mas_top);
        make.height.equalTo(165);
        make.left.equalTo(weakself.view.mas_left);
        make.right.equalTo(weakself.view.mas_right);
    }];
    [_musicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_leftTableView.mas_bottom);
        make.bottom.equalTo(weakself.view.mas_bottom);
        make.left.equalTo(weakself.view.mas_left);
        make.right.equalTo(weakself.view.mas_right);
    }];
    
}

- (PKLeftHeadView *)headView {
    if (!_headView) {
        _headView = [[PKLeftHeadView alloc] init];
        [_headView.iconImageButton addTarget:self action:@selector(pushToLoginViewController) forControlEvents:UIControlEventTouchUpInside];
        [_headView.userNameButton addTarget:self action:@selector(pushToLoginViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}
- (PKLeftMusicView *)musicView {
    if (!_musicView) {
        _musicView = [[PKLeftMusicView alloc] init];
    }
    return _musicView;
}
- (PKLeftTableView *)leftTableView {
    if (!_leftTableView) {
        _leftTableView = [[PKLeftTableView alloc] initWithFrame:CGRectMake(0, 165, VIEW_WIDTH - 45, VIEW_HEIGHT - 165 - 60) style:UITableViewStylePlain];
        _leftTableView.tabelViewSource = self.tableViewDataSource;
        _leftTableView.rowDelegate = self;
    }
    return _leftTableView;
}

- (void)pushToLoginViewController {
    PKLoginViewController *login = [[PKLoginViewController alloc] init];
    UINavigationController *loginVC = [[UINavigationController alloc] initWithRootViewController:login];
    login.delegate = self;
    [self presentViewController:loginVC animated:YES completion:^{
        nil;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - PKLoginViewControllerDelegate
- (void)changeMineInfo:(NSURL *)headIconUrl coverimg:(NSURL *)coverimgUrl uname:(NSString *)uname {
    [self.view makeToast:@"登录成功" duration:1.0 position:@"center"];
    [_headView.iconImageButton sd_setImageWithURL:headIconUrl forState:UIControlStateNormal];
    [_headView.backView sd_setImageWithURL:coverimgUrl];
    [_headView.userNameButton setTitle:uname forState:UIControlStateNormal];
}
#pragma mark - PKLeftTableViewSelectRow
- (void)selectWhichRow:(NSInteger)row {
    switch (row) {
        case 0:
        {
            PKHomeViewController *homeController = [[PKHomeViewController alloc]init];
            homeController.title = @"首页";
            UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeController];
            [self.sideMenuViewController setContentViewController:homeNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 1:
        {
            PKRadioViewController *radioController = [[PKRadioViewController alloc]init];
            radioController.title = @"电台";
            UINavigationController *radioNav = [[UINavigationController alloc]initWithRootViewController:radioController];
            [self.sideMenuViewController setContentViewController:radioNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 2:
        {
            PKReadViewController *readController = [[PKReadViewController alloc]init];
            readController.title = @"阅读";
            UINavigationController *readNav = [[UINavigationController alloc]initWithRootViewController:readController];
            [self.sideMenuViewController setContentViewController:readNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 3:
        {
            PKCommunityViewController *CommunityController = [[PKCommunityViewController alloc]init];
            CommunityController.title = @"社区";
            UINavigationController *CommunityNav = [[UINavigationController alloc]initWithRootViewController:CommunityController];
            [self.sideMenuViewController setContentViewController:CommunityNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 4:
        {
            PKSuiPianViewController *FragmentController = [[PKSuiPianViewController alloc]init];
            UINavigationController *FragmentNav = [[UINavigationController alloc]initWithRootViewController:FragmentController];
            [self.sideMenuViewController setContentViewController:FragmentNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 5:
        {
            PKGoodProductsViewController *GoodProductsController = [[PKGoodProductsViewController alloc]init];
            GoodProductsController.title = @"良品";
            UINavigationController *GoodProductsNav = [[UINavigationController alloc]initWithRootViewController:GoodProductsController];
            [self.sideMenuViewController setContentViewController:GoodProductsNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 6:
        {
            PKSettingViewController *SettingeController = [[PKSettingViewController alloc]init];
            SettingeController.title = @"设置";
            UINavigationController *SettingNav = [[UINavigationController alloc]initWithRootViewController:SettingeController];
            [self.sideMenuViewController setContentViewController:SettingNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
            
        default:
            break;
    }

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
