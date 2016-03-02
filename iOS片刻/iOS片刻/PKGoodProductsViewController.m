//
//  PKGoodProductsViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/20.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKGoodProductsViewController.h"
#import "PKGoodProduct.h"
#import "PKGoodProductModel.h"
#import "PKGoodProductDetailViewController.h"

@interface PKGoodProductsViewController ()<PKGoodProductTableViewDelegate>

@property (nonatomic,assign) NSInteger start;
@property (nonatomic,strong) PKGoodProduct *tableView;
@property (nonatomic,strong) NSArray *refreshingImages;


@end

@implementation PKGoodProductsViewController

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
    self.navigationController.navigationBar.hidden = YES;
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setNavigationBarWithTitle:@"良品"];
    
    _tableView = [[PKGoodProduct alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, VIEW_HEIGHT - 65) style:UITableViewStylePlain];
    _tableView.pushDelegate = self;
    [self.view addSubview:_tableView];
    
    self.start = 0;
    [self postForInfo];
    
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
 *  上拉刷新
 */
- (void)reloadTableViewData {
    self.start = 0;
    [self postForInfo];
}
- (void)postForInfo {
    
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] valueForKey:@"auth"],
                          @"client" : @"1",
                          @"deviceid" : @"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"limit" : @"10",
                          @"start" : [NSString stringWithFormat:@"%ld",self.start],
                          @"version" : @"3.0.6"
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/pub/shop" dic:dic successBalck:^(id JSON) {
        
        if ([JSON[@"result"] integerValue]) {
            if (_tableView.tableSource.count != 0) {
//                [_tableView.tableSource removeAllObjects];
                _tableView.tableSource = nil;
            }
            PKGoodProductModel *model = [[PKGoodProductModel alloc] initWithDictionary:JSON];
            
            _tableView.tableSource = [NSMutableArray arrayWithArray:model.data.list];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
            });
            
        }
        [self.tableView.mj_header endRefreshing];
    } errorBlock:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.view makeToast:@"网络连接失败，请稍后再试" duration:1 position:@"center"];
    }];
    
}
/**
 *  下拉刷新
 */
- (void)loadMoreTableViewData {
    self.start += 10;
    [self postMoreInfo];
}
- (void)postMoreInfo {
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] valueForKey:@"auth"],
                          @"client" : @"1",
                          @"deviceid" : @"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"limit" : @"10",
                          @"start" : [NSString stringWithFormat:@"%ld",self.start],
                          @"version" : @"3.0.6"
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/pub/shop" dic:dic successBalck:^(id JSON) {
        
        if ([JSON[@"result"] integerValue]) {

            PKGoodProductModel *model = [[PKGoodProductModel alloc] initWithDictionary:JSON];
            
            for (PKGoodProductList *list in model.data.list) {
                [_tableView.tableSource addObject:list];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
            });
            
        }
        [self.tableView.mj_footer endRefreshing];
    } errorBlock:^(NSError *error) {
        [self.tableView.mj_footer endRefreshing];
        [self.view makeToast:@"网络连接失败，请稍后再试" duration:1 position:@"center"];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PKGoodProductTableViewDelegate
- (void)pushToDetailVCWithContentid:(NSString *)contentid {
    PKGoodProductDetailViewController *detailVC = [[PKGoodProductDetailViewController alloc] init];
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
