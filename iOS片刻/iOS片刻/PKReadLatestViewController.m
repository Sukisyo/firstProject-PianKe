//
//  PKReadLatestViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/24.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadLatestViewController.h"
#import "PKReadLatestModel.h"
#import "PKReadLatestTableView.h"
#import "NSArray+ReadCellHeight.h"
#import "PKReadDetailNavigationBar.h"
#import "MJRefresh.h"
#import "PKReadArticleViewController.h"

@interface PKReadLatestViewController ()<UIScrollViewDelegate,PKReadLatestTableViewDelegate>

@property (nonatomic,strong) UIScrollView *backScrollView;
@property (nonatomic,strong) PKReadLatestTableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableSource;
@property (nonatomic,strong) NSMutableArray *cellHeights;
@property (nonatomic,strong) PKReadLatestTableView *hotTableView;
@property (nonatomic,strong) NSMutableArray *hotTableSource;
@property (nonatomic,strong) NSMutableArray *hotCellHeights;
@property (nonatomic,strong) PKReadDetailNavigationBar *naviBar;
@property (nonatomic,strong) NSArray *refreshingImages;


@end

@implementation PKReadLatestViewController


/**
 *  refresh图片
 */
- (NSArray *)refreshingImages {
    if (!_refreshingImages) {
        NSMutableArray *marr = [NSMutableArray array];
        for (int i = 0; i <= 28; i++) {
            NSString *name = [NSString stringWithFormat:@"new_refresh%i",i];
            [marr addObject:name];
        }
        NSMutableArray *marrImages = [NSMutableArray array];
        for (NSString *str in marr) {
            UIImage *image = [UIImage imageNamed:str];
            [marrImages addObject:image];
        }
        _refreshingImages = marrImages;
    }
    return _refreshingImages;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view setBackgroundColor:RGB(251, 251, 251)];
    
    _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, VIEW_HEIGHT - 65)];
    [self.view addSubview:_backScrollView];
    [_backScrollView setContentOffset:CGPointMake(0, 0)];
    [_backScrollView setContentSize:CGSizeMake(VIEW_WIDTH * 2, _backScrollView.frame.size.height)];
    _backScrollView.pagingEnabled = YES;
    _backScrollView.bounces = NO;
    _backScrollView.showsHorizontalScrollIndicator = NO;
    _backScrollView.delegate = self;
    
    
    _tableView = [[PKReadLatestTableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT - 65) style:UITableViewStylePlain];
    _tableView.articleDelegate = self;
    [self.backScrollView addSubview:_tableView];
    
    _hotTableView = [[PKReadLatestTableView alloc] initWithFrame:CGRectMake(VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT - 65) style:UITableViewStylePlain];
    _hotTableView.articleDelegate = self;
    [self.backScrollView addSubview:_hotTableView];
    
    _naviBar = [[PKReadDetailNavigationBar alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 65)];
    [_naviBar.backButton addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_naviBar setBackgroundColor:[UIColor blackColor]];
    [_naviBar.addtimeButton addTarget:self action:@selector(addBtnAct) forControlEvents:UIControlEventTouchUpInside];
    [_naviBar.hotButton addTarget:self action:@selector(hotBtnAct) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_naviBar];
    
    [self postForInfo];
    [self mjRefresh];
    [self hotPostForInfo];
    [self mjRefreshHot];
    
    
    
    
}
//上下拉刷新  new
- (void)mjRefresh {
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(postForInfo)];
    
    // 设置普通状态的动画图片
    [header setImages:@[[UIImage imageNamed:@"pullRefresh"]] forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:@[[UIImage imageNamed:@"loading"]] forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    
    header.stateLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    
    
    // 设置header
    self.tableView.mj_header = header;
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTableViewData)];
    
    // 设置刷新图片
    [footer setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    
    footer.refreshingTitleHidden = YES;
    footer.stateLabel.hidden = YES;
    //    [footer setTitle:@"dsad" forState:MJRefreshStateNoMoreData];
    
    // 设置尾部
    self.tableView.mj_footer = footer;
    
}
- (void)postForInfo {
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] objectForKey:@"auth"],
                          @"client" : @"1",
                          @"deviceid" : @"4CC25C98-110E-4B23-89A6-7EABFB660807",
                          @"limit" : @"10",
                          @"sort" : @"addtime",
                          @"start" : @"0",
                          @"version" : @"3.0.6",
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/read/latest" dic:dic successBalck:^(id JSON) {
        if ([JSON[@"result"] integerValue]) {
            PKReadLatestModel *model = [[PKReadLatestModel alloc] initWithDictionary:JSON];
            self.tableSource = [NSMutableArray arrayWithArray:model.data.list];
            self.cellHeights = [NSArray readCellHeightsWithModels:model.data.list];
            self.tableView.cellModels = self.tableSource;
            self.tableView.cellHeights = self.cellHeights;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                [_naviBar.nameLabel setText:@"自由写作"];
            });
        }
        [self.tableView.mj_header endRefreshing];

    } errorBlock:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];

    }];
}
- (void)loadMoreTableViewData {
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] objectForKey:@"auth"],
                          @"client" : @"1",
                          @"deviceid" : @"4CC25C98-110E-4B23-89A6-7EABFB660807",
                          @"limit" : @"10",
                          @"sort" : @"addtime",
                          @"start" : [NSString stringWithFormat:@"%ld",self.cellHeights.count],
                          @"version" : @"3.0.6",
                          };
    
    [self POSTHttpRequest:@"http://api2.pianke.me/read/latest" dic:dic successBalck:^(id JSON) {
        
        if ([JSON[@"result"] integerValue]) {
            PKReadLatestModel *model = [[PKReadLatestModel alloc] initWithDictionary:JSON];
            
            [self.tableSource addObjectsFromArray:model.data.list];
            [self.cellHeights addObjectsFromArray:[NSArray readCellHeightsWithModels:model.data.list]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
        [self.tableView.mj_footer endRefreshing];
        
    } errorBlock:^(NSError *error) {
        [self.tableView.mj_footer endRefreshing];
        
    }];
}


//上下拉刷新  hot
- (void)mjRefreshHot {
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(hotPostForInfo)];
    
    // 设置普通状态的动画图片
    [header setImages:@[[UIImage imageNamed:@"pullRefresh"]] forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:@[[UIImage imageNamed:@"loading"]] forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    
    header.stateLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    
    
    // 设置header
    self.hotTableView.mj_header = header;
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(hotLoadMoreTableViewData)];
    
    // 设置刷新图片
    [footer setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    
    footer.refreshingTitleHidden = YES;
    footer.stateLabel.hidden = YES;
    //    [footer setTitle:@"dsad" forState:MJRefreshStateNoMoreData];
    
    // 设置尾部
    self.hotTableView.mj_footer = footer;
    
}
- (void)hotPostForInfo {
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] objectForKey:@"auth"],
                          @"client" : @"1",
                          @"deviceid" : @"4CC25C98-110E-4B23-89A6-7EABFB660807",
                          @"limit" : @"10",
                          @"sort" : @"hot",
                          @"start" : @"0",
                          @"version" : @"3.0.6",
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/read/latest" dic:dic successBalck:^(id JSON) {
        
        if ([JSON[@"result"] integerValue]) {
            PKReadLatestModel *model = [[PKReadLatestModel alloc] initWithDictionary:JSON];
            
            self.hotTableSource = [NSMutableArray arrayWithArray:model.data.list];
            self.hotCellHeights = [NSArray readCellHeightsWithModels:model.data.list];
            self.hotTableView.cellModels = self.hotTableSource;
            self.hotTableView.cellHeights = self.hotCellHeights;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.hotTableView reloadData];
            });
        }
        [self.hotTableView.mj_header endRefreshing];
    } errorBlock:^(NSError *error) {
        [self.hotTableView.mj_header endRefreshing];
    }];
}
- (void)hotLoadMoreTableViewData {
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] objectForKey:@"auth"],
                          @"client" : @"1",
                          @"deviceid" : @"4CC25C98-110E-4B23-89A6-7EABFB660807",
                          @"limit" : @"10",
                          @"sort" : @"hot",
                          @"start" : [NSString stringWithFormat:@"%ld",self.cellHeights.count],
                          @"version" : @"3.0.6",
                          };
    
    [self POSTHttpRequest:@"http://api2.pianke.me/read/latest" dic:dic successBalck:^(id JSON) {
        
        if ([JSON[@"result"] integerValue]) {
            PKReadLatestModel *model = [[PKReadLatestModel alloc] initWithDictionary:JSON];
            
            [self.hotTableSource addObjectsFromArray:model.data.list];
            [self.hotCellHeights addObjectsFromArray:[NSArray readCellHeightsWithModels:model.data.list]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.hotTableView reloadData];
            });
        }
        [self.hotTableView.mj_footer endRefreshing];
        
    } errorBlock:^(NSError *error) {
        [self.hotTableView.mj_footer endRefreshing];
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backBtnAction {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {
        [self.naviBar addtimeBtnAction:self.naviBar.addtimeButton];
    }else {
        [self.naviBar hotBtnAction:self.naviBar.hotButton];
    }
}

- (void)addBtnAct {
    [UIView animateWithDuration:0.3 animations:^{
        [self.backScrollView setContentOffset:CGPointMake(0, 0)];
    }];
}
- (void)hotBtnAct {
    [UIView animateWithDuration:0.3 animations:^{
        [self.backScrollView setContentOffset:CGPointMake(VIEW_WIDTH, 0)];
    }];
}

#pragma mark - PKReadLatestTableViewDelegate
- (void)pushToArticleVCWithContentid:(NSString *)contentid {
    PKReadArticleViewController *articleVC = [[PKReadArticleViewController alloc] init];
    articleVC.contentid = contentid;
    [self.navigationController pushViewController:articleVC animated:YES];
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
