//
//  PKGoodProductDetailViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/21.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKGoodProductDetailViewController.h"
#import "PKGoodProductDetailNaviBarView.h"
#import "PKGoodProductDetailModel.h"
#import "PKGoodProductDetailPostView.h"
#import "PKGoodProductDetailCommentView.h"
#import "PKGoodProductCommentTableView.h"
#import "NSArray+cellHeight.h"

@interface PKGoodProductDetailViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) PKGoodProductDetailNaviBarView *naviBar;
@property (nonatomic,strong) NSArray *commentList;
@property (nonatomic,strong) PKGoodProductDetailPostsinfo *postModel;
@property (strong, nonatomic)                   UIWebView *htmlWebView;
@property (nonatomic,strong) UIScrollView *backScrollView;
@property (nonatomic,strong) PKGoodProductDetailPostView *headView;
@property (nonatomic,assign) CGFloat headViewTitleHeight;
@property (nonatomic,strong) PKGoodProductDetailCommentView *commentView;

@property (nonatomic,strong) PKGoodProductCommentTableView *commentTableView;
@property (nonatomic,strong) NSMutableArray *cellHeights;
@property (nonatomic,strong) NSMutableArray *cellModels;
@property (nonatomic,strong) NSArray *refreshingImages;
@property (nonatomic,assign) CGFloat commentTableViewHeight;
@property (nonatomic,assign) CGFloat htmlHeight;

@end

@implementation PKGoodProductDetailViewController

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

- (NSMutableArray *)cellHeights {
    if (!_cellHeights) {
        _cellHeights = [[NSMutableArray alloc] init];
    }
    return _cellHeights;
}
- (NSMutableArray *)cellModels {
    if (!_cellModels) {
        _cellModels = [[NSMutableArray alloc] init];
    }
    return _cellModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor cyanColor]];
//    self.navigationController.navigationBarHidden = NO;
    _naviBar = [[PKGoodProductDetailNaviBarView alloc] init];
    [_naviBar.backButton addTarget:self action:@selector(popToSuperVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_naviBar];

    //创建底部scrollView
    _backScrollView = [[UIScrollView alloc] init];
    [_backScrollView setBackgroundColor:[UIColor whiteColor]];
    _backScrollView.userInteractionEnabled = YES;
    [_backScrollView setContentOffset:CGPointZero];
    [_backScrollView setBackgroundColor:RGB(251, 251, 251)];
    [self.view addSubview:_backScrollView];
    
    //创建头部view
    _headView = [[PKGoodProductDetailPostView alloc] init];
    [self.backScrollView addSubview:_headView];
    
    //创建webView
    _htmlWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 200, VIEW_WIDTH, VIEW_HEIGHT)];
    [_htmlWebView setBackgroundColor:[UIColor clearColor]];
    _htmlWebView.opaque = NO;
    _htmlWebView.delegate = self;
    _htmlWebView.scrollView.scrollEnabled = NO;
    [_backScrollView addSubview:self.htmlWebView];
    
    //创建底部评论顺序view
    _commentView = [[PKGoodProductDetailCommentView alloc] init];
    [self.backScrollView addSubview:_commentView];
    
    //创建底部评论tableView
    _commentTableView = [[PKGoodProductCommentTableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 1) style:UITableViewStylePlain];
    _commentTableView.scrollEnabled = NO;
    [self.backScrollView addSubview:_commentTableView];
    
    [self autoLayOut];
    [self postForInfo];
    [self mjRefresh];
    
}
//网络请求数据
- (void)postForInfo {
    
    WS(ws);
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] valueForKey:@"auth"],
                          @"client" : @"1",
                          @"contentid" : self.contentid,
                          @"deviceid" : @"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"version" : @"3.0.6",
                          };
    
    [self POSTHttpRequest:@"http://api2.pianke.me/group/posts_info" dic:dic successBalck:^(id JSON) {
        
        if ([JSON[@"result"] integerValue]) {
            
            PKGoodProductDetailModel *model = [[PKGoodProductDetailModel alloc] initWithDictionary:JSON];
            ws.commentList = model.data.commentlist;
            ws.postModel = model.data.postsinfo;
            
            NSString *htmlString = [self getHtmlString:ws.postModel.html];
            
            self.cellModels = [NSMutableArray arrayWithArray:model.data.commentlist];
            self.cellHeights = [NSArray autoCalculateHeightsWithModel:model.data.commentlist];
            _commentTableView.cellHeights = self.cellHeights;
            _commentTableView.cellModels = self.cellModels;
            
            self.commentTableViewHeight = 0;
            for (NSDictionary *dic in self.cellHeights) {
                self.commentTableViewHeight += [[dic valueForKey:@"cellHeight"] floatValue];
            }

            dispatch_async(dispatch_get_main_queue(), ^{
                
                _naviBar.likeNumber.text = [NSString stringWithFormat:@"%ld",self.postModel.counterList.like];
                _naviBar.commentNumber.text = [NSString stringWithFormat:@"%ld",self.postModel.counterList.comment];
                [ws.htmlWebView loadHTMLString:htmlString baseURL:nil];
                _headView.model = model.data.postsinfo;
                
                [_commentTableView reloadData];
            });
            
        }
        
    } errorBlock:^(NSError *error) {
        
    }];
    
}
//对各控件进行约束
- (void)autoLayOut {
    WS(ws);
    [_naviBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.top.equalTo(ws.view.mas_top);
        make.height.equalTo(65);
    }];
    [_backScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.naviBar.mas_bottom);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.backScrollView.mas_top);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(200);
    }];
    [_commentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.top.equalTo(ws.htmlWebView.mas_bottom);
        make.height.equalTo(51);
    }];

}

//返回按钮的退栈方法
- (void)popToSuperVC {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//微调获得的html数据
-(NSString*)getHtmlString:(NSString *)routeName{
    
    NSMutableString *tmpMutable = [NSMutableString stringWithString:routeName];

    NSLog(@"%@",tmpMutable);
    
    NSRange range = [tmpMutable rangeOfString:@"<a " options:NSBackwardsSearch range:NSMakeRange(0, tmpMutable.length)];
    //循环检索
    while(range.location != NSNotFound)
    {
        [tmpMutable replaceCharactersInRange:range
                                  withString:@"<a style=\"background:#7CC03B; color:white; line-height:35px; text-align:center; width:auto; text-decoration: none; border-radius:25px; height:50x; display:block;\" "];
        range =[tmpMutable rangeOfString:@"<a " options:NSBackwardsSearch range:NSMakeRange(0,range.location)];
    }
    
    range = [tmpMutable rangeOfString:@"<img" options:NSBackwardsSearch range:NSMakeRange(0, tmpMutable.length)];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    _htmlHeight = webView.scrollView.contentSize.height;
    [_htmlWebView setFrame:CGRectMake(0, 200, VIEW_WIDTH, _htmlHeight)];

    [_commentTableView setFrame:CGRectMake(0, CGRectGetMaxY(_htmlWebView.frame) + 51, VIEW_WIDTH, self.commentTableViewHeight)];
    [_backScrollView setContentSize:CGSizeMake(VIEW_WIDTH, _htmlHeight + 200 + 51 + self.commentTableViewHeight)];
    

}

//下拉刷新
- (void)mjRefresh {
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTableViewData)];
    
    // 设置刷新图片
    [footer setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    
    footer.refreshingTitleHidden = YES;
    footer.stateLabel.hidden = YES;
    //    [footer setTitle:@"dsad" forState:MJRefreshStateNoMoreData];
    
    // 设置尾部
    self.backScrollView.mj_footer = footer;
    
}
//下拉请求数据
- (void)loadMoreTableViewData {
    WS(ws);
//    NSLog(@"----%@",[NSString stringWithFormat:@"%ld",self.cellModels.count]);
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] valueForKey:@"auth"],
                          @"client" : @"1",
                          @"contentid" : self.contentid,
                          @"deviceid" : @"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"limit" : @"10",
                          @"sort" : @"desc",
                          @"start" : [NSString stringWithFormat:@"%ld",self.cellModels.count],
                          @"version" : @"3.0.6",
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/group/posts_comment" dic:dic successBalck:^(id JSON) {
        
        if ([JSON[@"result"] integerValue]) {
            
//            NSLog(@"%@",JSON);
//            PKGoodProductDetailModel *model = [[PKGoodProductDetailModel alloc] initWithDictionary:JSON];
//            NSLog(@"commentlist%ld",model.data.commentlist.count);
            for (NSDictionary *dic in JSON[@"data"][@"list"]) {
                PKGoodProductDetailCommentlist *list = [[PKGoodProductDetailCommentlist alloc] initWithDictionary:dic];
                [ws.cellModels addObject:list];
            }
            NSMutableArray *listArr = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in JSON[@"data"][@"list"]) {
                PKGoodProductDetailCommentlist *list = [[PKGoodProductDetailCommentlist alloc] initWithDictionary:dic];
                [listArr addObject:list];
            }
            NSMutableArray *arr = [NSArray autoCalculateHeightsWithModel:listArr];
            for (NSDictionary *dic in arr) {
                [ws.cellHeights addObject:dic];
                NSLog(@"%f",[[dic valueForKey:@"cellHeight"] floatValue]);
                self.commentTableViewHeight += [[dic valueForKey:@"cellHeight"] floatValue];
            }
//            NSLog(@"%ld",ws.cellHeights.count);
            dispatch_async(dispatch_get_main_queue(), ^{
                [_commentTableView setFrame:CGRectMake(0, CGRectGetMaxY(_htmlWebView.frame) + 51, VIEW_WIDTH, self.commentTableViewHeight)];
                [_backScrollView setContentSize:CGSizeMake(VIEW_WIDTH, _htmlHeight + 200 + 51 + self.commentTableViewHeight)];
                [ws.commentTableView reloadData];
            });
            
        }
        [ws.backScrollView.mj_footer endRefreshing];
        
    } errorBlock:^(NSError *error) {
        [ws.backScrollView.mj_footer endRefreshing];
        [ws.view makeToast:@"网络连接失败，请稍后再试" duration:1 position:@"center"];
    }];
    
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
