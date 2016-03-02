//
//  PKBaseViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKBaseViewController.h"



@interface PKBaseViewController ()

@end

@implementation PKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

- (void)AddBackItemBtn{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithNormalIcon:@"" highlightedIcon:@"" target:self action:@selector(backView)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)GETHttpRequest:(NSString *)url
                   dic:(NSDictionary *)dic
          successBlock:(HttpSuccessBlock)RequestSuccess
            errorBlock:(HttpErrorBlock)RequestError{
    WS(ws);
    //显示等待动画
    [JPRefreshView showJPRefreshFromView:self.view];
    [ZJPBaseHttpTool getWithPath:url params:dic success:^(id JSON) {
        if (RequestSuccess) {
            RequestSuccess(JSON);
            //移除等待动画
            [JPRefreshView removeJPRefreshFromView:ws.view];
        }
    } failure:^(NSError *error) {
        if (RequestError) {
            RequestError(error);
            [JPRefreshView removeJPRefreshFromView:ws.view];
        }
    }];
}

- (void)POSTHttpRequest:(NSString *)url
                    dic:(NSDictionary *)dic
           successBalck:(HttpSuccessBlock)RequestSuccess
             errorBlock:(HttpErrorBlock)RequestError
{
//    WS(ws);
//    [JPRefreshView showJPRefreshFromView:self.view];
    [ZJPBaseHttpTool postWithPath:url params:dic success:^(id JSON) {
        if (RequestSuccess) {
            RequestSuccess(JSON);
//            [JPRefreshView removeJPRefreshFromView:ws.view];
        }
    } failure:^(NSError *error) {
        if (RequestError) {
            RequestError(error);
//            [JPRefreshView removeJPRefreshFromView:ws.view];
        }
    }];
}

- (void)setNavigationBarWithTitle:(NSString *)title {
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 20)];
    [topView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:topView];
    
    UIView *backView = [[UIView alloc] init];
    [backView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:backView];
    
    UIButton *sideMenuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sideMenuBtn setImage:[UIImage imageNamed:@"sidemenu"] forState:UIControlStateNormal];
    [sideMenuBtn addTarget:self action:@selector(showSideMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sideMenuBtn];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    [nameLabel setText:title];
    [nameLabel setTextColor:[UIColor blackColor]];
    [nameLabel setFont:[UIFont systemFontOfSize:15]];
    [self.view addSubview:nameLabel];
    
    UILabel *line1 = [[UILabel alloc] init];
    [line1 setBackgroundColor:RGB(221, 221, 221)];
    [self.view addSubview:line1];
    
    UILabel *line2 = [[UILabel alloc] init];
    [line2 setBackgroundColor:RGB(221, 221, 221)];
    [self.view addSubview:line2];
    
    UILabel *line3 = [[UILabel alloc] init];
    [line3 setBackgroundColor:RGB(221, 221, 221)];
    [self.view addSubview:line3];
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.top.equalTo(ws.view.mas_top).offset(20);
        make.height.equalTo(45);
    }];
    [sideMenuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left).offset(15);
        make.bottom.equalTo(backView.mas_bottom).offset(-15);
        make.size.equalTo(CGSizeMake(18, 18));
    }];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left);
        make.top.equalTo(ws.view.mas_top).offset(20);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(1);
    }];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.mas_bottom);
        make.bottom.equalTo(backView.mas_bottom);
        make.width.equalTo(1);
        make.left.equalTo(sideMenuBtn.mas_right).offset(15);
    }];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sideMenuBtn.mas_centerY);
        make.left.equalTo(line1.mas_right).offset(5);
    }];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left);
        make.bottom.equalTo(backView.mas_bottom);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(1);
    }];
    
}

- (void)showSideMenu {
    [self.sideMenuViewController presentLeftMenuViewController];
}



- (void)didReceiveMemoryWarning {
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
