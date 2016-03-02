//
//  PKHomeViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKHomeViewController.h"
#import "PKHomeNavigationBar.h"
#import "DCScrollView.h"
#import "PKHomeTodayModel.h"
#import "PKHomeTodayTableView.h"
#import "NSArray+HomeTodayCellHeight.h"

@interface PKHomeViewController ()<UIScrollViewDelegate,PKHomeTodayTableViewRefreshDelegate>

@property (nonatomic,strong) PKHomeNavigationBar *naviBar;
@property (nonatomic,strong) UIScrollView *backScrollView;
@property (nonatomic,strong) NSMutableArray *todayCellModels;
@property (nonatomic,strong) NSMutableArray *todayCellHeights;
@property (nonatomic,strong) PKHomeTodayTableView *todayTableView;
@property (nonatomic,copy) NSString *todayDate;


@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIButton *tagButton;
@property (nonatomic,strong) UIButton *writeButton;
@property (nonatomic,assign) BOOL isBackViewHidden;

@end

@implementation PKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.hidden = YES;
    [self.view setBackgroundColor:RGB(251, 251, 251)];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    _naviBar = [[PKHomeNavigationBar alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 65)];
    [_naviBar.backButton addTarget:self action:@selector(showSideMenu) forControlEvents:UIControlEventTouchUpInside];
    [_naviBar.suiPianBtn addTarget:self action:@selector(suiPianBtnAct) forControlEvents:UIControlEventTouchUpInside];
    [_naviBar.xianZaiBtn addTarget:self action:@selector(xianZaiBtnAct) forControlEvents:UIControlEventTouchUpInside];
    [_naviBar.dongTaiBtn addTarget:self action:@selector(dongtaiBtnAct) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_naviBar];
    
    _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, VIEW_HEIGHT - 65)];
    _backScrollView.showsHorizontalScrollIndicator = NO;
    _backScrollView.delegate = self;
    [_backScrollView setContentOffset:CGPointMake(VIEW_WIDTH, VIEW_HEIGHT - 65)];
    [_backScrollView setContentSize:CGSizeMake(VIEW_WIDTH * 3, VIEW_HEIGHT - 65)];
    _backScrollView.pagingEnabled = YES;
    _backScrollView.bounces = NO;
    [self.view addSubview:_backScrollView];
    
    _todayTableView = [[PKHomeTodayTableView alloc] initWithFrame:CGRectMake(VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT - 65) style:UITableViewStylePlain];
    _todayTableView.refreshDelegate = self;

    [self.backScrollView addSubview:_todayTableView];
    

    
//    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, 45)];
//    [_backView setBackgroundColor:[UIColor whiteColor]];
//    [self.view addSubview:_backView];
    
//    _tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_tagButton setImage:[UIImage imageNamed:@"homeTag"] forState:UIControlStateNormal];
//    [_backView addSubview:_tagButton];
//    
//    _writeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_writeButton setImage:[UIImage imageNamed:@"homePencil"] forState:UIControlStateNormal];
//    [_backView addSubview:_writeButton];
//    self.isBackViewHidden = NO;
//    [self autoLayout];
    
    
    [self.view bringSubviewToFront:_naviBar];
    [self postForInfo];
    
}

- (void)autoLayout {
    WS(ws);
    [_writeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.backView.mas_right).offset(-30);
        make.centerY.equalTo(ws.backView.mas_centerY);
        make.size.equalTo(CGSizeMake(20, 30));
    }];
    [_tagButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.writeButton.mas_left).offset(-30);
        make.centerY.equalTo(ws.backView.mas_centerY);
        make.size.equalTo(CGSizeMake(20, 30));
    }];

}

- (void)postForInfo {
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] objectForKey:@"auth"],
                          @"client" : @"1",
                          @"deviceid" : @"4CC25C98-110E-4B23-89A6-7EABFB660807",
                          @"limit" : @"10",
                          @"start" : @"0",
                          @"version" : @"3.0.6"
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/pub/today" dic:dic successBalck:^(id JSON) {
//        NSLog(@"%@",JSON);
        if ([JSON[@"result"] integerValue]) {
            PKHomeTodayModel *model = [[PKHomeTodayModel alloc] initWithDictionary:JSON];
            self.todayDate = model.data.date;
            [_naviBar.nameLabel setText:self.todayDate];
            self.todayCellModels = [NSMutableArray arrayWithArray:model.data.list];
            self.todayCellHeights = [NSArray calculateCellHeightsWithModels:self.todayCellModels];
            
            _todayTableView.cellModels = self.todayCellModels;
            _todayTableView.cellHeights = self.todayCellHeights;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                DCScrollView *scrollView = [[DCScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 160 * (VIEW_WIDTH / 320)) andImageUrls:model.data.carousel];
                [self.todayTableView setTableHeaderView:scrollView];
                [_todayTableView reloadData];
            });
            [_todayTableView.mj_header endRefreshing];
        }
    } errorBlock:^(NSError *error) {
        [_todayTableView.mj_header endRefreshing];
    }];
}
- (void)postForMoreInfo {
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] objectForKey:@"auth"],
                          @"client" : @"1",
                          @"deviceid" : @"4CC25C98-110E-4B23-89A6-7EABFB660807",
                          @"limit" : @"10",
                          @"start" : [NSString stringWithFormat:@"%ld",self.todayCellModels.count],
                          @"version" : @"3.0.6"
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/pub/today" dic:dic successBalck:^(id JSON) {
        //        NSLog(@"%@",JSON);
        if ([JSON[@"result"] integerValue]) {
            PKHomeTodayModel *model = [[PKHomeTodayModel alloc] initWithDictionary:JSON];

            [self.todayCellModels addObjectsFromArray:model.data.list];
            [self.todayCellHeights addObjectsFromArray:[NSArray calculateCellHeightsWithModels:model.data.list]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
//                DCScrollView *scrollView = [[DCScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 160 * (VIEW_WIDTH / 320)) andImages:model.data.carousel];
//                [self.todayTableView setTableHeaderView:scrollView];
                [_todayTableView reloadData];
            });
            [_todayTableView.mj_footer endRefreshing];
        }
    } errorBlock:^(NSError *error) {
        [_todayTableView.mj_footer endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)showSideMenu {
    [self.sideMenuViewController presentLeftMenuViewController];
}



- (void)suiPianBtnAct {
    [UIView animateWithDuration:0.3 animations:^{
        [_backScrollView setContentOffset:CGPointZero];
    }];
}
- (void)xianZaiBtnAct {
    [UIView animateWithDuration:0.3 animations:^{
        [_backScrollView setContentOffset:CGPointMake(VIEW_WIDTH, 0)];
    }];
    [_naviBar.nameLabel setText:self.todayDate];
}
- (void)dongtaiBtnAct {
    [UIView animateWithDuration:0.3 animations:^{
        [_backScrollView setContentOffset:CGPointMake(VIEW_WIDTH * 2, 0)];
    }];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / VIEW_WIDTH;
    if (index == 0) {
        [_naviBar suiPianBtnAction:_naviBar.suiPianBtn];
    }else if (index == 1){
        [_naviBar xianZaiBtnAction:_naviBar.xianZaiBtn];
    }else {
        [_naviBar dongTaiBtnAction:_naviBar.dongTaiBtn];
    }
}
#pragma mark - PKHomeTodayTableViewRefreshDelegate
- (void)loadMoreData {
    [self postForMoreInfo];
}
- (void)reloadData {
    self.todayCellModels = nil;
    self.todayCellHeights = nil;
    [self postForInfo];
}
- (void)presentBackView {
    if (self.isBackViewHidden) {
        [UIView animateWithDuration:0.5 animations:^{
            [_backView setFrame:CGRectMake(0, 65, VIEW_WIDTH, 45)];
        }];
    }
    self.isBackViewHidden = NO;
}
- (void)hideBackView {
    if (!self.isBackViewHidden) {
        [UIView animateWithDuration:0.5 animations:^{
            [_backView setFrame:CGRectMake(0, 20, VIEW_WIDTH, 45)];
        }];
    }
    self.isBackViewHidden = YES;
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
