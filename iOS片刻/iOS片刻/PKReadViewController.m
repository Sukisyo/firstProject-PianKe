//
//  PKReadViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/20.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadViewController.h"
#import "PKReadModel.h"
#import "DCScrollView.h"
#import "PKReadListsView.h"
#import "PKReadListDetailController.h"
#import "PKReadLatestViewController.h"
#import "PKReadArticleViewController.h"

@interface PKReadViewController ()<PKReadListDetailDelegate,PostForInfoDelegate>

@property (nonatomic,strong) UIScrollView *backScrollView;
//@property (nonatomic,strong) NSMutableArray *scrollImageUrlStrings;
@property (nonatomic,strong) PKReadListsView *listsView;

@end

@implementation PKReadViewController

//- (NSMutableArray *)scrollImageUrlStrings {
//    if (!_scrollImageUrlStrings) {
//        _scrollImageUrlStrings = [[NSMutableArray alloc] init];
//    }
//    return _scrollImageUrlStrings;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setNavigationBarWithTitle:@"阅读"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 65, VIEW_WIDTH, VIEW_HEIGHT - 65)];
    [_backScrollView setContentOffset:CGPointZero];
    [self.view addSubview:_backScrollView];
    
    [self postInfoForView];
    
}


- (void)postInfoForView {
    NSDictionary *dic = @{
                          @"auth" : [[NSUserDefaults standardUserDefaults] valueForKey:@"auth"],
                          @"client" : @"1",
                          @"deviceid" : @"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"version" : @"3.0.6"
                          };
    [self POSTHttpRequest:@"http://api2.pianke.me/read/columns" dic:dic successBalck:^(id JSON) {
        
        if ([JSON[@"result"] integerValue]) {
//            NSLog(@"请求成功");
            PKReadModel *readModel = [[PKReadModel alloc] initWithDictionary:JSON];
            
//            for (PKReadCarousel *carousel in readModel.data.carousel) {
//                NSString *str = carousel.img;
//                [self.scrollImageUrlStrings addObject:str];
//            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                DCScrollView *scrollView = [[DCScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 160) andImageUrls:readModel.data.carousel];
                [_backScrollView addSubview:scrollView];
                scrollView.delegate = self;
                _listsView = [[PKReadListsView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollView.frame), VIEW_WIDTH, VIEW_WIDTH + 104) andLists:readModel.data.list];
                [_listsView.writingBtn addTarget:self action:@selector(pushToLatestVC) forControlEvents:UIControlEventTouchUpInside];
                _listsView.delegate = self;
                [_backScrollView addSubview:_listsView];
                [_backScrollView setContentSize:CGSizeMake(VIEW_WIDTH, scrollView.frame.size.height + _listsView.frame.size.height)];
            });

        }
        
    } errorBlock:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushToLatestVC {
    PKReadLatestViewController *latestVC = [[PKReadLatestViewController alloc] init];
    [self.navigationController pushViewController:latestVC animated:YES];
}

#pragma mark - PKReadListDetailDelegate
- (void)pushToListDetailVCWithTypeid:(NSString *)typeId {
    PKReadListDetailController *detailVC = [[PKReadListDetailController alloc] init];
    detailVC.typeId = typeId;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - PostForInfoDelegate
- (void)postForInfoWithImageid:(NSString *)imageid {
    NSArray *arr = [imageid componentsSeparatedByString:@"/"];
    PKReadArticleViewController *articleVC = [[PKReadArticleViewController alloc] init];
    articleVC.contentid = [arr lastObject];
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
