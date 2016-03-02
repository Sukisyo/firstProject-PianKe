//
//  PKRegisterViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKRegisterViewController.h"

@interface PKRegisterViewController ()

@property (nonatomic,strong) UIButton *arrowBtn;

@end

@implementation PKRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:RGB(251, 251, 251)];
    
    self.navigationController.navigationBarHidden = YES;
    _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_arrowBtn];
    [_arrowBtn setImage:[UIImage imageNamed:@"返回箭头"] forState:UIControlStateNormal];
    [_arrowBtn addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self addLayOut];
}

- (void)addLayOut {
    WS(ws);
    [_arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top).offset(35);
        make.left.equalTo(ws.view.mas_left).offset(13);
        make.size.equalTo(CGSizeMake(16, 18));
    }];
}

- (void)popVC {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
