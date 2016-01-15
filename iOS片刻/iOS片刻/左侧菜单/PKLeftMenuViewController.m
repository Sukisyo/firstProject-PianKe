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

@interface PKLeftMenuViewController ()

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
    }
    return _leftTableView;
}

- (void)pushToLoginViewController {
    UINavigationController *loginVC = [[UINavigationController alloc] initWithRootViewController:[[PKLoginViewController alloc] init]];
    [self presentViewController:loginVC animated:YES completion:^{
        nil;
    }];
}

- (void)didReceiveMemoryWarning {
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
