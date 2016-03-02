//
//  PKReadArticleViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/24.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadArticleViewController.h"
#import "PKReadArticleModel.h"
#import "PKReadArticleNavigationBar.h"
#import "PKReadArticleAuthorView.h"
#import "NSString+Helper.h"


@interface PKReadArticleViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) PKReadArticleNavigationBar *naviBar;
@property (nonatomic,strong) UIScrollView *backScrollView;
@property (nonatomic,strong) UIWebView *htmlView;
@property (nonatomic,assign) CGFloat htmlHeight;
@property (nonatomic,strong) PKReadArticleAuthorView *authorView;
@property (nonatomic,strong) PKReadArticleUserinfo *authorModel;
@property (nonatomic,assign) CGFloat authorViewHeight;


@end

@implementation PKReadArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:RGB(221, 221, 221)];
    
    _naviBar = [[PKReadArticleNavigationBar alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 65)];
    [_naviBar.backButton addTarget:self action:@selector(popTorootVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_naviBar];
    
    _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, VIEW_HEIGHT - 65)];
    [self.view addSubview:_backScrollView];
    [_backScrollView setContentOffset:CGPointZero];
    
    _htmlView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 1)];
    _htmlView.delegate = self;
    _htmlView.scrollView.scrollEnabled = NO;
    _htmlView.opaque = NO;
    [self.backScrollView addSubview:_htmlView];
    
    
    [self postForInfo];
    
}

- (void)postForInfo {
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] objectForKey:@"auth"],
                          @"client" : @"1",
                          @"contentid" : self.contentid,
                          @"deviceid" : @"4CC25C98-110E-4B23-89A6-7EABFB660807",
                          @"version" : @"3.0.6"
                          };
    WS(ws);
    [self POSTHttpRequest:@"http://api2.pianke.me/article/info" dic:dic successBalck:^(id JSON) {
        if ([JSON[@"result"] integerValue]) {
            PKReadArticleModel *model = [[PKReadArticleModel alloc] initWithDictionary:JSON];
            
            NSString *htmlString = [self getHtmlString:model.data.html];
            
            self.authorModel = model.data.userinfo;
//            self.authorViewHeight = [NSString autoHeightWithString:self.authorModel.desc Width:VIEW_WIDTH - 80 Font:[UIFont systemFontOfSize:15]];
            self.authorViewHeight = [NSString DIYAutoHeightWithString:self.authorModel.desc Width:VIEW_WIDTH-80 Font:[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_naviBar.likeNumber setText:[NSString stringWithFormat:@"%ld",model.data.counterList.like]];
                [_naviBar.commentNumber setText:[NSString stringWithFormat:@"%ld",model.data.counterList.comment]];
                [ws.htmlView loadHTMLString:htmlString baseURL:nil];
                
            });
            
        }
        
    } errorBlock:^(NSError *error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)popTorootVC {
    [self.navigationController popViewControllerAnimated:YES];
}

//微调获得的html数据
-(NSString*)getHtmlString:(NSString *)routeName{
    
    NSMutableString *tmpMutable = [NSMutableString stringWithString:routeName];
    //查找作者信息并修改文字属性
    NSRange range = [tmpMutable rangeOfString:@"<p " options:NSLiteralSearch range:NSMakeRange(0, tmpMutable.length)];
    if (range.location != NSNotFound) {
        [tmpMutable replaceCharactersInRange:range
                                  withString:@"<p style=\"color:#BBBBBB; font-size:13px; \" "];
    }
    
    //查找第一段介绍语并修改文字属性
    range = [tmpMutable rangeOfString:@"<div " options:NSLiteralSearch range:NSMakeRange(0, tmpMutable.length)];
    if (range.location != NSNotFound) {
        [tmpMutable replaceCharactersInRange:range
                                  withString:@"<div style=\"color:#9B8E7A; font-size:16px; \" "];
    }
    //查找超链接文本并修改文字属性
    range = [tmpMutable rangeOfString:@"<a " options:NSLiteralSearch range:NSMakeRange(0, tmpMutable.length)];
    if (range.location != NSNotFound) {
        [tmpMutable replaceCharactersInRange:range
                                  withString:@"<a style=\"color:#9B8E7A; text-decoration: none; \" "];
    }
    
    range = [tmpMutable rangeOfString:@"<img" options:NSBackwardsSearch range:NSMakeRange(0, tmpMutable.length)];
    //循环检索
    //查找图片并修改图片属性
    while(range.location != NSNotFound)
    {
        [tmpMutable replaceCharactersInRange:range
                                  withString:@"<img width=100% "];
        range =[tmpMutable rangeOfString:@"<img" options:NSBackwardsSearch range:NSMakeRange(0,range.location)];
    }
    //修改webView背景颜色
    range = [tmpMutable rangeOfString:@"<body" options:NSBackwardsSearch range:(NSMakeRange(0, tmpMutable.length))];
    while (range.location != NSNotFound) {
        [tmpMutable replaceCharactersInRange:range withString:@"<body bgcolor=\"#FBFBFB\" "];
        range = [tmpMutable rangeOfString:@"<body" options:NSBackwardsSearch range:NSMakeRange(0, range.location)];
    }
    
    
    return tmpMutable;
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    NSLog(@"%@",NSStringFromCGSize(webView.scrollView.contentSize));
    self.htmlHeight = webView.scrollView.contentSize.height;
    [_htmlView setFrame:CGRectMake(0, 0, VIEW_WIDTH, self.htmlHeight)];
    _authorView = [[PKReadArticleAuthorView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_htmlView.frame), VIEW_WIDTH, self.authorViewHeight + 185)];
    [self.backScrollView addSubview:_authorView];
    _authorView.model = self.authorModel;
    [_backScrollView setContentSize:CGSizeMake(VIEW_WIDTH, self.htmlHeight + _authorView.frame.size.height)];
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
