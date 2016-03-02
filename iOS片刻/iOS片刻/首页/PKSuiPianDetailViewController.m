//
//  PKSuiPianDetailViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/20.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSuiPianDetailViewController.h"
#import "PKGoodProductDetailNaviBarView.h"
#import "PKSuiPianDetailModel.h"
#import "PKSuiPianDetailHeadView.h"
#import "UIButton+WebCache.h"
#import "PKSuiPianDetailTagView.h"
#import "PKSuiPianDetailCommentTableView.h"
#import "NSArray+SuiPianCellHeight.h"


@interface PKSuiPianDetailViewController ()<UINavigationControllerDelegate,UIWebViewDelegate>

@property (nonatomic,strong) PKGoodProductDetailNaviBarView *naviBar;
@property (nonatomic,strong) UIScrollView *backScrollView;
@property (nonatomic,strong) UIWebView *htmlView;
@property (nonatomic,strong) UITableView *commentTableView;
@property (nonatomic,strong) PKSuiPianDetailHeadView *headView;
@property (nonatomic,strong) PKSuiPianDetailTagView *tagView;
@property (nonatomic,strong) PKSuiPianDetailCommentTableView *tableView;
@property (nonatomic,strong) NSMutableArray *cellModels;
@property (nonatomic,strong) NSMutableArray *cellHeights;
@property (nonatomic,assign) CGFloat tableViewHeight;
@property (nonatomic,strong) NSArray *refreshingImages;
@property (nonatomic,assign) CGFloat htmlHeight;

@end

@implementation PKSuiPianDetailViewController

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
    [self.view setBackgroundColor:RGB(251, 251, 251)];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    [self getDetailInfo];

    _naviBar = [[PKGoodProductDetailNaviBarView alloc] init];
    [_naviBar.backButton addTarget:self action:@selector(popToRootVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_naviBar];
    
    _backScrollView = [[UIScrollView alloc] init];
    [_backScrollView setBackgroundColor:RGB(251, 251, 251)];
    [self.view addSubview:_backScrollView];
    [_backScrollView setContentOffset:CGPointZero];
    
    _htmlView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 70, VIEW_WIDTH, 1)];
    _htmlView.scrollView.scrollEnabled = NO;
    _htmlView.delegate = self;
    [self.backScrollView addSubview:_htmlView];
    
    _headView = [[PKSuiPianDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 1)];
    [self.backScrollView addSubview:_headView];
    
    _tagView = [[PKSuiPianDetailTagView alloc] init];
    [self.backScrollView addSubview:_tagView];
    
    _tableView = [[PKSuiPianDetailCommentTableView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT, VIEW_WIDTH, 1) style:UITableViewStylePlain];
    _tableView.scrollEnabled = NO;
    [self.backScrollView addSubview:_tableView];
    
    [self autoLayout];
    [self mjRefresh];
}

- (void)autoLayout {
    WS(ws);
    [_naviBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.top.equalTo(ws.view.mas_top);
        make.height.equalTo(65);
    }];
    [_backScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.view.mas_right);
        make.left.equalTo(ws.view.mas_left);
        make.top.equalTo(ws.naviBar.mas_bottom);
        make.bottom.equalTo(ws.view.mas_bottom);
        
    }];
}
- (void)getDetailInfo {
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] valueForKey:@"auth"],
                          @"client" : @"1",
                          @"contentid" : self.contentid,
                          @"deviceid" : @"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"version" : @"3.0.6"
                          };
        [self POSTHttpRequest:@"http://api2.pianke.me/timeline/info" dic:dic successBalck:^(id JSON) {
            
//            NSLog(@"%@",JSON);
            if ([JSON[@"result"] integerValue]) {
                PKSuiPianDetailModel *model = [[PKSuiPianDetailModel alloc] initWithDictionary:JSON];
                
                NSString *htmlString = [self getHtmlString:model.SPdata.html];
                self.cellModels = [NSMutableArray arrayWithArray:model.SPdata.commentlist];
                self.cellHeights = [NSArray autoCalculateHeightsWithModel:model.SPdata.commentlist];
                _tableView.cellModels = self.cellModels;
                _tableView.cellHeights = self.cellHeights;
                
                if (self.cellHeights.count) {
                    for (NSNumber *number in self.cellHeights) {
                        self.tableViewHeight += [number floatValue];
                    }
                }else {
                    self.tableViewHeight = 0;
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_naviBar.commentNumber setText:[NSString stringWithFormat:@"%ld",model.SPdata.counterList.comment]];
                    [_naviBar.likeNumber setText:[NSString stringWithFormat:@"%ld",model.SPdata.counterList.like]];
                    [_htmlView loadHTMLString:htmlString baseURL:nil];
                    [_headView.timeLabel setText:model.SPdata.addtimeF];
                    [_headView.nameLabel setText:model.SPdata.userinfo.uname];
                    [_headView.iconButton sd_setBackgroundImageWithURL:[NSURL URLWithString:model.SPdata.userinfo.icon] forState:UIControlStateNormal];
                    _tagView.model = model.SPdata.tagInfo;
                    [_tableView reloadData];
                });
                
            }
        } errorBlock:^(NSError *error) {
            
            NSLog(@"%@",error);
            
        }];
}

//上下拉刷新
- (void)mjRefresh {
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataSource)];
    
    // 设置刷新图片
    [footer setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    
    footer.refreshingTitleHidden = YES;
    footer.stateLabel.hidden = YES;
    //    [footer setTitle:@"dsad" forState:MJRefreshStateNoMoreData];
    
    // 设置尾部
    self.backScrollView.mj_footer = footer;
}
- (void)loadMoreDataSource {
    NSDictionary *dica = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] valueForKey:@"auth"],
                          @"client" : @"1",
                          @"contentid" : self.contentid,
                          @"deviceid" : @"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"limit" : @"10",
                          @"start" : [NSString stringWithFormat:@"%ld",self.cellModels.count],
                          @"version" : @"3.0.6"
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/comment/get" dic:dica successBalck:^(id JSON) {
        if ([JSON[@"result"] integerValue]) {
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in JSON[@"data"][@"list"]) {
                PKSuiPianDetailCommentlist *list = [[PKSuiPianDetailCommentlist alloc] initWithDictionary:dic];
                [arr addObject:list];
            }
            [self.cellModels addObjectsFromArray:arr];
            [self.cellHeights addObjectsFromArray:[NSArray autoCalculateHeightsWithModel:arr]];
            self.tableViewHeight = 0;
            for (NSNumber *number in self.cellHeights) {
                self.tableViewHeight += [number floatValue];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
                [_tableView setFrame:CGRectMake(0, CGRectGetMaxY(_tagView.frame), VIEW_WIDTH, self.tableViewHeight)];
                [_backScrollView setContentSize:CGSizeMake(VIEW_WIDTH, 70 + self.htmlHeight + 40 + self.tableViewHeight)];
            });
        }
        [self.backScrollView.mj_footer endRefreshing];
    } errorBlock:^(NSError *error) {
        [self.backScrollView.mj_footer endRefreshing];
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)popToRootVC {
    [self.navigationController popViewControllerAnimated:YES];
}


//微调获得的html数据
-(NSString*)getHtmlString:(NSString *)routeName{
    
    NSMutableString *tmpMutable = [NSMutableString stringWithString:routeName];
    
    NSRange range = [tmpMutable rangeOfString:@"<img" options:NSBackwardsSearch range:NSMakeRange(0, tmpMutable.length)];
    //循环检索
    while(range.location != NSNotFound)
    {
        [tmpMutable replaceCharactersInRange:range
                                  withString:@"<img width=100% "];
        range =[tmpMutable rangeOfString:@"<img" options:NSBackwardsSearch range:NSMakeRange(0,range.location)];
    }
    
    range = [tmpMutable rangeOfString:@"<body" options:NSBackwardsSearch range:(NSMakeRange(0, tmpMutable.length))];
    while (range.location != NSNotFound) {
        [tmpMutable replaceCharactersInRange:range withString:@"<body bgcolor=\"#FBFBFB\" "];
        range = [tmpMutable rangeOfString:@"<body" options:NSBackwardsSearch range:NSMakeRange(0, range.location)];
    }
    
    
    return tmpMutable;
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    self.htmlHeight = webView.scrollView.contentSize.height;
    
    
    [_htmlView setFrame:CGRectMake(0, 70, VIEW_WIDTH, self.htmlHeight)];
    [_tagView setFrame:CGRectMake(0, CGRectGetMaxY(_htmlView.frame), VIEW_WIDTH, 40)];
    [_tableView setFrame:CGRectMake(0, CGRectGetMaxY(_tagView.frame), VIEW_WIDTH, self.tableViewHeight)];
    if (70 + self.htmlHeight + 40 + self.tableViewHeight < VIEW_HEIGHT - 65) {
        [_backScrollView setContentSize:CGSizeMake(VIEW_WIDTH, VIEW_HEIGHT - 65 + 1)];
    }else {
        [_backScrollView setContentSize:CGSizeMake(VIEW_WIDTH, 70 + self.htmlHeight + 40 + self.tableViewHeight)];
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
