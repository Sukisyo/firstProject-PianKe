//
//  PKSuiPianViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSuiPianViewController.h"
#import "PKSuiPianNavigationBar.h"
#import "RootClass.h"
#import "PKSuiPianCellFrameModel.h"
#import "PKSuiPianTabelView.h"
#import "UIScrollView+MJRefresh.h"
#import "PKSuiPianDetailViewController.h"



@interface PKSuiPianViewController ()<SuiPianTableViewRowDelegate>

@property (nonatomic,strong) PKSuiPianNavigationBar *naviBarView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) PKSuiPianTabelView *tableView;
@property (nonatomic,strong) NSArray *refreshingImages;
@property (nonatomic,assign) NSInteger index;


@end

@implementation PKSuiPianViewController
/**
 *  tableView的数据源
 */
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
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
//    self.view.userInteractionEnabled = YES;
    self.navigationController.navigationBar.hidden = YES;
//    self.navigationController.navigationBarHidden = YES;
    [self.view setBackgroundColor:RGB(251, 251, 251)];
    
    _naviBarView = [[PKSuiPianNavigationBar alloc] init];
//    _naviBarView.userInteractionEnabled = YES;
    [self.view addSubview:_naviBarView];
    [_naviBarView.sideMenuBtn addTarget:self action:@selector(showSideMenu) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self autoLayout];
    
    [self loadDataSource];
    
    
    _tableView = [[PKSuiPianTabelView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, VIEW_HEIGHT - 65) style:UITableViewStylePlain];
    [_tableView setBackgroundColor:RGB(251, 251, 251)];
    [self.view addSubview:_tableView];
    _tableView.tableSource = self.dataSource;
    _tableView.detailDelegate = self;
    
    [self mjRefresh];
    
}
//上下拉刷新
- (void)mjRefresh {
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadTableViewData)];

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
/**
 *  上拉刷新dataSource内容
 */
- (void)reloadTableViewData {
    
    self.index = 0;
    [self loadDataSource];
    
}
- (void)loadDataSource {
    
    NSDictionary *dic = @{
                          @"auth" : @"DJBpRynloaNDCsJyH8DulDJxQMr4Zrm2EpGZsXDJm1cWP229VKThlV6fg",
                          @"client" : @"1",
                          @"deviceid" : @"4CC25C98-110E-4B23-89A6-7EABFB660807",
                          @"limit" : @"10",
                          @"start" : [NSString stringWithFormat:@"%ld",self.index],
                          @"version" : @"3.0.6"
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/timeline/list" dic:dic successBalck:^(id JSON) {
        if ([JSON[@"result"] integerValue]) {
            RootClass *model = [[RootClass alloc] initWithDictionary:JSON];
            [self.dataSource removeAllObjects];
            for (List *list in model.data.list) {
                
                PKSuiPianCellFrameModel *model = [[PKSuiPianCellFrameModel alloc] init];
                model.suiPianList = list;
                [self.dataSource addObject:model];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
            });
        }
        [self.tableView.mj_header endRefreshing];
    } errorBlock:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        NSLog(@"%@",error);
    }];
}
/**
 *  下拉加载更多dataSource
 */
- (void)loadMoreTableViewData {
    self.index += 10;

    [self loadMoreDataSource];
}
- (void)loadMoreDataSource {
    NSDictionary *dic = @{
                          @"addtime" : [NSString stringWithFormat:@"%ld",[self.dataSource.lastObject suiPianList].addtime],
                          @"auth" : @"DJBpRynloaNDCsJyH8DulDJxQMr4Zrm2EpGZsXDJm1cWP229VKThlV6fg",
                          @"client" : @"1",
                          @"deviceid" : @"4CC25C98-110E-4B23-89A6-7EABFB660807",
                          @"limit" : @"10",
                          @"start" : [NSString stringWithFormat:@"%ld",self.index],
                          @"version" : @"3.0.6"
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/timeline/list" dic:dic successBalck:^(id JSON) {
        NSLog(@"%@",JSON[@"result"]);
        if ([JSON[@"result"] integerValue]) {
            RootClass *model = [[RootClass alloc] initWithDictionary:JSON];
            for (List *list in model.data.list) {
                
                PKSuiPianCellFrameModel *model = [[PKSuiPianCellFrameModel alloc] init];
                model.suiPianList = list;
                [self.dataSource addObject:model];
            }
            

            [self.tableView.mj_footer endRefreshing];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
            });
        }
        
    } errorBlock:^(NSError *error) {

        [self.tableView.mj_footer endRefreshing];
        NSLog(@"%@",error);
    }];
}
/**
 *  设置约束
 */
- (void)autoLayout {
    WS(ws);
    [_naviBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(65);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.naviBarView.mas_bottom);
        make.bottom.equalTo(ws.view.mas_bottom);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
    }];
}
/**
 *  弹出sideMenu方法
 */
- (void)showSideMenu {
    [self.sideMenuViewController presentLeftMenuViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - SuiPianTableViewRowDelegate
- (void)pushToDetailPageWithContentid:(NSString *)contentid {
    
    PKSuiPianDetailViewController *detailVC = [[PKSuiPianDetailViewController alloc] init];
    detailVC.contentid = contentid;
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
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
