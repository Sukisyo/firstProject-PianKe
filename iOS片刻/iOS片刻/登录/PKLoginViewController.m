//
//  PKLoginViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKLoginViewController.h"
#import "PKFirstLoginView.h"
#import "PKSecondLoginView.h"
#import "PKThirdLoginView.h"
#import "PKRegisterViewController.h"


@interface PKLoginViewController ()

@property (nonatomic,strong) PKThirdLoginView *thirdView;
@property (nonatomic,strong) PKSecondLoginView *secondView;
@property (nonatomic,strong) PKFirstLoginView *firstView;

@end

@implementation PKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:RGB(251, 251, 251)];
    self.navigationController.navigationBarHidden = YES;
    
    _firstView = [[PKFirstLoginView alloc] init];
    [self.view addSubview:_firstView];
    [_firstView.arrowBtn addTarget:self action:@selector(popVCAction) forControlEvents:UIControlEventTouchUpInside];
    [_firstView.registerBtn addTarget:self action:@selector(popTOVC) forControlEvents:UIControlEventTouchUpInside];
    
    _secondView = [[PKSecondLoginView alloc] init];
    [self.view addSubview:_secondView];
    
    _thirdView = [[PKThirdLoginView alloc] init];
    [self.view addSubview:_thirdView];
    
    
    [self addAutoLayOut];
}

- (void)addAutoLayOut {
    WS(ws);
    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(160);
    }];
    [_secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.firstView.mas_bottom);
        make.bottom.equalTo(ws.thirdView.mas_top);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
    }];
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.view.mas_bottom);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(110);
    }];
}

- (void)popVCAction {
    [self dismissViewControllerAnimated:YES completion:^{
        nil;
    }];
}
- (void)popTOVC {
    PKRegisterViewController *registerVC = [[PKRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
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
